<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'
import * as THREE from 'three'
import gsap from 'gsap'

const currentMode = ref<'card' | 'terminal'>('card')
const canvasContainer = ref<HTMLDivElement | null>(null)
const isDragging = ref(false)

let scene: THREE.Scene
let camera: THREE.PerspectiveCamera
let renderer: THREE.WebGLRenderer
let animationFrameId: number

// 3D Objects
let cardMesh: THREE.Mesh
let terminalGroup: THREE.Group
let activeContainer: THREE.Group

// Mouse & Drag State
let prevMouseX = 0
let prevMouseY = 0
let rotX = 0.15
let rotY = -0.2
let targetRotX = 0.15
let targetRotY = -0.2
let floatOffset = 0

// 1. Generate High-Res Student Card Front Texture
const createCardFrontTexture = (): THREE.CanvasTexture => {
  const canvas = document.createElement('canvas')
  canvas.width = 1024
  canvas.height = 640
  const ctx = canvas.getContext('2d')!

  // Deep Navy Gradient Background
  const grad = ctx.createLinearGradient(0, 0, 1024, 640)
  grad.addColorStop(0, '#060a3b')
  grad.addColorStop(0.5, '#0a1254')
  grad.addColorStop(1, '#030624')
  ctx.fillStyle = grad
  ctx.fillRect(0, 0, 1024, 640)

  // Decorative Holographic Wave Lines
  ctx.strokeStyle = 'rgba(56, 189, 248, 0.15)'
  ctx.lineWidth = 2
  for (let i = -200; i < 1200; i += 50) {
    ctx.beginPath()
    ctx.moveTo(i, 0)
    ctx.bezierCurveTo(i + 200, 200, i - 100, 400, i + 300, 640)
    ctx.stroke()
  }

  // Top Red & Gold Border Accent
  ctx.fillStyle = '#b91c1c'
  ctx.fillRect(0, 0, 1024, 20)
  ctx.fillStyle = '#f59e0b'
  ctx.fillRect(0, 20, 1024, 6)

  // Top Bar: President University Header
  ctx.fillStyle = '#ffffff'
  ctx.font = 'bold 36px "Segoe UI", sans-serif'
  ctx.letterSpacing = '3px'
  ctx.fillText('PRESIDENT UNIVERSITY', 70, 85)

  ctx.fillStyle = '#93c5fd'
  ctx.font = '600 20px "Segoe UI", sans-serif'
  ctx.letterSpacing = '1px'
  ctx.fillText('FACULTY OF COMPUTER SCIENCE', 70, 115)

  // Gold EMV Smart Chip
  ctx.fillStyle = '#fbbf24'
  ctx.beginPath()
  ctx.roundRect(70, 160, 100, 75, 12)
  ctx.fill()
  ctx.strokeStyle = '#d97706'
  ctx.lineWidth = 3
  ctx.stroke()
  // Chip circuit pattern
  ctx.strokeRect(105, 160, 30, 75)
  ctx.strokeRect(70, 195, 100, 1)

  // Holographic Stamp / Seal
  const sealGrad = ctx.createRadialGradient(880, 180, 10, 880, 180, 65)
  sealGrad.addColorStop(0, '#fef08a')
  sealGrad.addColorStop(0.3, '#38bdf8')
  sealGrad.addColorStop(0.7, '#c084fc')
  sealGrad.addColorStop(1, '#60a5fa')
  ctx.fillStyle = sealGrad
  ctx.beginPath()
  ctx.arc(880, 180, 55, 0, Math.PI * 2)
  ctx.fill()
  ctx.strokeStyle = 'rgba(255, 255, 255, 0.6)'
  ctx.lineWidth = 3
  ctx.stroke()

  ctx.fillStyle = '#0f172a'
  ctx.font = 'bold 16px sans-serif'
  ctx.textAlign = 'center'
  ctx.fillText('IT-26', 880, 175)
  ctx.font = 'bold 11px sans-serif'
  ctx.fillText('AUTHENTIC', 880, 195)
  ctx.textAlign = 'left'

  // Photo Avatar Silhouette Placeholder
  ctx.fillStyle = 'rgba(255, 255, 255, 0.08)'
  ctx.beginPath()
  ctx.roundRect(70, 270, 180, 220, 16)
  ctx.fill()
  ctx.strokeStyle = 'rgba(56, 189, 248, 0.4)'
  ctx.lineWidth = 2
  ctx.stroke()

  // Stylized avatar icon inside photo frame
  ctx.fillStyle = '#60a5fa'
  ctx.beginPath()
  ctx.arc(160, 345, 36, 0, Math.PI * 2)
  ctx.fill()
  ctx.beginPath()
  ctx.arc(160, 460, 65, Math.PI, 0)
  ctx.fill()

  // Student Details Typography
  ctx.fillStyle = '#94a3b8'
  ctx.font = '600 16px sans-serif'
  ctx.fillText('PROGRAM / MAJOR', 290, 285)

  ctx.fillStyle = '#ffffff'
  ctx.font = 'bold 32px sans-serif'
  ctx.fillText('INFORMATION TECHNOLOGY', 290, 325)

  ctx.fillStyle = '#94a3b8'
  ctx.font = '600 16px sans-serif'
  ctx.fillText('STUDENT IDENTITY CARD', 290, 375)

  ctx.fillStyle = '#38bdf8'
  ctx.font = 'bold 28px sans-serif'
  ctx.fillText('BATCH 2026 • 88 ACTIVE MEMBERS', 290, 410)

  ctx.fillStyle = '#94a3b8'
  ctx.font = '600 16px sans-serif'
  ctx.fillText('CAMPUS LOCATION', 290, 455)

  ctx.fillStyle = '#f8fafc'
  ctx.font = '500 20px sans-serif'
  ctx.fillText('Kota Jababeka, Cikarang, Indonesia', 290, 485)

  // Bottom Barcode & Serial Strip
  ctx.fillStyle = 'rgba(255, 255, 255, 0.05)'
  ctx.fillRect(0, 540, 1024, 100)

  ctx.fillStyle = '#cbd5e1'
  ctx.font = '18px monospace'
  ctx.fillText('NIM: 001202600001 - 001202600088', 70, 595)

  // Barcode lines
  ctx.fillStyle = '#ffffff'
  let xOffset = 620
  for (let i = 0; i < 48; i++) {
    const barWidth = (i % 3 === 0 ? 5 : (i % 2 === 0 ? 3 : 2))
    ctx.fillRect(xOffset, 560, barWidth, 50)
    xOffset += barWidth + (i % 4 === 0 ? 5 : 3)
  }

  const texture = new THREE.CanvasTexture(canvas)
  texture.anisotropy = 8
  return texture
}

