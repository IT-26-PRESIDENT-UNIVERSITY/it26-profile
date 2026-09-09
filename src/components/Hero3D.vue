<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'
import * as THREE from 'three'

const canvasContainer = ref<HTMLDivElement | null>(null)

let scene: THREE.Scene
let camera: THREE.PerspectiveCamera
let renderer: THREE.WebGLRenderer
let animationFrameId: number

// 3D Objects
let coreGroup: THREE.Group
let innerMesh: THREE.Mesh
let outerWireframe: THREE.LineSegments
let particlePoints: THREE.Points
let particleLineSegments: THREE.LineSegments

// Mouse interaction
let mouseX = 0
let mouseY = 0
let targetRotationX = 0
let targetRotationY = 0

const onMouseMove = (event: MouseEvent) => {
  const halfX = window.innerWidth / 2
  const halfY = window.innerHeight / 2
  mouseX = (event.clientX - halfX) / halfX
  mouseY = (event.clientY - halfY) / halfY
}

const onTouchMove = (event: TouchEvent) => {
  if (event.touches.length > 0) {
    const touch = event.touches[0]
    const halfX = window.innerWidth / 2
    const halfY = window.innerHeight / 2
    mouseX = (touch.clientX - halfX) / halfX
    mouseY = (touch.clientY - halfY) / halfY
  }
}

const onWindowResize = () => {
  if (!canvasContainer.value || !renderer || !camera) return
  const width = canvasContainer.value.clientWidth
  const height = canvasContainer.value.clientHeight
  camera.aspect = width / height
  camera.updateProjectionMatrix()
  renderer.setSize(width, height)
  renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))
}

