# Script kiểm tra và khởi động lại server
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  KIỂM TRA VÀ KHỞI ĐỘNG SERVER" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Kiểm tra thư mục hiện tại
$currentDir = Get-Location
Write-Host "Thư mục hiện tại: $currentDir" -ForegroundColor Yellow

# Kiểm tra các file cần thiết
Write-Host "`nĐang kiểm tra các file..." -ForegroundColor Yellow
$files = @("device-emulator.html", "index.html", "style.css", "script.js")
foreach ($file in $files) {
    if (Test-Path $file) {
        Write-Host "  ✓ $file - Tồn tại" -ForegroundColor Green
    } else {
        Write-Host "  ✗ $file - KHÔNG TỒN TẠI" -ForegroundColor Red
    }
}

# Dừng tất cả server Python cũ
Write-Host "`nĐang dừng các server cũ..." -ForegroundColor Yellow
Get-Process python -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2

# Kiểm tra port 8000
$portCheck = netstat -ano | findstr ":8000" | findstr "LISTENING"
if ($portCheck) {
    Write-Host "  ⚠ Port 8000 vẫn đang được sử dụng" -ForegroundColor Yellow
    $portCheck | ForEach-Object {
        $pid = ($_ -split '\s+')[-1]
        if ($pid -and $pid -ne "0") {
            Stop-Process -Id $pid -Force -ErrorAction SilentlyContinue
            Write-Host "  ✓ Đã dừng process $pid" -ForegroundColor Green
        }
    }
    Start-Sleep -Seconds 2
}

# Khởi động server mới
Write-Host "`nĐang khởi động HTTP Server trên port 8000..." -ForegroundColor Cyan
$serverProcess = Start-Process python -ArgumentList "-m", "http.server", "8000" -PassThru -WindowStyle Hidden

Start-Sleep -Seconds 3

# Kiểm tra server đã chạy chưa
$serverCheck = netstat -ano | findstr ":8000" | findstr "LISTENING"
if ($serverCheck) {
    Write-Host "  ✓ Server đã khởi động thành công!" -ForegroundColor Green
    Write-Host "  Process ID: $($serverProcess.Id)" -ForegroundColor Gray
} else {
    Write-Host "  ✗ Server không khởi động được!" -ForegroundColor Red
    exit 1
}

# Mở trình duyệt
Write-Host "`nĐang mở trình duyệt..." -ForegroundColor Cyan
Start-Process "http://localhost:8000/device-emulator.html"

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  HOÀN TẤT!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "URL: http://localhost:8000/device-emulator.html" -ForegroundColor Yellow
Write-Host ""
Write-Host "Để dừng server, nhấn Ctrl+C hoặc chạy:" -ForegroundColor Gray
Write-Host "  Stop-Process -Id $($serverProcess.Id) -Force" -ForegroundColor Gray
Write-Host ""
