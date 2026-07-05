<script setup lang="ts">
import { currentLang, translations } from "../store/langStore"

const lecturers = [
  {
    name: 'Rosalina, S.Kom., M.Kom.',
    title: 'Head of Study Program',
    image: 'https://president.bilinedev.com/uploads/2267dc814f9392ae80012ff0b88d120d.png'
  },
  {
    name: 'Nur Hadisukmana, M.Sc.',
    title: 'Full-Time Lecturer',
    image: 'https://president.bilinedev.com/uploads/64d1f19bba71c78bb0a9502156e765c8.png'
  },
  {
    name: 'Ahmad Fadhil Naswir, Ph.D',
    title: 'Full-Time Lecturer',
    image: 'https://president.bilinedev.com/uploads/e4b46c6ae355e92db808dd21891065ae.png'
  },
  {
    name: 'Williem, S.Kom., M.Kom',
    title: 'Full-Time Lecturer',
    image: 'https://president.bilinedev.com/uploads/3f651557f22c3990cd2f493c2bd20b88.png'
  },
  {
    name: 'Abdul Ghofir, S.Kom., M.Kom.',
    title: 'Full-Time Lecturer',
    image: 'https://president.bilinedev.com/uploads/c90ce8203f9615b7651f303b79bafc90.png'
  },
  {
    name: 'Andika Candra Jaya, S,Kom., M.Kom',
    title: 'Full-Time Lecturer',
    image: 'https://president.bilinedev.com/uploads/32b038e848502081456d1ea72e42fa6b.png'
  },
  {
    name: 'Anggraini Dyah Ayu Sekarlangit, S.Kom., M.Kom',
    title: 'Full-Time Lecturer',
    image: 'https://president.bilinedev.com/uploads/9d9107049bb48dd0a6215361e5d48137.png'
  },
  {
    name: 'Dr. Deffa Rahadiyan, S.Si.',
    title: 'Full-Time Lecturer',
    image: 'https://president.bilinedev.com/uploads/c19ea45b9f68189a444ef68e00bece1a.png'
  }
]
</script>

