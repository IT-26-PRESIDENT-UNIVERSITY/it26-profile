<script setup lang="ts">
import { ref, onMounted, onUnmounted, watch } from 'vue';
import { useRouter } from 'vue-router';
import { supabase } from '../lib/supabase';
import { logout } from '../services/authService'; 
import { computed } from 'vue';
import directoryData from '../data/dataMahasiswa.json';
import { currentLang, translations } from '../store/langStore';
import { changePassword } from '../services/authService'; 

const router = useRouter();
const isSidebarOpen = ref(false); 
const isLoggedIn = ref(false); 
const isDropdownOpen = ref(false);
const dropdownRef = ref(null);
const isSearchOpen = ref(false);
const searchQuery = ref('');
const isLangDropdownOpen = ref(false);
const isChangePasswordModalOpen = ref(false);
const newPassword = ref('');
const confirmPassword = ref('');
const isUpdatingPassword = ref(false);

watch(isSidebarOpen, (open) => {
  if (open) {
    document.body.style.overflow = 'hidden';
  } else {
    document.body.style.overflow = '';
  }
});

const openChangePasswordModal = () => {
  isDropdownOpen.value = false;
  isChangePasswordModalOpen.value = true;
  newPassword.value = '';
  confirmPassword.value = '';
};

const closeChangePasswordModal = () => {
  isChangePasswordModalOpen.value = false;
};

const submitChangePassword = async () => {
  if (newPassword.value !== confirmPassword.value) {
    alert("Password baru dan konfirmasi tidak cocok!");
    return;
  }
  
  if (newPassword.value.length < 6) {
    alert("Password minimal 6 karakter!");
    return;
  }

  isUpdatingPassword.value = true;
  const { error } = await changePassword(newPassword.value);
  isUpdatingPassword.value = false;

  if (error) {
    alert("Gagal mengganti password: " + error.message);
  } else {
    alert("Password berhasil diubah!");
    closeChangePasswordModal();
  }
};

const setLanguage = (lang: string) => {
  currentLang.value = lang
  isLangDropdownOpen.value = false
}

const projectsData = [
  { id: 1, title: 'Web Absensi', desc: 'Sistem absensi online' },
  { id: 2, title: 'Aplikasi Kasir', desc: 'POS system' }
];
const mediaData = [
  { id: 1, title: 'Tutorial Vue 3', type: 'Video' },
  { id: 2, title: 'Belajar Tailwind', type: 'Artikel' }
];

const dashboardLink = computed(() => {
  const role = localStorage.getItem('user_role');
  return role === 'admin' ? '/admin' : '/user';
});

const searchResults = computed(() => {
  const query = searchQuery.value.toLowerCase().trim();

  if (!query) {
    return { directory: [], projects: [], media: [] };
  }

  const filteredDirectory = directoryData.filter((item: any) => 
    item.name?.toLowerCase().includes(query) || 
    (item.skills && item.skills.some((s: string) => s.toLowerCase().includes(query)))
  ).slice(0, 3);

  const filteredProjects = projectsData.filter((item: any) => 
    item.name?.toLowerCase().includes(query)
  ).slice(0, 3);

  const filteredMedia = mediaData.filter((item: any) => 
    item.name?.toLowerCase().includes(query)
  ).slice(0, 3);

  return {
    directory: filteredDirectory,
    projects: filteredProjects,
    media: filteredMedia
  }
})

const toggleSidebar = () => {
  isSidebarOpen.value = !isSidebarOpen.value;
};

const closeSidebar = () => {
  isSidebarOpen.value = false;
};

const navigateTo = (path: string) => {
  router.push(path);
  closeSidebar();
};

const handleLogout = async () => {
  isDropdownOpen.value = false;
  closeSidebar();
  await logout(); 
  isLoggedIn.value = false;
  await router.push('/');
  window.location.reload(); 
};

const closeDropdown = () => {
  isDropdownOpen.value = false;
};

