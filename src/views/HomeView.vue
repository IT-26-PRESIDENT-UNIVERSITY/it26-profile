<script setup lang="ts">
import { RouterLink } from 'vue-router'
import { currentLang, translations } from '../store/langStore'
import Hero3D from '../components/Hero3D.vue'

// Interactive 3D Card Tilt Effect (igloo.inc style)
const onCardMove = (e: MouseEvent) => {
  const el = e.currentTarget as HTMLElement
  const rect = el.getBoundingClientRect()
  const x = e.clientX - rect.left
  const y = e.clientY - rect.top
  const centerX = rect.width / 2
  const centerY = rect.height / 2
  const rotateX = ((y - centerY) / centerY) * -12
  const rotateY = ((x - centerX) / centerX) * 12
  el.style.transform = `perspective(1000px) rotateX(${rotateX.toFixed(2)}deg) rotateY(${rotateY.toFixed(2)}deg) translateY(-8px) scale3d(1.02, 1.02, 1.02)`
}

const onCardLeave = (e: MouseEvent) => {
  const el = e.currentTarget as HTMLElement
  el.style.transform = 'perspective(1000px) rotateX(0deg) rotateY(0deg) translateY(0px) scale3d(1, 1, 1)'
}
</script>

<template>
  <div class="bg-[#02040a] text-white min-h-screen relative selection:bg-cyan-500 selection:text-black overflow-x-hidden">
    <!-- Living 3D WebGL Canvas Layer (Three.js + GSAP Scroll Engine) -->
    <Hero3D />

    <!-- Hero Section -->
    <section class="relative z-10 min-h-[92vh] flex items-center justify-center px-4 sm:px-6 lg:px-8">
      <div class="max-w-5xl mx-auto py-20 flex flex-col items-center text-center">
        
        <!-- Igloo-style Pill Badge -->
        <div class="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-white/[0.04] border border-white/15 text-xs font-semibold tracking-wider text-cyan-300 uppercase mb-8 backdrop-blur-xl shadow-[0_0_20px_rgba(56,189,248,0.15)]">
          <span class="w-2 h-2 rounded-full bg-cyan-400 animate-pulse shadow-[0_0_8px_#38bdf8]"></span>
          <span>Information Technology • Batch 2026</span>
        </div>

        <!-- Headline with subtle crystalline shimmer -->
        <h1 class="text-4xl sm:text-6xl lg:text-7xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-b from-white via-slate-100 to-slate-400 drop-shadow-2xl leading-[1.1]">
          {{ translations[currentLang].heroTitle }}
        </h1>

        <!-- Subtitle -->
        <p class="mt-6 text-lg sm:text-xl md:text-2xl max-w-3xl text-slate-300 font-normal leading-relaxed">
          {{ translations[currentLang].heroSubtitle }}
        </p>

        <p class="mt-4 text-sm sm:text-base max-w-2xl text-slate-400">
          {{ translations[currentLang].heroDesc }}
        </p>

        <!-- CTA Buttons with Frosted Glass & Neon Accents -->
        <div class="mt-10 flex flex-wrap justify-center gap-4">
          <RouterLink
            to="/directory"
            class="group relative inline-flex items-center px-7 py-3.5 rounded-xl font-medium text-sm text-white bg-gradient-to-r from-blue-600 to-cyan-600 hover:from-blue-500 hover:to-cyan-500 shadow-[0_0_30px_rgba(37,99,235,0.4)] hover:shadow-[0_0_40px_rgba(56,189,248,0.6)] transition-all duration-300 transform hover:-translate-y-0.5"
          >
            <span>{{ translations[currentLang].btnMeet }}</span>
            <svg class="ml-2 w-4 h-4 transition-transform group-hover:translate-x-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7l5 5m0 0l-5 5m5-5H6" />
            </svg>
          </RouterLink>

          <RouterLink
            to="/projects"
            class="inline-flex items-center px-7 py-3.5 rounded-xl font-medium text-sm text-slate-200 bg-white/[0.04] hover:bg-white/[0.08] border border-white/15 hover:border-cyan-400/40 backdrop-blur-xl transition-all duration-300 transform hover:-translate-y-0.5 shadow-lg"
          >
            {{ translations[currentLang].btnView }}
          </RouterLink>
        </div>

        <!-- Subtle Scroll Indicator -->
        <div class="mt-16 flex flex-col items-center gap-2 text-slate-500 text-xs tracking-widest uppercase">
          <span>Scroll to explore 3D space</span>
          <div class="w-5 h-8 rounded-full border border-white/20 flex items-start justify-center p-1">
            <div class="w-1 h-2 rounded-full bg-cyan-400 animate-bounce"></div>
          </div>
        </div>

      </div>
    </section>

    <!-- Core Values / Highlights Section (igloo.inc Matte Void with Glass Cards) -->
    <section class="relative z-10 py-24 px-4 sm:px-6 lg:px-8 max-w-7xl mx-auto">
      <div class="text-center mb-16">
        <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-cyan-500/10 border border-cyan-400/20 text-xs font-semibold tracking-wider text-cyan-400 uppercase mb-3">
          {{ translations[currentLang].visionLabel }}
        </div>
        <h2 class="text-3xl sm:text-5xl font-extrabold tracking-tight text-white drop-shadow-md">
          {{ translations[currentLang].visionTitle }}
        </h2>
        <p class="max-w-2xl mt-4 mx-auto text-base sm:text-lg text-slate-400 leading-relaxed">
          {{ translations[currentLang].visionDesc }}
        </p>
      </div>

      <!-- 3D Frosted Glass Cards Grid -->
      <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        
        <!-- Card 1 -->
        <div
          @mousemove="onCardMove"
          @mouseleave="onCardLeave"
          class="relative bg-white/[0.03] backdrop-blur-2xl rounded-2xl p-8 border border-white/10 hover:border-cyan-400/50 hover:bg-white/[0.06] transition-all duration-200 group cursor-pointer shadow-[0_8px_32px_rgba(0,0,0,0.5)] will-change-transform"
        >
          <div class="w-12 h-12 rounded-xl bg-gradient-to-br from-blue-600 to-cyan-500 flex items-center justify-center mb-6 shadow-[0_0_20px_rgba(56,189,248,0.4)] group-hover:scale-110 transition-transform duration-300">
            <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4" />
            </svg>
          </div>
          <h3 class="text-xl font-bold text-white mb-3 group-hover:text-cyan-300 transition-colors">
            {{ translations[currentLang].card1Title }}
          </h3>
          <p class="text-slate-400 text-sm sm:text-base leading-relaxed">
            {{ translations[currentLang].card1Desc }}
          </p>
        </div>

        <!-- Card 2 -->
        <div
          @mousemove="onCardMove"
          @mouseleave="onCardLeave"
          class="relative bg-white/[0.03] backdrop-blur-2xl rounded-2xl p-8 border border-white/10 hover:border-cyan-400/50 hover:bg-white/[0.06] transition-all duration-200 group cursor-pointer shadow-[0_8px_32px_rgba(0,0,0,0.5)] will-change-transform"
        >
          <div class="w-12 h-12 rounded-xl bg-gradient-to-br from-blue-600 to-cyan-500 flex items-center justify-center mb-6 shadow-[0_0_20px_rgba(56,189,248,0.4)] group-hover:scale-110 transition-transform duration-300">
            <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z" />
            </svg>
          </div>
          <h3 class="text-xl font-bold text-white mb-3 group-hover:text-cyan-300 transition-colors">
            {{ translations[currentLang].card2Title }}
          </h3>
          <p class="text-slate-400 text-sm sm:text-base leading-relaxed">
            {{ translations[currentLang].card2Desc }}
          </p>
        </div>

        <!-- Card 3 -->
        <div
          @mousemove="onCardMove"
          @mouseleave="onCardLeave"
          class="relative bg-white/[0.03] backdrop-blur-2xl rounded-2xl p-8 border border-white/10 hover:border-cyan-400/50 hover:bg-white/[0.06] transition-all duration-200 group cursor-pointer shadow-[0_8px_32px_rgba(0,0,0,0.5)] will-change-transform"
        >
          <div class="w-12 h-12 rounded-xl bg-gradient-to-br from-blue-600 to-cyan-500 flex items-center justify-center mb-6 shadow-[0_0_20px_rgba(56,189,248,0.4)] group-hover:scale-110 transition-transform duration-300">
            <svg class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z" />
            </svg>
          </div>
          <h3 class="text-xl font-bold text-white mb-3 group-hover:text-cyan-300 transition-colors">
            {{ translations[currentLang].card3Title }}
          </h3>
          <p class="text-slate-400 text-sm sm:text-base leading-relaxed">
            {{ translations[currentLang].card3Desc }}
          </p>
        </div>

      </div>
    </section>
  </div>
</template>
