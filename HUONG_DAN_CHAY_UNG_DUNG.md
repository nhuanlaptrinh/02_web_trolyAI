# 📱 Hướng Dẫn Chạy Ứng Dụng Website Facebook Ads

## 🚀 Cách Chạy Nhanh Nhất (Mặc Định - Device Emulator)

### Bước 1: Mở PowerShell
- Nhấn `Windows + X` và chọn **Windows PowerShell** hoặc **Terminal**
- Hoặc tìm "PowerShell" trong Start Menu

### Bước 2: Di chuyển đến thư mục dự án
```powershell
cd "D:\98. Cursor\01. Web_Ban_Hang\01facebookads"
```

### Bước 3: Chạy script tự động
```powershell
.\start-emulator.ps1
```

**Xong!** 🎉 Trình duyệt sẽ tự động mở với **Device Emulator** - giao diện mô phỏng nhiều thiết bị.

---

## 📖 Hướng Dẫn Chi Tiết

### ✨ Device Emulator là gì?

Device Emulator là công cụ cho phép bạn xem website trên nhiều thiết bị khác nhau (Desktop, iPhone, Samsung) ngay trong trình duyệt, không cần thiết bị thật.

### 🎯 Tính Năng Chính

1. **Xem trên nhiều thiết bị:**
   - 🖥️ Desktop (màn hình lớn)
   - 🍎 iPhone 14 Pro Max
   - 🍎 iPhone 12 Pro
   - 🍎 iPhone SE
   - 🤖 Samsung Galaxy Note
   - 🤖 Samsung Galaxy S21

2. **Chuyển đổi dễ dàng:** Click vào nút thiết bị để chuyển đổi ngay lập tức

3. **Các nút điều khiển:**
   - 🔄 **Làm Mới**: Tải lại trang web
   - 🔗 **Mở Trong Tab Mới**: Mở website trong tab riêng
   - ⛶ **Toàn Màn Hình**: Xem ở chế độ fullscreen

### ⌨️ Phím Tắt

- `Ctrl + R`: Làm mới trang
- `F11`: Bật/tắt chế độ toàn màn hình

---

## 🔧 Các Cách Chạy Khác

### Cách 1: Chạy Thủ Công (Nếu script không hoạt động)

**Bước 1:** Khởi động HTTP Server
```powershell
python -m http.server 8000
```

**Bước 2:** Mở trình duyệt và truy cập:
```
http://localhost:8000/device-emulator.html
```

### Cách 2: Mở Trực Tiếp File HTML

Nếu bạn chỉ muốn xem nhanh (không có server):
- Double-click vào `device-emulator.html`
- ⚠️ **Lưu ý:** Một số tính năng có thể không hoạt động đầy đủ khi mở trực tiếp

### Cách 3: Chạy Không Dùng Emulator

Nếu bạn muốn xem website trực tiếp:

**Desktop:**
```
http://localhost:8000/index.html
```

**Mobile:**
```
http://localhost:8000/index.html?mobile=1
```

---

## 🛠️ Yêu Cầu Hệ Thống

### Bắt Buộc:
- ✅ **Python 3.x** (đã cài đặt)
- ✅ **PowerShell** (có sẵn trên Windows 10/11)
- ✅ **Trình duyệt web** (Chrome, Edge, Firefox...)

### Kiểm Tra Python:
```powershell
python --version
```

Nếu chưa có Python, tải tại: https://www.python.org/

---

## ❓ Xử Lý Sự Cố (Troubleshooting)

### ❌ Lỗi: "Python không được tìm thấy"
**Giải pháp:**
1. Cài đặt Python từ https://www.python.org/
2. Khi cài, nhớ tick vào "Add Python to PATH"
3. Khởi động lại PowerShell và thử lại

### ❌ Lỗi: "Port 8000 đang được sử dụng"
**Giải pháp:**
```powershell
# Tìm và dừng process đang dùng port 8000
netstat -ano | findstr :8000
# Sau đó dừng process (thay PID bằng số bạn tìm được)
taskkill /PID <PID> /F
```