const handleClickOutside = (event: MouseEvent) => {
  const profileButton = document.querySelector('.profile-btn'); 
  
  if (
    (dropdownRef.value && (dropdownRef.value as any).contains(event.target)) || 
    (profileButton && profileButton.contains(event.target as Node))
  ) {
    return;
  }
  
  closeDropdown();
};

const handleKeydown = (event: KeyboardEvent) => {
  if (event.key === 'Escape') {
    if (isSidebarOpen.value) closeSidebar();
  }
};

onMounted(async () => {
  const { data } = await supabase.auth.getSession();
  isLoggedIn.value = !!data.session;

  supabase.auth.onAuthStateChange((_event, session) => {
    isLoggedIn.value = !!session;
  });

  document.addEventListener('click', handleClickOutside);
  document.addEventListener('keydown', handleKeydown);
});

onUnmounted(() => {
  document.removeEventListener('click', handleClickOutside);
  document.removeEventListener('keydown', handleKeydown);
  document.body.style.overflow = '';
});
</script>

<template>
  <nav class="bg-white sticky top-0 z-50 border-b-8 border-pres-red">
    <div class="max-w-full mx-auto px-4 lg:px-6">
      <div class="flex items-center justify-between w-full h-18">
        <div class="flex items-center gap-3">
          <button
            @click="toggleSidebar"
            type="button"
            class="relative w-10 h-10 flex flex-col items-center justify-center rounded-lg hover:bg-gray-100 transition-colors focus:outline-none focus:ring-2 focus:ring-pres-blue/20"
            :aria-expanded="isSidebarOpen"
            aria-label="Toggle navigation menu"
          >
            <div class="relative w-6 h-5 flex flex-col justify-between">
              <span
                class="block w-full h-[2.5px] bg-pres-dark rounded-full transition-all duration-300 origin-center"
                :class="isSidebarOpen ? 'rotate-45 translate-y-[9px]' : ''"
              ></span>
              <span
                class="block w-full h-[2.5px] bg-pres-dark rounded-full transition-all duration-300"
                :class="isSidebarOpen ? 'opacity-0 scale-x-0' : 'opacity-100'"
              ></span>
              <span
                class="block w-full h-[2.5px] bg-pres-dark rounded-full transition-all duration-300 origin-center"
                :class="isSidebarOpen ? '-rotate-45 -translate-y-[9px]' : ''"
              ></span>
            </div>
          </button>

          <RouterLink to="/" class="shrink-0 flex items-center">
            <img src="/logo.png" alt="IT Logo" class="h-10 w-auto" />
          </RouterLink>
        </div>

        <div class="flex items-center gap-3 sm:gap-4">
          <button 
            @click='isSearchOpen = true'
            class="flex items-center text-gray-500 hover:text-pres-blue p-2 transition-colors"
            aria-label="Open search"
          >
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
            </svg>
            <span class="hidden sm:inline ml-2 text-sm font-medium">Search</span>
          </button>

          <div class="relative">
            <button
              @click="isLangDropdownOpen = !isLangDropdownOpen"
              class="text-gray-500 hover:text-blue-600 transition p-2"
              aria-label="Switch language"
            >
              <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5h12M9 3v2m1.048 9.5A18.022 18.022 0 016.412 9m6.088 9h7M11 21l5-10 5 10M12.751 5C11.783 10.77 8.07 15.61 3 18.129" />
              </svg>
            </button>

            <div 
              v-if="isLangDropdownOpen" 
              class="absolute right-0 mt-2 w-32 bg-white border border-gray-100 rounded-lg shadow-lg py-1 z-50 text-xs text-gray-700"
            >
              <button @click="setLanguage('en')" class="w-full text-left px-4 py-2 hover:bg-gray-50 transition-colors">English</button>
              <button @click="setLanguage('id')" class="w-full text-left px-4 py-2 hover:bg-gray-50 transition-colors">Indonesia</button>
              <button @click="setLanguage('zh')" class="w-full text-left px-4 py-2 hover:bg-gray-50 transition-colors">Chinese</button>
              <button @click="setLanguage('ko')" class="w-full text-left px-4 py-2 hover:bg-gray-50 transition-colors">Korean</button>
            </div>
          </div>

          <div class="h-6 w-px bg-gray-300 hidden sm:block"></div>

          <div v-if="!isLoggedIn" class="hidden sm:flex items-center">
            <button 
              @click="router.push('/login')"
              class="text-sm font-semibold text-gray-600 hover:text-blue-600 transition px-3"
            >
              {{ translations[currentLang].login }}
            </button>
          </div>

          <div v-else class="relative">
            <button 
              @click="isDropdownOpen = !isDropdownOpen" 
              class="flex profile-btn items-center focus:outline-none transition-transform hover:scale-105"
            >
              <div class="w-10 h-10 rounded-full bg-gray-200 flex items-center justify-center border border-gray-400">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                </svg>
              </div>
            </button>

            <div 
              v-if="isDropdownOpen" 
              class="absolute right-0 mt-2 w-48 bg-white border border-gray-100 rounded-xl shadow-xl py-2 z-50 animate-in fade-in zoom-in duration-200"
            >
              <RouterLink 
                :to="dashboardLink" 
                @click="closeDropdown" 
                class="block px-4 py-3 text-sm text-gray-700 hover:bg-gray-50 border-b border-gray-100"
              >
                My Dashboard
              </RouterLink>
              <button 
                @click="openChangePasswordModal" 
                class="block w-full text-left px-4 py-3 text-sm text-gray-700 hover:bg-gray-50 border-b border-gray-100 font-medium"
              >
                Ganti Password
              </button>
              <button 
                @click="handleLogout" 
                class="block w-full text-left px-4 py-3 text-sm text-red-600 hover:bg-red-50 font-medium"
              >
                Logout
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </nav>

  <Transition name="backdrop">
    <div
      v-if="isSidebarOpen"
      class="fixed inset-0 z-[60] bg-black/50 backdrop-blur-sm"
      @click="closeSidebar"
    ></div>
  </Transition>

  <Transition name="sidebar">
    <div
      v-if="isSidebarOpen"
      class="fixed top-0 left-0 z-[70] h-full w-72 sm:w-80 bg-pres-dark text-white shadow-2xl flex flex-col"
    >
      <div class="flex items-center justify-between px-6 py-5 border-b border-white/10">
        <RouterLink to="/" @click="closeSidebar" class="flex items-center gap-3">
          <img src="/logo.png" alt="IT Logo" class="h-9 w-auto brightness-0 invert" />
          <span class="text-lg font-bold tracking-wide">IT-26</span>
        </RouterLink>
        <button
          @click="closeSidebar"
          class="w-9 h-9 flex items-center justify-center rounded-lg hover:bg-white/10 transition-colors"
          aria-label="Close menu"
        >
          <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>
      </div>

      <nav class="flex-1 px-4 py-6 space-y-1 overflow-y-auto">
        <button
          @click="navigateTo('/')"
          class="w-full flex items-center gap-4 px-4 py-3.5 rounded-xl text-base font-medium text-white/80 hover:text-white hover:bg-white/10 transition-all duration-200 group"
        >
          <svg class="w-5 h-5 text-white/50 group-hover:text-white transition-colors" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
          </svg>
          {{ translations[currentLang].home }}
        </button>

        <button
          @click="navigateTo('/profile')"
          class="w-full flex items-center gap-4 px-4 py-3.5 rounded-xl text-base font-medium text-white/80 hover:text-white hover:bg-white/10 transition-all duration-200 group"
        >
          <svg class="w-5 h-5 text-white/50 group-hover:text-white transition-colors" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
          </svg>
          {{ translations[currentLang].profile }}
        </button>

        <button
          @click="navigateTo('/directory')"
          class="w-full flex items-center gap-4 px-4 py-3.5 rounded-xl text-base font-medium text-white/80 hover:text-white hover:bg-white/10 transition-all duration-200 group"
        >
          <svg class="w-5 h-5 text-white/50 group-hover:text-white transition-colors" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" />
          </svg>
          {{ translations[currentLang].directory }}
        </button>

        <button
          @click="navigateTo('/projects')"
          class="w-full flex items-center gap-4 px-4 py-3.5 rounded-xl text-base font-medium text-white/80 hover:text-white hover:bg-white/10 transition-all duration-200 group"
        >
          <svg class="w-5 h-5 text-white/50 group-hover:text-white transition-colors" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
          </svg>
          {{ translations[currentLang].projects }}
        </button>

        <button
          @click="navigateTo('/media')"
          class="w-full flex items-center gap-4 px-4 py-3.5 rounded-xl text-base font-medium text-white/80 hover:text-white hover:bg-white/10 transition-all duration-200 group"
        >
          <svg class="w-5 h-5 text-white/50 group-hover:text-white transition-colors" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
          </svg>
          {{ translations[currentLang].media }}
        </button>
      </nav>

      <div class="px-4 py-5 border-t border-white/10">
        <button
          v-if="!isLoggedIn"
          @click="navigateTo('/login')"
          class="w-full flex items-center justify-center gap-2 px-4 py-3 rounded-xl bg-white/10 text-white font-medium hover:bg-white/20 transition-colors"
        >
          <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1" />
          </svg>
          {{ translations[currentLang].login }}
        </button>

        <button
          v-else
          @click="handleLogout"
          class="w-full flex items-center justify-center gap-2 px-4 py-3 rounded-xl bg-red-500/20 text-red-300 font-medium hover:bg-red-500/30 transition-colors"
        >
          <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
          </svg>
          Logout
        </button>
      </div>
    </div>
  </Transition>

  <div 
    v-if="isSearchOpen" 
    class="fixed inset-0 z-[100] flex items-start justify-center pt-24 bg-gray-900/50 backdrop-blur-sm"
    @click.self="isSearchOpen = false"
  >
    <div class="bg-white w-full max-w-2xl rounded-2xl shadow-2xl overflow-hidden flex flex-col mx-4">
      
      <div class="flex items-center px-4 py-4 border-b border-gray-100">
        <svg class="w-6 h-6 text-gray-400 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
        </svg>
        <input 
          v-model="searchQuery"
          type="text" 
          placeholder="Search directory, projects, media..." 
          class="flex-1 bg-transparent text-gray-800 text-lg focus:outline-none placeholder-gray-400"
          autofocus
        />
        <button @click="isSearchOpen = false" class="text-xs font-medium text-gray-500 bg-gray-100 px-2 py-1 rounded hover:bg-gray-200">
          ESC
        </button>
      </div>

      <div class="p-4 max-h-[60vh] overflow-y-auto">
        
        <div v-if="!searchQuery" class="text-sm text-gray-400 text-center py-8">
          Ketik sesuatu untuk mulai mencari di Directory, Projects, atau Media.
        </div>

        <div v-else-if="searchResults.directory.length === 0 && searchResults.projects.length === 0 && searchResults.media.length === 0" class="text-sm text-gray-500 text-center py-8">
          Tidak menemukan apapun untuk "<span class="font-semibold text-gray-800">{{ searchQuery }}</span>"
        </div>

        <div v-else class="space-y-6">
          
          <div v-if="searchResults.directory.length > 0">
            <h3 class="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2 px-3">Directory</h3>
            <ul class="space-y-1">
              <li v-for="student in searchResults.directory" :key="student.nim">
                <a href="#" class=" px-3 py-2 rounded-lg hover:bg-blue-50 transition flex justify-between items-center group">
                  <div>
                    <div class="text-sm font-medium text-gray-800 group-hover:text-blue-700">{{ student.name }}</div>
                    <div class="text-xs text-gray-500">{{ student.nim }}</div>
                  </div>
                  <span class="text-xs text-blue-600 opacity-0 group-hover:opacity-100 transition">Lihat &rarr;</span>
                </a>
              </li>
            </ul>
          </div>

          <div v-if="searchResults.projects.length > 0">
            <h3 class="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2 px-3">Projects</h3>
            <ul class="space-y-1">
              <li v-for="project in searchResults.projects" :key="project.id">
                <a href="#" class="block px-3 py-2 rounded-lg hover:bg-blue-50 transition group">
                  <div class="text-sm font-medium text-gray-800 group-hover:text-blue-700">{{ project.title }}</div>
                  <div class="text-xs text-gray-500">{{ project.desc }}</div>
                </a>
              </li>
            </ul>
          </div>

          <div v-if="searchResults.media.length > 0">
            <h3 class="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2 px-3">Media</h3>
            <ul class="space-y-1">
              <li v-for="media in searchResults.media" :key="media.id">
                <a href="#" class="flex items-center px-3 py-2 rounded-lg hover:bg-blue-50 transition group">
                  <svg class="w-4 h-4 text-gray-400 mr-2 group-hover:text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14.752 11.168l-3.197-2.132A1 1 0 0010 9.87v4.263a1 1 0 001.555.832l3.197-2.132a1 1 0 000-1.664z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                  <div class="text-sm font-medium text-gray-800 group-hover:text-blue-700">{{ media.title }}</div>
                </a>
              </li>
            </ul>
          </div>

        </div>
      </div>

    </div>
  </div>

  <div 
    v-if="isChangePasswordModalOpen" 
    class="fixed inset-0 z-[9999] flex items-center justify-center bg-black/60 backdrop-blur-sm"
  >
    <div class="bg-white dark:bg-gray-800 rounded-2xl shadow-2xl w-full max-w-md p-6 relative mx-4 animate-in fade-in zoom-in-95 duration-200">
      
      <button 
        @click="closeChangePasswordModal" 
        type="button"
        class="absolute top-4 right-4 text-gray-400 hover:text-gray-600 dark:hover:text-white transition-colors"
      >
        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"></path>
        </svg>
      </button>
      
      <h3 class="text-xl font-bold text-gray-900 dark:text-white mb-6">
        Ganti Password
      </h3>
      
      <form @submit.prevent="submitChangePassword" class="space-y-4">
        <div>
          <label class="block mb-2 text-sm font-medium text-gray-700 dark:text-gray-300">Password Baru</label>
          <input 
            type="password" 
            v-model="newPassword" 
            required 
            class="w-full px-4 py-2.5 bg-gray-50 dark:bg-gray-700 border border-gray-300 dark:border-gray-600 rounded-xl text-gray-900 dark:text-white focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none text-sm" 
            placeholder="••••••••"
          >
        </div>
        
        <div>
          <label class="block mb-2 text-sm font-medium text-gray-700 dark:text-gray-300">Konfirmasi Password Baru</label>
          <input 
            type="password" 
            v-model="confirmPassword" 
            required 
            class="w-full px-4 py-2.5 bg-gray-50 dark:bg-gray-700 border border-gray-300 dark:border-gray-600 rounded-xl text-gray-900 dark:text-white focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none text-sm" 
            placeholder="••••••••"
          >
        </div>
        
        <button 
          type="submit" 
          :disabled="isUpdatingPassword" 
          class="w-full mt-2 text-white bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:outline-none focus:ring-blue-300 font-semibold rounded-xl text-sm px-5 py-3 text-center dark:bg-blue-500 dark:hover:bg-blue-600 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
        >
          {{ isUpdatingPassword ? 'Menyimpan...' : 'Simpan Password' }}
        </button>
      </form>
      
    </div>
  </div>
</template>