<template>
  <div class="min-h-screen bg-gray-50 pt-24 pb-12">
    <!-- Hero Section -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mb-16">
      <div class="text-center">
        <h1 class="text-4xl tracking-tight font-extrabold text-gray-900 sm:text-5xl md:text-6xl">
          <span class="block">Informatics Department</span>
          <span class="block text-indigo-600">President University</span>
        </h1>
        <p class="mt-3 max-w-md mx-auto text-base text-gray-500 sm:text-lg md:mt-5 md:text-xl md:max-w-3xl">
          {{ translations[currentLang].subtitle }}
        </p>
      </div>
    </div>

    <!-- About Us Section -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mb-16">
      <div class="bg-white rounded-2xl shadow-xl overflow-hidden">
        <div class="px-6 py-8 sm:p-10">
          <h2 class="text-3xl font-extrabold text-gray-900 mb-6 border-b pb-4">{{ translations[currentLang].heading }}</h2>
          <div class="prose prose-indigo max-w-none text-gray-600 text-justify">
            <p class="mb-4">
              {{ translations[currentLang].parOne }}
            </p>
            <p class="mb-4">
              {{ translations[currentLang].parTwo }}
            </p>
            
            <h3 class="text-xl font-bold text-gray-900 mt-8 mb-4">Three Key Facts About the Program</h3>
            <ul class="list-disc pl-5 space-y-2 mb-6">
              <li><strong>{{ translations[currentLang].factOne }}</strong> {{ translations[currentLang].oneCont }}</li>
              <li><strong>{{ translations[currentLang].factTwo }}</strong> {{ translations[currentLang].twoCont }}</li>
              <li><strong>{{ translations[currentLang].factThree }}</strong> {{ translations[currentLang].threeCont }}</li>
            </ul>
          </div>

          <div class="mt-8 grid grid-cols-1 md:grid-cols-3 gap-6">
            <div class="bg-pink-600 rounded-lg p-6 text-white text-center shadow-md hover:scale-105 transition-transform">
              <h4 class="text-lg font-bold mb-2">{{ translations[currentLang].duration }}</h4>
              <div class="w-full h-px bg-white/30 mb-4"></div>
              <p>3 - 4 years</p>
            </div>
            <div class="bg-orange-500 rounded-lg p-6 text-white text-center shadow-md hover:scale-105 transition-transform">
              <h4 class="text-lg font-bold mb-2">{{ translations[currentLang].degree }}</h4>
              <div class="w-full h-px bg-white/30 mb-4"></div>
              <p>Sarjana Komputer (S.Kom.)</p>
            </div>
            <div class="bg-blue-800 rounded-lg p-6 text-white text-center shadow-md hover:scale-105 transition-transform">
              <h4 class="text-lg font-bold mb-2">{{ translations[currentLang].accreditation }}</h4>
              <div class="w-full h-px bg-white/30 mb-4"></div>
              <p>Unggul (LAMINFOKOM) & IABEE</p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Academics & Curriculum -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mb-16">
      <div class="bg-indigo-50 rounded-2xl p-6 sm:p-10 shadow-sm border border-indigo-100">
        <h2 class="text-3xl font-extrabold text-indigo-900 mb-6">{{ translations[currentLang].headCur }}</h2>
        <div class="mb-4">
          <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-indigo-200 text-indigo-800">
            {{ translations[currentLang].badge }}
          </span>
        </div>
        
        <div class="mt-6 grid gap-6 lg:grid-cols-2">
          <div class="bg-white rounded-xl p-6 shadow-sm">
            <h3 class="text-lg font-bold text-gray-900 mb-4 flex items-center">
              <svg class="w-5 h-5 mr-2 text-indigo-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
              {{ translations[currentLang].coreHeading }}
            </h3>
            <ul class="space-y-2 text-gray-600 text-sm">
              <li>• {{ translations[currentLang].coreOne }}</li>
              <li>• {{ translations[currentLang].coreTwo }}</li>
              <li>• {{ translations[currentLang].coreThree }}</li>
              <li>• {{ translations[currentLang].coreFour }}</li>
              <li>• {{ translations[currentLang].coreFive }}</li>
              <li>• {{ translations[currentLang].coreSix }}</li>
            </ul>
          </div>
          <div class="bg-white rounded-xl p-6 shadow-sm">
            <h3 class="text-lg font-bold text-gray-900 mb-4 flex items-center">
              <svg class="w-5 h-5 mr-2 text-indigo-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 002-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path></svg>
              {{ translations[currentLang].concHeading }}
            </h3>
            <ul class="space-y-2 text-gray-600 text-sm">
              <li><span class="font-semibold text-indigo-700">1. {{ translations[currentLang].concOne }}</span> {{ translations[currentLang].oneConc }}</li>
              <li><span class="font-semibold text-indigo-700">2. {{ translations[currentLang].concTwo }}</span> {{ translations[currentLang].twoConc }}</li>
              <li><span class="font-semibold text-indigo-700">3. {{ translations[currentLang].concThrre }}</span> {{ translations[currentLang].threeConc }}</li>
              <li><span class="font-semibold text-indigo-700">4. {{ translations[currentLang].concFour }}</span> {{ translations[currentLang].fourConc }}</li>
              <li><span class="font-semibold text-indigo-700">5. {{ translations[currentLang].concFive }}</span> {{ translations[currentLang].fiveConc }}</li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <!-- Facilities -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mb-16">
      <h2 class="text-3xl font-extrabold text-gray-900 mb-8">{{ translations[currentLang].facHeading }}</h2>
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div class="bg-white rounded-xl shadow-md p-6 border-l-4 border-indigo-500">
          <h3 class="text-xl font-bold text-gray-900 mb-2">{{ translations[currentLang].facSmartTitle }}</h3>
          <p class="text-gray-600">{{ translations[currentLang].facSmartDesc }}</p>
        </div>
        <div class="bg-white rounded-xl shadow-md p-6 border-l-4 border-indigo-500">
          <h3 class="text-xl font-bold text-gray-900 mb-2">{{ translations[currentLang].facLabTitle }}</h3>
          <p class="text-gray-600">{{ translations[currentLang].facLabDesc }}</p>
        </div>
        <div class="bg-white rounded-xl shadow-md p-6 border-l-4 border-indigo-500">
          <h3 class="text-xl font-bold text-gray-900 mb-2">{{ translations[currentLang].facHubTitle }}</h3>
          <p class="text-gray-600">{{ translations[currentLang].facHubDesc }}</p>
        </div>
        <div class="bg-white rounded-xl shadow-md p-6 border-l-4 border-indigo-500">
          <h3 class="text-xl font-bold text-gray-900 mb-2">{{ translations[currentLang].facIndTitle }}</h3>
          <p class="text-gray-600">{{ translations[currentLang].facIndDesc }}</p>
        </div>
      </div>
    </div>

    <!-- Lecturers Section -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mb-16">
      <h2 class="text-3xl font-extrabold text-gray-900 mb-8 text-center">{{ translations[currentLang].lecHeading }}</h2>
      <p class="text-center text-gray-500 max-w-2xl mx-auto mb-10">{{ translations[currentLang].lecSubtitle }}</p>
      
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
        <div v-for="lecturer in lecturers" :key="lecturer.name" class="bg-white rounded-2xl shadow-lg overflow-hidden flex flex-col group transform transition hover:-translate-y-2">
          <div class="aspect-w-3 aspect-h-4 bg-gray-200">
            <img :src="lecturer.image" :alt="lecturer.name" class="object-cover w-full h-64 object-top group-hover:opacity-90 transition-opacity">
          </div>
          <div class="p-6 flex-1 flex flex-col">
            <h3 class="text-lg font-bold text-gray-900 mb-1 leading-tight">{{ lecturer.name }}</h3>
            <p class="text-indigo-600 text-sm font-medium">{{ lecturer.title }}</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Career Impact -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="bg-gray-900 rounded-3xl p-8 md:p-12 text-white shadow-2xl relative overflow-hidden">
        <div class="absolute top-0 right-0 -mt-10 -mr-10 w-40 h-40 bg-indigo-500 rounded-full opacity-20 blur-3xl"></div>
        <div class="absolute bottom-0 left-0 -mb-10 -ml-10 w-40 h-40 bg-pink-500 rounded-full opacity-20 blur-3xl"></div>
        
        <div class="relative z-10 text-center mb-10">
          <h2 class="text-3xl md:text-4xl font-extrabold mb-4">{{ translations[currentLang].careerHeading }}</h2>
          <p class="text-gray-300 max-w-2xl mx-auto">{{ translations[currentLang].careerSubtitle }}</p>
        </div>
        
        <div class="relative z-10 flex flex-wrap justify-center gap-3">
          <span class="px-4 py-2 bg-gray-800 border border-gray-700 rounded-full text-sm font-medium hover:bg-indigo-600 hover:border-indigo-500 transition-colors cursor-default">{{ translations[currentLang].careerRole1 }}</span>
          <span class="px-4 py-2 bg-gray-800 border border-gray-700 rounded-full text-sm font-medium hover:bg-indigo-600 hover:border-indigo-500 transition-colors cursor-default">{{ translations[currentLang].careerRole2 }}</span>
          <span class="px-4 py-2 bg-gray-800 border border-gray-700 rounded-full text-sm font-medium hover:bg-indigo-600 hover:border-indigo-500 transition-colors cursor-default">{{ translations[currentLang].careerRole3 }}</span>
          <span class="px-4 py-2 bg-gray-800 border border-gray-700 rounded-full text-sm font-medium hover:bg-indigo-600 hover:border-indigo-500 transition-colors cursor-default">{{ translations[currentLang].careerRole4 }}</span>
          <span class="px-4 py-2 bg-gray-800 border border-gray-700 rounded-full text-sm font-medium hover:bg-indigo-600 hover:border-indigo-500 transition-colors cursor-default">{{ translations[currentLang].careerRole5 }}</span>
          <span class="px-4 py-2 bg-gray-800 border border-gray-700 rounded-full text-sm font-medium hover:bg-indigo-600 hover:border-indigo-500 transition-colors cursor-default">{{ translations[currentLang].careerRole6 }}</span>
          <span class="px-4 py-2 bg-gray-800 border border-gray-700 rounded-full text-sm font-medium hover:bg-indigo-600 hover:border-indigo-500 transition-colors cursor-default">{{ translations[currentLang].careerRole7 }}</span>
          <span class="px-4 py-2 bg-gray-800 border border-gray-700 rounded-full text-sm font-medium hover:bg-indigo-600 hover:border-indigo-500 transition-colors cursor-default">{{ translations[currentLang].careerRole8 }}</span>
          <span class="px-4 py-2 bg-gray-800 border border-gray-700 rounded-full text-sm font-medium hover:bg-indigo-600 hover:border-indigo-500 transition-colors cursor-default">{{ translations[currentLang].careerRole9 }}</span>
          <span class="px-4 py-2 bg-gray-800 border border-gray-700 rounded-full text-sm font-medium hover:bg-indigo-600 hover:border-indigo-500 transition-colors cursor-default">{{ translations[currentLang].careerRole10 }}</span>
          <span class="px-4 py-2 bg-gray-800 border border-gray-700 rounded-full text-sm font-medium hover:bg-indigo-600 hover:border-indigo-500 transition-colors cursor-default">{{ translations[currentLang].careerRole11 }}</span>
          <span class="px-4 py-2 bg-gray-800 border border-gray-700 rounded-full text-sm font-medium hover:bg-indigo-600 hover:border-indigo-500 transition-colors cursor-default">{{ translations[currentLang].careerRole12 }}</span>
          <span class="px-4 py-2 bg-gray-800 border border-gray-700 rounded-full text-sm font-medium hover:bg-indigo-600 hover:border-indigo-500 transition-colors cursor-default">{{ translations[currentLang].careerRole13 }}</span>
        </div>
      </div>
    </div>

  </div>
</template>
