import { supabase } from "../lib/supabase"; 

export async function login(emailOrUsername: string, password: string) {
  let loginEmail = emailOrUsername;

  const isEmail = emailOrUsername.includes('@');

  if (!isEmail) {
    const { data, error: rpcError } = await supabase
      .rpc('get_email_by_username', { input_username: emailOrUsername });

    if (rpcError || !data) {
      return { data: null, role: null, error: { message: "Username tidak ditemukan." } };
    }

    loginEmail = data; 
  }

  const { data: authData, error } = await supabase.auth.signInWithPassword({
    email: loginEmail,
    password,
  });

  if (error) return { data: null, role: null, error };

  let userRole: string | null = null;

  if (authData.user) {
    userRole = await getUserRole(authData.user.id);
    
    if (userRole) {
      localStorage.setItem('user_role', userRole);
    }
  }

  return { data: authData, role: userRole, error: null };
}

export async function logout() {
  localStorage.removeItem('user_role');
  
  const { error } = await supabase.auth.signOut();
  if (!error) {
    window.location.href = '/login'; 
  }
}

export async function getUserRole(userId: string) {
  const { data: adminData, error: adminError } = await supabase
    .from('profiles_admin') 
    .select('id')    
    .eq('id', userId) 
    .maybeSingle(); 

  if (adminError) console.error("Admin check error:", adminError);
  if (adminData) return 'admin';

  const { data: userData, error: userError } = await supabase
    .from('profiles_user') 
    .select('id')    
    .eq('id', userId) 
    .maybeSingle();

  if (userError) console.error("User check error:", userError);
  if (userData) return 'user';

  return null; 
}

export async function getCurrentUser() {
  return await supabase.auth.getUser();
}

export async function getSession() {
  return await supabase.auth.getSession();
}

// Fungsi buat ganti password user yang sedang login
export async function changePassword(newPassword: string) {

  const { data, error } = await supabase.auth.updateUser({
    password: newPassword
  });
  return { data, error };
}

// Fungsi untuk membuat request forgot password ke Admin
export async function requestForgotPassword(emailOrUsername: string) {
  let userEmail = emailOrUsername;
  const isEmail = emailOrUsername.includes('@');

  // 1. Kalau inputnya username, cari dulu email-nya pakai RPC yang udah lu punya
  if (!isEmail) {
    const { data: resolvedEmail, error: rpcError } = await supabase
      .rpc('get_email_by_username', { input_username: emailOrUsername });

    if (rpcError || !resolvedEmail) {
      return { error: { message: "Username tidak ditemukan." } };
    }
    userEmail = resolvedEmail;
  }

  // 2. Masukkan data request ke tabel antrean di Supabase
  const { error } = await supabase
    .from('forgot_password_requests')
    .insert([
      { 
        username_or_email: emailOrUsername, 
        email: userEmail,
        status: 'pending' // status awal antrean
      }
    ]);

  return { error };
}