// 2. Generate Card Back Texture
const createCardBackTexture = (): THREE.CanvasTexture => {
  const canvas = document.createElement('canvas')
  canvas.width = 1024
  canvas.height = 640
  const ctx = canvas.getContext('2d')!

  ctx.fillStyle = '#060a3b'
  ctx.fillRect(0, 0, 1024, 640)

  // Black Magnetic Stripe
  ctx.fillStyle = '#0f172a'
  ctx.fillRect(0, 70, 1024, 90)

  // Signature Panel
  ctx.fillStyle = '#f8fafc'
  ctx.fillRect(70, 200, 680, 80)
  ctx.fillStyle = '#1e293b'
  ctx.font = 'italic 28px "Brush Script MT", cursive, sans-serif'
  ctx.fillText('President University IT Batch 2026', 100, 250)

  // Security CVV box
  ctx.fillStyle = '#cbd5e1'
  ctx.fillRect(760, 200, 140, 80)
  ctx.fillStyle = '#0f172a'
  ctx.font = 'bold 24px monospace'
  ctx.fillText('IT-26', 790, 250)

  // Terms & Conditions
  ctx.fillStyle = '#94a3b8'
  ctx.font = '16px sans-serif'
  ctx.fillText('This card is the property of President University and must be presented on request.', 70, 340)
  ctx.fillText('Jl. Ki Hajar Dewantara, Kota Jababeka, Cikarang Baru, Bekasi 17550 - Indonesia', 70, 375)
  ctx.fillText('Website: https://president.ac.id | Major: Information Technology', 70, 410)

  // Bottom Gold seal
  ctx.fillStyle = '#fbbf24'
  ctx.font = 'bold 18px sans-serif'
  ctx.fillText('★ EXCELLENCE THROUGH PASSION AND INTEGRITY ★', 70, 540)

  const texture = new THREE.CanvasTexture(canvas)
  texture.anisotropy = 8
  return texture
}

