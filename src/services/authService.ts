import { supabase } from "../lib/supabase"; 

// 1. Fungsi untuk Login (DITAMBAHKAN LOGIKA ROLE)
export async function login(email: string, password: string) {
  const { data: authData, error } = await supabase.auth.signInWithPassword({
    email,
    password,
  });

  if (error) throw error;

  // Jika login berhasil, ambil rolenya dan simpan ke localStorage
  if (authData.user) {
    const role = await getUserRole(authData.user.id);
    if (role) {
      localStorage.setItem('user_role', role);
    }
  }

  return { data: authData, error };
}

// 2. Fungsi untuk Logout (DITAMBAHKAN PENGHAPUSAN ROLE)
export async function logout() {
  // Hapus role dari storage sebelum logout agar bersih
  localStorage.removeItem('user_role');
  
  const { error } = await supabase.auth.signOut();
  if (!error) {
    window.location.href = '/login'; 
  }
}

// Fungsi getUserRole tetap sama
export async function getUserRole(userId: string) {
  const { data, error } = await supabase
    .from('profiles') 
    .select('role')    
    .eq('id', userId) 
    .single();            

  if (error) return null;
  return data?.role; 
}

// Fungsi lainnya tidak berubah
export async function getCurrentUser() {
  return await supabase.auth.getUser();
}

export async function getSession() {
  return await supabase.auth.getSession();
}