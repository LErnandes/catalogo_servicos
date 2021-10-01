yarn build

cd dist

git init
git remote add origin git@github.com:LErnandes/catalogo_servicos_page.git

git add .
git commit -m 'Uploading dist'

git branch -M main
git push origin main