// 3. Generate Terminal Screen Texture
const createTerminalTexture = (): THREE.CanvasTexture => {
  const canvas = document.createElement('canvas')
  canvas.width = 1024
  canvas.height = 640
  const ctx = canvas.getContext('2d')!

  // Terminal Window Background
  ctx.fillStyle = '#030712'
  ctx.fillRect(0, 0, 1024, 640)

  // Window Top Title Bar
  ctx.fillStyle = '#0f172a'
  ctx.fillRect(0, 0, 1024, 56)
  ctx.strokeStyle = '#1e293b'
  ctx.lineWidth = 2
  ctx.strokeRect(0, 0, 1024, 56)

  // Window Control Buttons (Red, Yellow, Green)
  ctx.fillStyle = '#ef4444'
  ctx.beginPath()
  ctx.arc(36, 28, 9, 0, Math.PI * 2)
  ctx.fill()

  ctx.fillStyle = '#f59e0b'
  ctx.beginPath()
  ctx.arc(66, 28, 9, 0, Math.PI * 2)
  ctx.fill()

  ctx.fillStyle = '#10b981'
  ctx.beginPath()
  ctx.arc(96, 28, 9, 0, Math.PI * 2)
  ctx.fill()

  // Title Bar Text
  ctx.fillStyle = '#94a3b8'
  ctx.font = 'bold 18px "Fira Code", monospace'
  ctx.textAlign = 'center'
  ctx.fillText('it26-profile@presuniv: ~ (zsh)', 512, 35)
  ctx.textAlign = 'left'

  // Code Lines
  ctx.font = '22px "Fira Code", monospace'
  let y = 110

  ctx.fillStyle = '#38bdf8'
  ctx.fillText('user@presuniv:~$ cat it26_overview.ts', 45, y)
  y += 45

  ctx.fillStyle = '#c084fc'
  ctx.fillText('import', 45, y)
  ctx.fillStyle = '#ffffff'
  ctx.fillText(' { PresidentUniversity } ', 135, y)
  ctx.fillStyle = '#c084fc'
  ctx.fillText('from', 430, y)
  ctx.fillStyle = '#a5f3fc'
  ctx.fillText(" '@cikarang/campus';", 495, y)
  y += 45

  ctx.fillStyle = '#c084fc'
  ctx.fillText('export const', 45, y)
  ctx.fillStyle = '#fbbf24'
  ctx.fillText(' IT_Batch_2026', 195, y)
  ctx.fillStyle = '#ffffff'
  ctx.fillText(' = {', 395, y)
  y += 40

  const lines = [
    { key: 'faculty', val: '"Computer Science"', valColor: '#86efac' },
    { key: 'major', val: '"Information Technology (S.Kom)"', valColor: '#86efac' },
    { key: 'totalMembers', val: '88,', valColor: '#f472b6' },
    { key: 'concentrations', val: '["AI", "CyberSec", "IoT", "DevOps"],', valColor: '#a5f3fc' },
    { key: 'accreditation', val: '"Unggul (LAMINFOKOM) + IABEE",', valColor: '#86efac' },
    { key: 'readyForIndustry', val: 'true', valColor: '#f472b6' }
  ]

  lines.forEach((item) => {
    ctx.fillStyle = '#93c5fd'
    ctx.fillText(`  ${item.key}: `, 45, y)
    const keyWidth = ctx.measureText(`  ${item.key}: `).width
    ctx.fillStyle = item.valColor
    ctx.fillText(item.val, 45 + keyWidth, y)
    y += 38
  })

  ctx.fillStyle = '#ffffff'
  ctx.fillText('};', 45, y)
  y += 48

  ctx.fillStyle = '#4ade80'
  ctx.fillText('user@presuniv:~$ run build --success', 45, y)
  ctx.fillStyle = '#38bdf8'
  ctx.fillRect(495, y - 20, 14, 25) // Cursor

  const texture = new THREE.CanvasTexture(canvas)
  texture.anisotropy = 8
  return texture
}

// Drag & Interaction Handlers
const onMouseDown = (e: MouseEvent) => {
  isDragging.value = true
  prevMouseX = e.clientX
  prevMouseY = e.clientY
}

const onMouseMove = (e: MouseEvent) => {
  if (!isDragging.value) {
    // Subtle hover tilt
    const rect = canvasContainer.value?.getBoundingClientRect()
    if (rect) {
      const x = (e.clientX - (rect.left + rect.width / 2)) / (rect.width / 2)
      const y = (e.clientY - (rect.top + rect.height / 2)) / (rect.height / 2)
      targetRotY = x * 0.4
      targetRotX = -y * 0.3
    }
    return
  }

  const deltaX = e.clientX - prevMouseX
  const deltaY = e.clientY - prevMouseY

  targetRotY += deltaX * 0.01
  targetRotX += deltaY * 0.01

  prevMouseX = e.clientX
  prevMouseY = e.clientY
}

