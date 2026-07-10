<template>
  <div class="min-h-[calc(100vh-64px)] bg-gray-50 flex flex-col justify-center py-12 sm:px-6 lg:px-8">
    <div class="sm:mx-auto sm:w-full sm:max-w-md">
      <div class="flex justify-center">
        <div class="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mb-4">
          <svg class="w-8 h-8 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path></svg>
        </div>
      </div>
      <h2 class="mt-2 text-center text-3xl font-extrabold text-gray-900">
        Ubah Password
      </h2>
      <p class="mt-2 text-center text-sm text-gray-600">
        Pastikan password Anda panjang dan acak agar tetap aman.
      </p>
    </div>

    <div class="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
      <div class="bg-white py-8 px-4 shadow-xl sm:rounded-2xl sm:px-10 border border-gray-100">
        <form class="space-y-6" @submit.prevent="handleChangePassword">
          <div>
            <label for="newPassword" class="block text-sm font-semibold text-gray-700">Password Baru</label>
            <div class="mt-1">
              <input id="newPassword" v-model="newPassword" type="password" required minlength="6" class="appearance-none block w-full px-3 py-2.5 border border-gray-300 rounded-lg shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
            </div>
          </div>

          <div>
            <label for="confirmPassword" class="block text-sm font-semibold text-gray-700">Konfirmasi Password Baru</label>
            <div class="mt-1">
              <input id="confirmPassword" v-model="confirmPassword" type="password" required minlength="6" class="appearance-none block w-full px-3 py-2.5 border border-gray-300 rounded-lg shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
            </div>
          </div>

          <div v-if="passwordMessage" :class="passwordSuccess ? 'bg-green-50 text-green-700 border-green-200' : 'bg-red-50 text-red-700 border-red-200'" class="px-4 py-3 rounded-lg border text-sm flex items-center shadow-sm">
            <svg v-if="passwordSuccess" class="w-5 h-5 mr-2 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
            <svg v-else class="w-5 h-5 mr-2 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd"></path></svg>
            {{ passwordMessage }}
          </div>

          <div>
            <button type="submit" :disabled="isChangingPassword" class="w-full flex justify-center py-2.5 px-4 border border-transparent rounded-lg shadow-sm text-sm font-semibold text-white bg-gray-900 hover:bg-gray-800 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-900 transition-colors disabled:opacity-50">
              {{ isChangingPassword ? 'Menyimpan...' : 'Simpan Password' }}
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { supabase } from '../lib/supabase'

const newPassword = ref('')
const confirmPassword = ref('')
const isChangingPassword = ref(false)
const passwordMessage = ref('')
const passwordSuccess = ref(false)

const handleChangePassword = async () => {
  if (newPassword.value !== confirmPassword.value) {
    passwordSuccess.value = false
    passwordMessage.value = "Password konfirmasi tidak cocok!"
    return
  }

  isChangingPassword.value = true
  passwordMessage.value = ""
  
  try {
    const { error } = await supabase.auth.updateUser({
      password: newPassword.value
    })

    if (error) throw error

    passwordSuccess.value = true
    passwordMessage.value = "Password berhasil diperbarui!"
    newPassword.value = ""
    confirmPassword.value = ""
  } catch (error: any) {
    console.error("Change password error:", error)
    passwordSuccess.value = false
    passwordMessage.value = error.message || "Gagal mengubah password."
  } finally {
    isChangingPassword.value = false
  }
}
</script>
