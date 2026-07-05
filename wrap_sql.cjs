const fs = require('fs');
const content = fs.readFileSync('insert_users.sql', 'utf8');
const markdown = '```sql\n' + content + '\n```';
fs.writeFileSync('C:/Users/Salman/.gemini/antigravity/brain/b0e1eb94-bc0c-4451-ac0a-30bfee9b602c/sql_script.md', markdown);
console.log('Wrapped successfully');
