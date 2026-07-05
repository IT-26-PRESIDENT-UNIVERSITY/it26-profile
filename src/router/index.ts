import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import { supabase } from "../lib/supabase";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/directory',
      name: 'directory',
      component: () => import('../views/DirectoryView.vue')
    },
    {
      path: '/projects',
      name: 'projects',
      component: () => import('../views/ProjectsView.vue')
    },
    {
      path: '/media',
      name: 'media',
      component: () => import('../views/MediaView.vue')
    },
    {
      path: '/profile',
      name: 'profile',
      component: () => import('../views/ProfileView.vue')
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('../views/LoginView.vue')
    },
    // {
    //   path: '/sign-up',
    //   name: 'signUp',
    //   component: () => import('../views/SignUpView.vue')
    // },
    {
      path: '/admin',
      name: 'admin',
      component: () => import('../views/admin/AdminDashboard.vue'),
      meta: { requiresAuth: true, role: 'admin' }
    },
    {
      path: '/user',
      name: 'user',
      component: () => import('../views/user/UserDashboard.vue'),
      meta: { requiresAuth: true, role: 'user' }
    },
  ]
})

router.beforeEach(async (to, _from, next) => {
  const { data: { session } } = await supabase.auth.getSession();

  const requiresAuth = to.matched.some(record => record.meta.requiresAuth);
  const requiredRole = to.meta.role;

  const userRole = localStorage.getItem('user_role');

  if (requiresAuth && !session) {
    return next('/login');
  }

  if (to.path === '/login' && session) {
    return next(userRole === 'admin' ? '/admin' : '/user');
  }

  if (requiresAuth && session && requiredRole) {
    if (userRole !== requiredRole) {
      return next(userRole === 'admin' ? '/admin' : '/user');
    }
  }

  next();
});

export default router