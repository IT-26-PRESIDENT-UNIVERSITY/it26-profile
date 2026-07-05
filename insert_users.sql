DO $$
DECLARE
  new_uid uuid;
BEGIN
  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'larryyuristan@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'larryyuristan@presuit26.com', 'larryyuristan');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'immanuelelvandokenjam@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'immanuelelvandokenjam@presuit26.com', 'immanuelelvandokenjam');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'davinohazzeliomarzel@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'davinohazzeliomarzel@presuit26.com', 'davinohazzeliomarzel');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'nirmalasari@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'nirmalasari@presuit26.com', 'nirmalasari');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'azzahranabila@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'azzahranabila@presuit26.com', 'azzahranabila');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'aishakalilanuryasin@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'aishakalilanuryasin@presuit26.com', 'aishakalilanuryasin');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'nikolaskenziewinata@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'nikolaskenziewinata@presuit26.com', 'nikolaskenziewinata');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'muhamadadrianhafiz@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'muhamadadrianhafiz@presuit26.com', 'muhamadadrianhafiz');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'tegararyawiratama@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'tegararyawiratama@presuit26.com', 'tegararyawiratama');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'asyazuhdi@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'asyazuhdi@presuit26.com', 'asyazuhdi');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'ibnuyusufdamarbagaskara@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'ibnuyusufdamarbagaskara@presuit26.com', 'ibnuyusufdamarbagaskara');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'raisfatihulihsan@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'raisfatihulihsan@presuit26.com', 'raisfatihulihsan');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'azzammaimunaly@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'azzammaimunaly@presuit26.com', 'azzammaimunaly');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'cahyasalsabela@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'cahyasalsabela@presuit26.com', 'cahyasalsabela');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'daffaadityafirmansyah@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'daffaadityafirmansyah@presuit26.com', 'daffaadityafirmansyah');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'navisaadindanaftali@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'navisaadindanaftali@presuit26.com', 'navisaadindanaftali');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'claraanastasya@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'claraanastasya@presuit26.com', 'claraanastasya');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'elmiaputrizahrotusita@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'elmiaputrizahrotusita@presuit26.com', 'elmiaputrizahrotusita');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'aryadillonoahpraharsayogadharma@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'aryadillonoahpraharsayogadharma@presuit26.com', 'aryadillonoahpraharsayogadharma');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'fairuzsyauqi@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'fairuzsyauqi@presuit26.com', 'fairuzsyauqi');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'muhammadfaridmukhtar@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'muhammadfaridmukhtar@presuit26.com', 'muhammadfaridmukhtar');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'muhamadsalman@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'muhamadsalman@presuit26.com', 'muhamadsalman');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'mohammadrajifputramulia@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'mohammadrajifputramulia@presuit26.com', 'mohammadrajifputramulia');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'armevya@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'armevya@presuit26.com', 'armevya');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'ranggadwipapanjicatakaarsandy@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'ranggadwipapanjicatakaarsandy@presuit26.com', 'ranggadwipapanjicatakaarsandy');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'mukhammadsayyidrusli@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'mukhammadsayyidrusli@presuit26.com', 'mukhammadsayyidrusli');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'azzahranabila@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'azzahranabila@presuit26.com', 'azzahranabila');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'riamaaudreyputrinababan@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'riamaaudreyputrinababan@presuit26.com', 'riamaaudreyputrinababan');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'shalikaavantikasahadeputri@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'shalikaavantikasahadeputri@presuit26.com', 'shalikaavantikasahadeputri');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'derriankalalo@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'derriankalalo@presuit26.com', 'derriankalalo');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'arkhanpratama@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'arkhanpratama@presuit26.com', 'arkhanpratama');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'sepbrianaldhifirmansyah@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'sepbrianaldhifirmansyah@presuit26.com', 'sepbrianaldhifirmansyah');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'miguelanthonysuripatty@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'miguelanthonysuripatty@presuit26.com', 'miguelanthonysuripatty');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'muhammadharlan@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'muhammadharlan@presuit26.com', 'muhammadharlan');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'lumbantoruanalbert@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'lumbantoruanalbert@presuit26.com', 'lumbantoruanalbert');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'chironoroupienne@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'chironoroupienne@presuit26.com', 'chironoroupienne');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'zaskiapramisela@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'zaskiapramisela@presuit26.com', 'zaskiapramisela');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'nakahalkayzah@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'nakahalkayzah@presuit26.com', 'nakahalkayzah');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'marvel@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'marvel@presuit26.com', 'marvel');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'carlsonwilliam@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'carlsonwilliam@presuit26.com', 'carlsonwilliam');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'claudiagracelyn@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'claudiagracelyn@presuit26.com', 'claudiagracelyn');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'anandabagussatria@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'anandabagussatria@presuit26.com', 'anandabagussatria');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'andizulfan@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'andizulfan@presuit26.com', 'andizulfan');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'militia@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'militia@presuit26.com', 'militia');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'nancyfiantika@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'nancyfiantika@presuit26.com', 'nancyfiantika');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'jonathanemor@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'jonathanemor@presuit26.com', 'jonathanemor');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'kesyah@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'kesyah@presuit26.com', 'kesyah');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'monicafloraycintaberla@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'monicafloraycintaberla@presuit26.com', 'monicafloraycintaberla');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'anzani@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'anzani@presuit26.com', 'anzani');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'gabriellesutrisno@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'gabriellesutrisno@presuit26.com', 'gabriellesutrisno');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'nicopratama@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'nicopratama@presuit26.com', 'nicopratama');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'chaviazagitaunprano@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'chaviazagitaunprano@presuit26.com', 'chaviazagitaunprano');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'nasya@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'nasya@presuit26.com', 'nasya');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'alex@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'alex@presuit26.com', 'alex');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'tiarahikmahintanmaulani@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'tiarahikmahintanmaulani@presuit26.com', 'tiarahikmahintanmaulani');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'sisiliacelsi@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'sisiliacelsi@presuit26.com', 'sisiliacelsi');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'farhan@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'farhan@presuit26.com', 'farhan');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'grasiellanovarie@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'grasiellanovarie@presuit26.com', 'grasiellanovarie');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'arrasyaalgifarieprasetyo@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'arrasyaalgifarieprasetyo@presuit26.com', 'arrasyaalgifarieprasetyo');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'najwaabdjanur@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'najwaabdjanur@presuit26.com', 'najwaabdjanur');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'rayisafiaamanditha@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'rayisafiaamanditha@presuit26.com', 'rayisafiaamanditha');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'windarahmadani@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'windarahmadani@presuit26.com', 'windarahmadani');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'daniera@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'daniera@presuit26.com', 'daniera');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'rafi@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'rafi@presuit26.com', 'rafi');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'elioarkanantaputra@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'elioarkanantaputra@presuit26.com', 'elioarkanantaputra');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'putrisimanjuntak@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'putrisimanjuntak@presuit26.com', 'putrisimanjuntak');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'rey@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'rey@presuit26.com', 'rey');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'akhtar@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'akhtar@presuit26.com', 'akhtar');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'callysta@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'callysta@presuit26.com', 'callysta');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'sebastiantirayoh@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'sebastiantirayoh@presuit26.com', 'sebastiantirayoh');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'oktaviasyadzaramadani@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'oktaviasyadzaramadani@presuit26.com', 'oktaviasyadzaramadani');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'syaikh@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'syaikh@presuit26.com', 'syaikh');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'farikhaharumnirwana@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'farikhaharumnirwana@presuit26.com', 'farikhaharumnirwana');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'raihan@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'raihan@presuit26.com', 'raihan');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'zhellpedrosamosir@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'zhellpedrosamosir@presuit26.com', 'zhellpedrosamosir');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'andreasmarlontampubolon@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'andreasmarlontampubolon@presuit26.com', 'andreasmarlontampubolon');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'dhimazjanuarinoputraananta@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'dhimazjanuarinoputraananta@presuit26.com', 'dhimazjanuarinoputraananta');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'muhammadrafliputrapersada@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'muhammadrafliputrapersada@presuit26.com', 'muhammadrafliputrapersada');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'muhammadherdanialamsyah@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'muhammadherdanialamsyah@presuit26.com', 'muhammadherdanialamsyah');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'raschal@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'raschal@presuit26.com', 'raschal');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'riskaliraauliya@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'riskaliraauliya@presuit26.com', 'riskaliraauliya');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'husainifirdaus@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'husainifirdaus@presuit26.com', 'husainifirdaus');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'zaedsabil@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'zaedsabil@presuit26.com', 'zaedsabil');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'zyreliabeatrice@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'zyreliabeatrice@presuit26.com', 'zyreliabeatrice');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'izdiharibrahim@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'izdiharibrahim@presuit26.com', 'izdiharibrahim');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'andinilidyasealfiharefa@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'andinilidyasealfiharefa@presuit26.com', 'andinilidyasealfiharefa');

  new_uid := gen_random_uuid();
  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) 
  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'anjanirachel@presuit26.com', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);
  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, 'anjanirachel@presuit26.com', 'anjanirachel');

END $$;
