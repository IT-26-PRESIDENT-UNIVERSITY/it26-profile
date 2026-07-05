const fs = require('fs');
const file = 'src/data/dataMahasiswa.json';
const data = JSON.parse(fs.readFileSync(file, 'utf8'));

let sql = `DO $$
DECLARE
  new_uid uuid;
BEGIN
`;

data.forEach(s => {
    const email = s.email;
    const username = email.split('@')[0];
    
    sql += `  new_uid := gen_random_uuid();\n`;
    sql += `  INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user) \n`;
    sql += `  VALUES (new_uid, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', '${email}', crypt('Presuit26!', gen_salt('bf')), now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false, false);\n`;
    
    sql += `  INSERT INTO public.profiles_user (id, email, username) VALUES (new_uid, '${email}', '${username}');\n\n`;
});

sql += 'END $$;\n';

fs.writeFileSync('insert_users.sql', sql);
console.log('SQL generated. Length: ' + sql.length);