const onMouseUp = () => {
  isDragging.value = false
}

const onTouchStart = (e: TouchEvent) => {
  if (e.touches.length > 0) {
    isDragging.value = true
    prevMouseX = e.touches[0].clientX
    prevMouseY = e.touches[0].clientY
  }
}

const onTouchMove = (e: TouchEvent) => {
  if (!isDragging.value || e.touches.length === 0) return
  const deltaX = e.touches[0].clientX - prevMouseX
  const deltaY = e.touches[0].clientY - prevMouseY

  targetRotY += deltaX * 0.01
  targetRotX += deltaY * 0.01

  prevMouseX = e.touches[0].clientX
  prevMouseY = e.touches[0].clientY
}

const switchMode = (mode: 'card' | 'terminal') => {
  if (currentMode.value === mode) return
  currentMode.value = mode

  // Smooth 3D Flip transition
  gsap.to(activeContainer.rotation, {
    y: activeContainer.rotation.y + Math.PI * 2,
    duration: 0.8,
    ease: 'power2.inOut',
    onStart: () => {
      cardMesh.visible = mode === 'card'
      terminalGroup.visible = mode === 'terminal'
    }
  })

  gsap.fromTo(activeContainer.scale, 
    { x: 0.85, y: 0.85, z: 0.85 },
    { x: 1, y: 1, z: 1, duration: 0.8, ease: 'back.out(1.5)' }
  )
}

const onResize = () => {
  if (!canvasContainer.value || !renderer || !camera) return
  const width = canvasContainer.value.clientWidth
  const height = canvasContainer.value.clientHeight
  camera.aspect = width / height
  camera.updateProjectionMatrix()
  renderer.setSize(width, height)
  renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))
}

const initStage = () => {
  if (!canvasContainer.value) return
  const width = canvasContainer.value.clientWidth
  const height = canvasContainer.value.clientHeight

  // Scene & Camera
  scene = new THREE.Scene()
  camera = new THREE.PerspectiveCamera(45, width / height, 0.1, 100)
  camera.position.set(0, 0, 14)

  // Renderer
  renderer = new THREE.WebGLRenderer({ alpha: true, antialias: true })
  renderer.setSize(width, height)
  renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))
  renderer.toneMapping = THREE.ACESFilmicToneMapping
  renderer.toneMappingExposure = 1.15
  canvasContainer.value.appendChild(renderer.domElement)

  // Lighting
  const ambientLight = new THREE.AmbientLight(0xffffff, 1.6)
  scene.add(ambientLight)

  const keyLight = new THREE.DirectionalLight(0xffffff, 2.5)
  keyLight.position.set(6, 8, 12)
  scene.add(keyLight)

  const blueRimLight = new THREE.PointLight(0x38bdf8, 35, 50)
  blueRimLight.position.set(-8, -6, 6)
  scene.add(blueRimLight)

  const goldAccentLight = new THREE.PointLight(0xfbbf24, 25, 40)
  goldAccentLight.position.set(8, -5, -4)
  scene.add(goldAccentLight)

  // Active Container
  activeContainer = new THREE.Group()
  scene.add(activeContainer)

  // ====================
  // 1. Build Student Card Mesh
  // ====================
  const cardGeo = new THREE.BoxGeometry(6.6, 4.12, 0.1)
  const frontTex = createCardFrontTexture()
  const backTex = createCardBackTexture()

  const edgeMat = new THREE.MeshStandardMaterial({
    color: 0x1e293b,
    metalness: 0.8,
    roughness: 0.2
  })

  const frontMat = new THREE.MeshPhysicalMaterial({
    map: frontTex,
    clearcoat: 0.8,
    clearcoatRoughness: 0.1,
    metalness: 0.15,
    roughness: 0.2,
    reflectivity: 0.6
  })

  const backMat = new THREE.MeshPhysicalMaterial({
    map: backTex,
    clearcoat: 0.6,
    clearcoatRoughness: 0.2,
    metalness: 0.2,
    roughness: 0.3
  })

  // Box faces: [right, left, top, bottom, front, back]
  const cardMaterials = [edgeMat, edgeMat, edgeMat, edgeMat, frontMat, backMat]
  cardMesh = new THREE.Mesh(cardGeo, cardMaterials)
  activeContainer.add(cardMesh)

  // ====================
  // 2. Build 3D Terminal Group
  // ====================
  terminalGroup = new THREE.Group()
  activeContainer.add(terminalGroup)
  terminalGroup.visible = false

  // Terminal Beveled Chassis
  const chassisGeo = new THREE.BoxGeometry(7.2, 4.5, 0.22)
  const chassisMat = new THREE.MeshStandardMaterial({
    color: 0x0f172a,
    metalness: 0.7,
    roughness: 0.3
  })
  const chassisMesh = new THREE.Mesh(chassisGeo, chassisMat)
  terminalGroup.add(chassisMesh)

  // Terminal Screen (Glass Face)
  const screenTex = createTerminalTexture()
  const screenGeo = new THREE.PlaneGeometry(6.8, 4.1)
  const screenMat = new THREE.MeshBasicMaterial({
    map: screenTex
  })
  const screenMesh = new THREE.Mesh(screenGeo, screenMat)
  screenMesh.position.z = 0.12
  terminalGroup.add(screenMesh)

  // Listeners
  window.addEventListener('resize', onResize)
  window.addEventListener('mouseup', onMouseUp)
  window.addEventListener('touchend', onMouseUp)

  // Initial Intro Animation
  gsap.from(activeContainer.position, {
    y: -2,
    duration: 1.2,
    ease: 'power3.out'
  })
  gsap.from(activeContainer.rotation, {
    x: 0.8,
    y: -1.2,
    duration: 1.5,
    ease: 'power3.out'
  })

  // Animation Loop
  let clock = new THREE.Clock()
  const animate = () => {
    animationFrameId = requestAnimationFrame(animate)
    const elapsedTime = clock.getElapsedTime()

    // Smooth spring rotation towards target
    rotX += (targetRotX - rotX) * 0.08
    rotY += (targetRotY - rotY) * 0.08

    // Idle floating bob
    floatOffset = Math.sin(elapsedTime * 1.8) * 0.12

    activeContainer.position.y = floatOffset
    activeContainer.rotation.x = rotX
    activeContainer.rotation.y = rotY

    renderer.render(scene, camera)
  }

  animate()
}

