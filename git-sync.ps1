Write-Host "🚀 Starting Git Sync..."

git add .

$time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
git commit -m "auto sync: $time"

git push origin main

Write-Host "✅ Sync complete."