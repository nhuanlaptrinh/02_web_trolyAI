# Script khởi động Device Emulator
# Tự động chạy server và mở trình duyệt

Write-Host "🚀 Đang khởi động Device Emulator..." -ForegroundColor Green

# Kiểm tra xem port 8000 có đang được sử dụng không
$portInUse = netstat -ano | findstr ":8000"
if ($portInUse) {
    Write-Host "⚠️  Port 8000 đang được sử dụng. Đang dừng process cũ..." -ForegroundColor Yellow
    $process = Get-NetTCPConnection -LocalPort 8000 -ErrorAction SilentlyContinue
    if ($process) {
        Stop-Process -Id $process.OwningProcess -Force -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 2
    }
}

# Khởi động Python HTTP Server trong background
Write-Host "📡 Đang khởi động HTTP Server trên port 8000..." -ForegroundColor Cyan
Start-Process python -ArgumentList "-m", "http.server", "8000" -WindowStyle Hidden

# Đợi server khởi động
Start-Sleep -Seconds 2

# Mở trình duyệt với Device Emulator
Write-Host "🌐 Đang mở trình duyệt..." -ForegroundColor Cyan
Start-Process "http://localhost:8000/device-emulator.html"

Write-Host ""
Write-Host "✅ Hoàn tất! Device Emulator đã được mở trong trình duyệt." -ForegroundColor Green
Write-Host ""
Write-Host "📌 URL: http://localhost:8000/device-emulator.html" -ForegroundColor Yellow
Write-Host ""
Write-Host "💡 Để dừng server, nhấn Ctrl+C trong cửa sổ này hoặc đóng cửa sổ PowerShell." -ForegroundColor Gray
Write-Host ""