const initThree = () => {
  if (!canvasContainer.value) return

  const width = canvasContainer.value.clientWidth
  const height = canvasContainer.value.clientHeight

  // 1. Scene
  scene = new THREE.Scene()

  // 2. Camera
  camera = new THREE.PerspectiveCamera(45, width / height, 0.1, 1000)
  camera.position.z = 24

  // 3. Renderer with alpha (transparent background)
  renderer = new THREE.WebGLRenderer({ alpha: true, antialias: true })
  renderer.setSize(width, height)
  renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))
  renderer.toneMapping = THREE.ACESFilmicToneMapping
  canvasContainer.value.appendChild(renderer.domElement)

  // 4. Lights
  const ambientLight = new THREE.AmbientLight(0x0a192f, 2)
  scene.add(ambientLight)

  const pointLightBlue = new THREE.PointLight(0x38bdf8, 50, 100)
  pointLightBlue.position.set(10, 12, 15)
  scene.add(pointLightBlue)

  const pointLightPurple = new THREE.PointLight(0x6366f1, 40, 100)
  pointLightPurple.position.set(-12, -10, 10)
  scene.add(pointLightPurple)

  // 5. Core 3D Cybernetic Globe Group
  coreGroup = new THREE.Group()
  scene.add(coreGroup)

  // 5a. Inner Glowing Polyhedron (Dodecahedron)
  const innerGeo = new THREE.DodecahedronGeometry(5.2, 1)
  const innerMat = new THREE.MeshStandardMaterial({
    color: 0x080b4d,
    roughness: 0.3,
    metalness: 0.8,
    wireframe: false,
    flatShading: true,
    transparent: true,
    opacity: 0.85
  })
  innerMesh = new THREE.Mesh(innerGeo, innerMat)
  coreGroup.add(innerMesh)

  // 5b. Outer Cyber Wireframe (Icosahedron)
  const wireGeo = new THREE.IcosahedronGeometry(7.2, 2)
  const wireMat = new THREE.LineBasicMaterial({
    color: 0x38bdf8,
    transparent: true,
    opacity: 0.45,
    linewidth: 1
  })
  const wireEdges = new THREE.WireframeGeometry(wireGeo)
  outerWireframe = new THREE.LineSegments(wireEdges, wireMat)
  coreGroup.add(outerWireframe)

  // 6. Floating Particle Plexus Constellation
  const particleCount = 140
  const maxDistance = 4.2
  const coords: number[] = []

  for (let i = 0; i < particleCount; i++) {
    // Distribute particles in a spherical shell around the center
    const u = Math.random()
    const v = Math.random()
    const theta = u * 2.0 * Math.PI
    const phi = Math.acos(2.0 * v - 1.0)
    const r = 7.5 + Math.random() * 4.5
    const sinPhi = Math.sin(phi)
    const x = r * sinPhi * Math.cos(theta)
    const y = r * sinPhi * Math.sin(theta)
    const z = r * Math.cos(phi)
    coords.push(x, y, z)
  }

  const pGeo = new THREE.BufferGeometry()
  pGeo.setAttribute('position', new THREE.Float32BufferAttribute(coords, 3))

  const pMat = new THREE.PointsMaterial({
    color: 0x60a5fa,
    size: 0.16,
    transparent: true,
    opacity: 0.9
  })
  particlePoints = new THREE.Points(pGeo, pMat)
  coreGroup.add(particlePoints)

  // Dynamic connecting lines between nearby points
  const linePositions: number[] = []
  for (let i = 0; i < particleCount; i++) {
    const x1 = coords[i * 3]
    const y1 = coords[i * 3 + 1]
    const z1 = coords[i * 3 + 2]
    for (let j = i + 1; j < particleCount; j++) {
      const x2 = coords[j * 3]
      const y2 = coords[j * 3 + 1]
      const z2 = coords[j * 3 + 2]
      const dx = x1 - x2
      const dy = y1 - y2
      const dz = z1 - z2
      const dist = Math.sqrt(dx * dx + dy * dy + dz * dz)
      if (dist < maxDistance) {
        linePositions.push(x1, y1, z1, x2, y2, z2)
      }
    }
  }

  const lineGeo = new THREE.BufferGeometry()
  lineGeo.setAttribute('position', new THREE.Float32BufferAttribute(linePositions, 3))
  const lineMat = new THREE.LineBasicMaterial({
    color: 0x2563eb,
    transparent: true,
    opacity: 0.22
  })
  particleLineSegments = new THREE.LineSegments(lineGeo, lineMat)
  coreGroup.add(particleLineSegments)

  // 7. Event listeners
  window.addEventListener('resize', onWindowResize)
  window.addEventListener('mousemove', onMouseMove)
  window.addEventListener('touchmove', onTouchMove, { passive: true })

  // 8. Animation Loop
  let clock = new THREE.Clock()

  const animate = () => {
    animationFrameId = requestAnimationFrame(animate)
    const elapsedTime = clock.getElapsedTime()

    // Autonomous subtle rotations
    coreGroup.rotation.y = elapsedTime * 0.12
    coreGroup.rotation.x = Math.sin(elapsedTime * 0.15) * 0.2

    innerMesh.rotation.y = -elapsedTime * 0.2
    innerMesh.rotation.z = elapsedTime * 0.15

    outerWireframe.rotation.x = -elapsedTime * 0.08
    outerWireframe.rotation.y = elapsedTime * 0.18

    // Interactive mouse damping
    targetRotationX = mouseY * 0.4
    targetRotationY = mouseX * 0.6
    coreGroup.rotation.x += (targetRotationX - coreGroup.rotation.x) * 0.05
    coreGroup.rotation.y += (targetRotationY - coreGroup.rotation.y) * 0.05

    // Subtle breathing scale
    const breath = 1 + Math.sin(elapsedTime * 1.5) * 0.02
    coreGroup.scale.set(breath, breath, breath)

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

  if (scene) {
    scene.traverse((object) => {
      if ((object as THREE.Mesh).isMesh || (object as THREE.LineSegments).isLineSegments || (object as THREE.Points).isPoints) {
        const item = object as any
        if (item.geometry) item.geometry.dispose()
        if (item.material) {
          if (Array.isArray(item.material)) {
            item.material.forEach((m: any) => m.dispose())
          } else {
            item.material.dispose()
          }
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
  <div ref="canvasContainer" class="absolute inset-0 w-full h-full overflow-hidden pointer-events-none"></div>
</template>