onMounted(() => {
  initStage()
})

onUnmounted(() => {
  if (animationFrameId) cancelAnimationFrame(animationFrameId)
  window.removeEventListener('resize', onResize)
  window.removeEventListener('mouseup', onMouseUp)
  window.removeEventListener('touchend', onMouseUp)

  if (scene) {
    scene.traverse((obj) => {
      const item = obj as any
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
  <div class="relative w-full max-w-lg mx-auto flex flex-col items-center select-none">
    <!-- Top Mode Switcher Pill -->
    <div class="inline-flex items-center gap-1.5 p-1.5 rounded-full bg-white/10 backdrop-blur-md border border-white/20 shadow-xl mb-4 z-20">
      <button
        @click="switchMode('card')"
        type="button"
        :class="[
          'px-4 py-2 rounded-full text-xs font-semibold transition-all duration-300 flex items-center gap-2 cursor-pointer',
          currentMode === 'card' 
            ? 'bg-pres-blue text-white shadow-lg shadow-blue-900/50 scale-105' 
            : 'text-white/80 hover:text-white hover:bg-white/10'
        ]"
      >
        <span>🪪</span>
        <span>Student ID Card</span>
      </button>

      <button
        @click="switchMode('terminal')"
        type="button"
        :class="[
          'px-4 py-2 rounded-full text-xs font-semibold transition-all duration-300 flex items-center gap-2 cursor-pointer',
          currentMode === 'terminal' 
            ? 'bg-pres-blue text-white shadow-lg shadow-blue-900/50 scale-105' 
            : 'text-white/80 hover:text-white hover:bg-white/10'
        ]"
      >
        <span>💻</span>
        <span>Developer Terminal</span>
      </button>
    </div>

    <!-- 3D Stage Container -->
    <div 
      ref="canvasContainer"
      @mousedown="onMouseDown"
      @mousemove="onMouseMove"
      @touchstart="onTouchStart"
      @touchmove="onTouchMove"
      class="relative w-full h-[360px] sm:h-[400px] cursor-grab active:cursor-grabbing flex items-center justify-center"
      title="Klik dan putar kartu dalam 3D!"
    >
      <!-- Subtle Hint Banner at Bottom -->
      <div class="absolute bottom-1 px-3 py-1 rounded-full bg-black/40 backdrop-blur-md border border-white/10 text-[11px] font-medium text-white/75 flex items-center gap-1.5 pointer-events-none">
        <svg class="w-3.5 h-3.5 text-cyan-400 animate-spin" style="animation-duration: 4s;" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
        </svg>
        <span>Drag / geser mouse untuk memutar 3D 360°</span>
      </div>
    </div>
  </div>
</template>
