<template>
  <div class="h-[calc(100vh-64px)] flex bg-white overflow-hidden">
    <div class="flex-1 flex flex-col justify-center px-10 lg:px-20 xl:px-32 bg-white">
      <div class="w-full max-w-md mx-auto">
        <div class="mb-8">
          <div class="mb-8">
            <img src="/logo.png" alt="Logo PU" class="w-16 h-16 object-contain" />
          </div>
        </div>

        <h1 class="text-4xl font-bold text-gray-900 mb-2">{{ translations[currentLang].loginWelcome }}</h1>
        <p class="text-gray-500 mb-8">{{ translations[currentLang].loginSubtitle }}</p>
        <p v-if="errorMessage" class="mb-4 text-sm text-red-500">{{ errorMessage }}</p>

        <form @submit.prevent="handleLogin" class="space-y-6">
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">{{ translations[currentLang].loginUsernameLabel }}</label>
            <input
              v-model="emailOrUsername" 
              type="text" 
              required
              :placeholder=" translations[currentLang].loginUsernamePlaceholder "
              class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>

          <div>
            <div class="flex justify-between items-center mb-2">
              <label class="text-sm font-medium text-gray-700">{{ translations[currentLang].passwordLabel }}</label>
              <a href="#" @click.prevent="showForgotPassword = true" class="text-sm text-blue-600 hover:underline">{{ translations[currentLang].loginForgot }}?</a>
            </div>
            <input 
              v-model="password" 
              type="password" 
              required
              placeholder="••••••••"
              class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all"
            />
          </div>

          <button
            type="submit"
            :disabled="loading"
            class="w-full bg-gray-900 hover:bg-gray-800 disabled:bg-gray-500 text-white font-semibold py-3 rounded-lg transition-all shadow-lg hover:shadow-xl">
            {{ loading ? "Logging in..." : "Login" }}
          </button>
        </form>
      </div>
    </div>

    <div class="hidden lg:block w-1/2 p-6 lg:p-8 h-full pt-6 pb-4">
      <div class="relative w-full h-full overflow-hidden rounded-3xl shadow-xl bg-gray-100">
        <img 
          src="/gedung-pu.png" 
          alt="Computer Science Building" 
          class="absolute inset-0 w-full h-full object-cover" />
        <div class="absolute inset-0 bg-black/10"></div> 
      </div>
    </div>

    <!-- Forgot Password Modal -->
    <div v-if="showForgotPassword" class="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
      <div class="bg-white rounded-xl shadow-xl w-full max-w-md p-6 relative">
        <button @click="showForgotPassword = false" class="absolute top-4 right-4 text-gray-400 hover:text-gray-600">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
        </button>
        <h3 class="text-xl font-bold text-gray-900 mb-4">Lupa Password</h3>
        <p class="text-gray-600 mb-4 text-sm">Masukkan username Anda. Permintaan reset password akan dikirim ke admin untuk disetujui.</p>
        
        <form @submit.prevent="handleForgotPassword" class="space-y-4">
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Username</label>
            <input v-model="forgotUsername" type="text" required class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500" placeholder="Masukkan username">
          </div>
          <div v-if="forgotMessage" :class="forgotSuccess ? 'text-green-600' : 'text-red-600'" class="text-sm">
            {{ forgotMessage }}
          </div>
          <button type="submit" :disabled="forgotLoading" class="w-full bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white font-medium py-2 rounded-lg transition-colors">
            {{ forgotLoading ? 'Mengirim...' : 'Kirim Permintaan' }}
          </button>
        </form>
      </div>
    </div>

  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";
import { useRouter } from "vue-router"; 
import { login } from "../services/authService";
import { currentLang, translations } from '../store/langStore';

const router = useRouter(); 

const emailOrUsername = ref("");
const password = ref("");
const loading = ref(false);
const errorMessage = ref("");

// Forgot Password Modal State
const showForgotPassword = ref(false);
const forgotUsername = ref("");
const forgotLoading = ref(false);
const forgotMessage = ref("");
const forgotSuccess = ref(false);

const handleLogin = async () => {
  loading.value = true;
  errorMessage.value = "";

  // Ambil data role hasil pengecekan dinamis
  const { role, error } = await login(emailOrUsername.value, password.value);

  if (error) {
    errorMessage.value = (error as any).message || "Email atau password salah.";
    loading.value = false;
    return; 
  }

  loading.value = false;

  // Navigasi pintar sesuai dengan role akun yang masuk
  if (role === 'admin') {
    router.push('/admin');
  } else if (role === 'user') {
    router.push('/user');
  } else {
    errorMessage.value = "Akun berhasil masuk, tetapi role tidak terdaftar.";
  }
};

const handleForgotPassword = async () => {
  if (!forgotUsername.value.trim()) return;
  
  forgotLoading.value = true;
  forgotMessage.value = "";
  forgotSuccess.value = false;

  try {
    const { supabase } = await import('../lib/supabase');
    const { error } = await supabase.rpc('request_password_reset', { p_username: forgotUsername.value });
    
    if (error) throw error;
    
    forgotSuccess.value = true;
    forgotMessage.value = "Permintaan reset password berhasil dikirim ke Admin.";
    forgotUsername.value = "";
  } catch (error: any) {
    console.error("Forgot password error:", error);
    forgotSuccess.value = false;
    forgotMessage.value = "Gagal mengirim permintaan. Pastikan username benar.";
  } finally {
    forgotLoading.value = false;
  }
};
</script>