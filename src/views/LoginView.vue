<template>
  <div class="login-wrapper">
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
                <a href="#" @click.prevent="openForgotModal" class="text-sm text-blue-600 hover:underline">
                  {{ translations[currentLang].loginForgot }}
                </a>
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
    </div>
    <!-- MODAL FORGOT PASSWORD -->
    <div v-if="showForgotModal" class="fixed inset-0 z-50 flex items-center justify-center bg-black/50 px-4">
      <div class="bg-white rounded-xl shadow-2xl w-full max-w-md p-6">
        <h2 class="text-xl font-bold text-gray-900 mb-2">Reset Password</h2>
        <p class="text-sm text-gray-500 mb-6">Masukkan Username dan Email Anda yang terdaftar untuk verifikasi data.</p>
        
        <div class="space-y-4">
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Username</label>
            <input 
              v-model="forgotUsername" 
              type="text" 
              placeholder="Contoh: johndoe"
              class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
            />
          </div>
          
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Email</label>
            <input 
              v-model="forgotEmail" 
              type="email" 
              placeholder="Contoh: johndoe@presuit26.com"
              class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
            />
          </div>

          <div v-if="forgotErrorMessage" class="text-sm text-red-500 bg-red-50 p-2 rounded">
            {{ forgotErrorMessage }}
          </div>
        </div>

        <div class="mt-6 flex justify-end gap-3">
          <button 
            @click="closeForgotModal" 
            class="px-4 py-2 text-sm font-medium text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-lg transition-colors"
          >
            Batal
          </button>
          <button 
            @click="submitForgotPassword" 
            :disabled="isForgotLoading"
            class="px-4 py-2 text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 rounded-lg transition-colors disabled:bg-blue-400"
          >
            {{ isForgotLoading ? 'Memverifikasi...' : 'Kirim Request' }}
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";
import { useRouter } from "vue-router"; 
import { login, requestForgotPassword } from "../services/authService";
import { currentLang, translations } from '../store/langStore';
import { supabase } from "../lib/supabase";

const router = useRouter(); 
const showForgotModal = ref(false);
const forgotUsername = ref("");
const forgotEmail = ref("");
const isForgotLoading = ref(false);
const forgotErrorMessage = ref("");
const emailOrUsername = ref("");
const password = ref("");
const loading = ref(false);
const errorMessage = ref("");

const openForgotModal = () => {
  showForgotModal.value = true;
  forgotUsername.value = "";
  forgotEmail.value = "";
  forgotErrorMessage.value = "";
};

const closeForgotModal = () => {
  showForgotModal.value = false;
};

// Fungsi Submit & Validasi
const submitForgotPassword = async () => {
  if (!forgotUsername.value || !forgotEmail.value) {
    forgotErrorMessage.value = "Username dan Email wajib diisi!";
    return;
  }

  isForgotLoading.value = true;
  forgotErrorMessage.value = "";

  try {
    // 1. Validasi ke tabel profiles_user dan ambil ID & username
    const { data: userMatch, error: matchError } = await supabase
      .from('profiles_user')
      .select('id, username')
      .eq('username', forgotUsername.value)
      .eq('email', forgotEmail.value)
      .maybeSingle();

    if (matchError) throw matchError;

    if (!userMatch) {
      forgotErrorMessage.value = "Username dan Email tidak cocok atau tidak ditemukan.";
      isForgotLoading.value = false;
      return; 
    }

    // 2. Kirim ke tabel buatan temen lu
    const { error: insertError } = await supabase
      .from('password_reset_requests')
      .insert([
        { 
          user_id: userMatch.id, 
          username: userMatch.username,
          status: 'pending'
        }
      ]);

    if (insertError) throw insertError;

    alert("Berhasil! Permintaan reset password telah dikirim ke Admin.");
    closeForgotModal();

  } catch (error: any) {
    console.error("Error validasi forgot password:", error.message);
    forgotErrorMessage.value = "Terjadi kesalahan pada sistem.";
  } finally {
    isForgotLoading.value = false;
  }
};

// @ts-ignore
const handleForgotPassword = async () => {
  if (!emailOrUsername.value) {
    alert("Silakan isi kolom Username atau Email terlebih dahulu!");
    return;
  }

  loading.value = true;
  const { error } = await requestForgotPassword(emailOrUsername.value);
  loading.value = false;

  if (error) {
    alert("Gagal mengirim request: " + error.message);
  } else {
    alert("Permintaan reset password telah dikirim ke Admin. Silakan hubungi admin untuk konfirmasi.");
  }
};

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
</script>