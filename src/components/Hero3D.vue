<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'
import * as THREE from 'three'
import gsap from 'gsap'

const canvasContainer = ref<HTMLDivElement | null>(null)

let scene: THREE.Scene
let camera: THREE.PerspectiveCamera
let renderer: THREE.WebGLRenderer
let animationFrameId: number

// 3D Objects
let mainGroup: THREE.Group
let crystalCore: THREE.Mesh
let crystalWireframe: THREE.LineSegments
let floatingShards: THREE.Mesh[] = []
let dustParticles: THREE.Points

// Interactive values
let mouseX = 0
let mouseY = 0
let targetMouseX = 0
let targetMouseY = 0
let scrollProgress = 0

const onMouseMove = (event: MouseEvent) => {
  const halfX = window.innerWidth / 2
  const halfY = window.innerHeight / 2
  targetMouseX = (event.clientX - halfX) / halfX
  targetMouseY = (event.clientY - halfY) / halfY
}

const onTouchMove = (event: TouchEvent) => {
  if (event.touches.length > 0) {
    const touch = event.touches[0]
    const halfX = window.innerWidth / 2
    const halfY = window.innerHeight / 2
    targetMouseX = (touch.clientX - halfX) / halfX
    targetMouseY = (touch.clientY - halfY) / halfY
  }
}

const onScroll = () => {
  const maxScroll = document.documentElement.scrollHeight - window.innerHeight
  if (maxScroll > 0) {
    scrollProgress = window.scrollY / maxScroll
  }
}

const onWindowResize = () => {
  if (!canvasContainer.value || !renderer || !camera) return
  const width = window.innerWidth
  const height = window.innerHeight
  camera.aspect = width / height
  camera.updateProjectionMatrix()
  renderer.setSize(width, height)
  renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))
}