Hoặc đơn giản hơn: **Khởi động lại máy tính**

### ❌ Lỗi: "Script không chạy được"
**Giải pháp:**
```powershell
# Cho phép chạy script PowerShell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### ❌ Trình duyệt không tự động mở
**Giải pháp:**
1. Mở trình duyệt thủ công
2. Truy cập: `http://localhost:8000/device-emulator.html`

### ❌ Website không hiển thị trong iframe
**Giải pháp:**
1. Kiểm tra xem server đã chạy chưa (xem terminal)
2. Thử làm mới trang (Ctrl+R)
3. Kiểm tra console trình duyệt (F12) để xem lỗi

---

## 🛑 Dừng Server

Khi bạn muốn dừng server:

1. Quay lại cửa sổ PowerShell/Terminal đang chạy server
2. Nhấn `Ctrl + C`
3. Xác nhận nếu có hỏi

---

## 📁 Cấu Trúc File

```
01facebookads/
├── device-emulator.html    ← File emulator chính (MẶC ĐỊNH)
├── index.html              ← Trang web chính
├── thanhtoan.html          ← Trang thanh toán
├── start-emulator.ps1      ← Script khởi động (KHUYẾN NGHỊ)
├── script.js               ← JavaScript
├── style.css               ← CSS
└── HUONG_DAN_CHAY_UNG_DUNG.md ← File này
```

---

## 🎓 Hướng Dẫn Sử Dụng Device Emulator

### 1. Chọn Thiết Bị
- Click vào nút thiết bị ở thanh trên cùng
- Giao diện sẽ tự động chuyển đổi
- Khung thiết bị sẽ thay đổi theo thiết bị bạn chọn

### 2. Xem Website
- Website sẽ hiển thị trong khung thiết bị
- Scroll để xem toàn bộ nội dung
- Click vào các link trong website vẫn hoạt động bình thường

### 3. Điều Khiển
- **Làm Mới**: Tải lại website (hữu ích khi bạn chỉnh sửa code)
- **Mở Trong Tab Mới**: Mở website trong tab riêng để test thực tế
- **Toàn Màn Hình**: Xem ở chế độ fullscreen để có trải nghiệm tốt nhất

---

## 💡 Mẹo Sử Dụng

1. **Làm việc hiệu quả:**
   - Giữ terminal chạy server ở một cửa sổ
   - Mở emulator ở cửa sổ khác
   - Khi chỉnh sửa code, chỉ cần làm mới (Ctrl+R) là thấy thay đổi

2. **Test trên nhiều thiết bị:**
   - Chuyển đổi giữa các thiết bị để kiểm tra responsive
   - Đặc biệt chú ý iPhone SE (màn hình nhỏ nhất) và Desktop (màn hình lớn nhất)

3. **Debug:**
   - Nếu có lỗi, mở DevTools (F12) trong iframe
   - Hoặc mở website trong tab mới để debug dễ hơn

---

## 📞 Hỗ Trợ

Nếu gặp vấn đề không giải quyết được:

1. Kiểm tra lại các bước trong phần "Xử Lý Sự Cố"
2. Đảm bảo Python đã được cài đặt đúng
3. Thử khởi động lại máy tính
4. Kiểm tra firewall không chặn port 8000

---

## ✅ Checklist Trước Khi Chạy

Trước khi chạy ứng dụng, đảm bảo:

- [ ] Python đã được cài đặt (`python --version`)
- [ ] Đang ở đúng thư mục dự án
- [ ] Port 8000 không bị chiếm dụng
- [ ] PowerShell có quyền chạy script

---

## 🎯 Tóm Tắt Nhanh

**Cách chạy nhanh nhất:**
```powershell
cd "D:\98. Cursor\01. Web_Ban_Hang\01facebookads"
.\start-emulator.ps1
```

**URL mặc định:**
```
http://localhost:8000/device-emulator.html
```

**Dừng server:**
```
Nhấn Ctrl+C trong terminal
```

---

**Chúc bạn làm việc hiệu quả! 🚀**

*Lần cập nhật: 2024*

