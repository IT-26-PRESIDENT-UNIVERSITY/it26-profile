<template>
  <div class="min-h-screen bg-gray-50">
    <Navbar />

    <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      
      <div class="bg-white border border-gray-200 rounded-lg p-3 mb-6 shadow-sm text-center">
        <h1 class="text-sm font-bold text-gray-600 uppercase tracking-widest px-2">
          Admin Dashboard
        </h1>
      </div>

      <div class="bg-white rounded-xl border border-gray-200 shadow-sm p-8 mb-8">
        <div>
          <h2 class="text-xl font-semibold text-gray-800">Welcome</h2>
          <p class="text-sm text-gray-500 uppercase tracking-wide mt-1">
            PRESIDENT UNIVERSITY INFORMATION TECHNOLOGY 2026
          </p>
        </div>

        <hr class="my-6 border-gray-200" />

        <div class="flex items-center justify-between">
          <div class="flex items-center gap-4">
            <div class="w-16 h-16 rounded-full bg-gray-200 flex items-center justify-center border border-gray-300">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-10 w-10 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
              </svg>
            </div>
            <div>
              <h3 class="text-lg font-bold">User Name</h3>
              <p class="text-gray-500">user@gmail.com</p>
            </div>
          </div>
        </div>
      </div>

      <div class="bg-white rounded-xl border border-gray-200 shadow-sm p-6">
        <div class="flex justify-between items-center mb-6">
          <h2 class="text-lg font-bold">My Projects</h2>
          
          <button class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded-lg font-medium transition shadow-md">
            Add New
          </button>
        </div>
        <div class="text-center py-12 text-gray-400">
          Belum ada proyek yang dibuat. Klik "Add New" untuk mulai!
        </div>
      </div>

    </main>
  </div>
</template>