const initThree = () => {
  if (!canvasContainer.value) return

  const width = window.innerWidth
  const height = window.innerHeight

  // 1. Scene
  scene = new THREE.Scene()
  scene.fog = new THREE.FogExp2(0x030712, 0.025)

  // 2. Camera
  camera = new THREE.PerspectiveCamera(45, width / height, 0.1, 1000)
  camera.position.set(0, 0, 22)

  // 3. Renderer with transparent alpha for igloo.inc matte void
  renderer = new THREE.WebGLRenderer({ alpha: true, antialias: true })
  renderer.setSize(width, height)
  renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))
  renderer.toneMapping = THREE.ACESFilmicToneMapping
  renderer.toneMappingExposure = 1.2
  canvasContainer.value.appendChild(renderer.domElement)

  // 4. Studio Lighting (Atmospheric Ice Void)
  const ambientLight = new THREE.AmbientLight(0x051329, 3)
  scene.add(ambientLight)

  const cyanKeyLight = new THREE.PointLight(0x38bdf8, 80, 100)
  cyanKeyLight.position.set(12, 14, 18)
  scene.add(cyanKeyLight)

  const violetRimLight = new THREE.PointLight(0x818cf8, 60, 100)
  violetRimLight.position.set(-14, -12, -8)
  scene.add(violetRimLight)

  const blueFillLight = new THREE.DirectionalLight(0x1d4ed8, 2.5)
  blueFillLight.position.set(0, -10, 15)
  scene.add(blueFillLight)

  // 5. Main 3D Crystal Cluster (igloo.inc style)
  mainGroup = new THREE.Group()
  scene.add(mainGroup)

  // 5a. Central Translucent Crystal Polyhedron
  const crystalGeo = new THREE.IcosahedronGeometry(5.2, 0)
  const crystalMat = new THREE.MeshPhysicalMaterial({
    color: 0x0c214d,
    emissive: 0x05112e,
    roughness: 0.15,
    metalness: 0.2,
    transmission: 0.6,
    ior: 1.45,
    flatShading: true,
    transparent: true,
    opacity: 0.88,
    reflectivity: 0.9
  })
  crystalCore = new THREE.Mesh(crystalGeo, crystalMat)
  mainGroup.add(crystalCore)

  // 5b. Glowing Crystalline Wireframe Structure
  const wireGeo = new THREE.WireframeGeometry(new THREE.IcosahedronGeometry(5.35, 0))
  const wireMat = new THREE.LineBasicMaterial({
    color: 0x38bdf8,
    transparent: true,
    opacity: 0.65,
    blending: THREE.AdditiveBlending
  })
  crystalWireframe = new THREE.LineSegments(wireGeo, wireMat)
  mainGroup.add(crystalWireframe)

  // 5c. Secondary Orbiting Ice Shards
  const shardCount = 18
  const shardMat = new THREE.MeshStandardMaterial({
    color: 0x1e3a8a,
    emissive: 0x0ea5e9,
    emissiveIntensity: 0.2,
    roughness: 0.2,
    metalness: 0.7,
    flatShading: true,
    transparent: true,
    opacity: 0.75
  })

  for (let i = 0; i < shardCount; i++) {
    const isOcta = i % 2 === 0
    const shardGeo = isOcta ? new THREE.OctahedronGeometry(0.8 + Math.random() * 0.9) : new THREE.TetrahedronGeometry(0.9 + Math.random() * 0.8)
    const shard = new THREE.Mesh(shardGeo, shardMat)

    const angle = (i / shardCount) * Math.PI * 2
    const radius = 7.5 + Math.random() * 4.5
    const heightSpread = (Math.random() - 0.5) * 8

    shard.position.set(
      Math.cos(angle) * radius,
      heightSpread,
      Math.sin(angle) * radius
    )

    shard.rotation.set(
      Math.random() * Math.PI,
      Math.random() * Math.PI,
      Math.random() * Math.PI
    )

    // Store custom orbital parameters
    shard.userData = {
      baseAngle: angle,
      radius: radius,
      speed: (0.15 + Math.random() * 0.2) * (i % 2 === 0 ? 1 : -1),
      rotSpeedX: 0.01 + Math.random() * 0.02,
      rotSpeedY: 0.015 + Math.random() * 0.02,
      yOffset: heightSpread
    }

    floatingShards.push(shard)
    mainGroup.add(shard)
  }

  // 5d. Ambient Starlight Dust Particles
  const dustCount = 200
  const dustCoords: number[] = []
  for (let i = 0; i < dustCount; i++) {
    dustCoords.push(
      (Math.random() - 0.5) * 45,
      (Math.random() - 0.5) * 40,
      (Math.random() - 0.5) * 40
    )
  }
  const dustGeo = new THREE.BufferGeometry()
  dustGeo.setAttribute('position', new THREE.Float32BufferAttribute(dustCoords, 3))
  const dustMat = new THREE.PointsMaterial({
    color: 0x93c5fd,
    size: 0.12,
    transparent: true,
    opacity: 0.6,
    blending: THREE.AdditiveBlending
  })
  dustParticles = new THREE.Points(dustGeo, dustMat)
  scene.add(dustParticles)

  // 6. Listeners
  window.addEventListener('resize', onWindowResize)
  window.addEventListener('mousemove', onMouseMove)
  window.addEventListener('touchmove', onTouchMove, { passive: true })
  window.addEventListener('scroll', onScroll, { passive: true })
  onScroll()

  // 7. Cinematic Intro Animation with GSAP (igloo.inc style)
  gsap.from(mainGroup.scale, {
    x: 0.01,
    y: 0.01,
    z: 0.01,
    duration: 2.2,
    ease: 'elastic.out(1, 0.75)'
  })

  gsap.from(camera.position, {
    z: 36,
    duration: 2.4,
    ease: 'power3.out'
  })

  // 8. Animation Loop with Kinetic Scroll Physics
  let clock = new THREE.Clock()

  const animate = () => {
    animationFrameId = requestAnimationFrame(animate)
    const elapsedTime = clock.getElapsedTime()

    // Smooth mouse damping
    mouseX += (targetMouseX - mouseX) * 0.05
    mouseY += (targetMouseY - mouseY) * 0.05

    // Base autonomous rotations
    crystalCore.rotation.y = elapsedTime * 0.15
    crystalCore.rotation.x = Math.sin(elapsedTime * 0.2) * 0.15
    crystalWireframe.rotation.copy(crystalCore.rotation)

    // Orbiting floating shards
    floatingShards.forEach((shard) => {
      const u = shard.userData
      const curAngle = u.baseAngle + elapsedTime * u.speed
      shard.position.x = Math.cos(curAngle) * u.radius
      shard.position.z = Math.sin(curAngle) * u.radius
      shard.position.y = u.yOffset + Math.sin(elapsedTime * 1.2 + u.baseAngle) * 0.8
      shard.rotation.x += u.rotSpeedX
      shard.rotation.y += u.rotSpeedY
    })

    // Dust gentle floating
    dustParticles.rotation.y = elapsedTime * 0.02

    // Cinematic Scroll Transitions (igloo.inc style)
    // As user scrolls, main crystal orbits, repositions, and camera dynamically tracks
    const targetGroupX = mouseX * 2 + (scrollProgress > 0.1 ? 3.5 : 0)
    const targetGroupY = -mouseY * 1.5 - scrollProgress * 5
    const targetGroupZ = -scrollProgress * 6
    const targetRotY = elapsedTime * 0.1 + mouseX * 0.8 + scrollProgress * Math.PI * 1.2
    const targetRotX = mouseY * 0.5 + scrollProgress * 0.6

    mainGroup.position.x += (targetGroupX - mainGroup.position.x) * 0.06
    mainGroup.position.y += (targetGroupY - mainGroup.position.y) * 0.06
    mainGroup.position.z += (targetGroupZ - mainGroup.position.z) * 0.06

    mainGroup.rotation.x += (targetRotX - mainGroup.rotation.x) * 0.05
    mainGroup.rotation.y += (targetRotY - mainGroup.rotation.y) * 0.05

    renderer.render(scene, camera)
  }

  animate()
}

onMounted(() => {
  initThree()
})

onUnmounted(() => {
  if (animationFrameId) {
    cancelAnimationFrame(animationFrameId)
  }
  window.removeEventListener('resize', onWindowResize)
  window.removeEventListener('mousemove', onMouseMove)
  window.removeEventListener('touchmove', onTouchMove)
  window.removeEventListener('scroll', onScroll)

  if (scene) {
    scene.traverse((object) => {
      const item = object as any
      if (item.geometry) item.geometry.dispose()
      if (item.material) {
        if (Array.isArray(item.material)) {
          item.material.forEach((m: any) => m.dispose())
        } else {
          item.material.dispose()
        }
      }
    })
  }

  if (renderer) {
    renderer.dispose()
    if (renderer.domElement && renderer.domElement.parentElement) {
      renderer.domElement.parentElement.removeChild(renderer.domElement)
    }
  }
})
</script>

<template>
  <!-- Fixed viewport background canvas for continuous cinematic 3D journey -->
  <div ref="canvasContainer" class="fixed inset-0 w-full h-full overflow-hidden pointer-events-none z-0"></div>
</template>
