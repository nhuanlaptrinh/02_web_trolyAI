// File cấu hình n8n Webhook để gửi thông báo Zalo Bot
// Cần cấu hình sau khi import workflow vào n8n

const N8N_CONFIG = {
    // Webhook URL từ n8n workflow "01RegistrationNotification"
    // Lấy từ: n8n → Workflow → Node "Webhook - Nhận Đăng Ký" → Production URL
    WEBHOOK_URL: 'https://vpsn8n.anhlaptrinh.vn/webhook/registration-notification11111mmmmm11',
    
    // Bật/tắt thông báo Zalo (true = bật, false = tắt)
    ZALO_NOTIFICATION_ENABLED: true,
    
    // Timeout cho request (milliseconds)
    TIMEOUT: 10000,
    
    // Thử lại nếu thất bại
    RETRY_ON_FAILURE: true,
    MAX_RETRIES: 2
};

// Export để sử dụng trong script.js
if (typeof module !== 'undefined' && module.exports) {
    module.exports = N8N_CONFIG;
}

// Hướng dẫn:
// 1. Import workflow "01RegistrationNotification.json" vào n8n
// 2. Activate workflow
// 3. Copy Production URL từ node "Webhook - Nhận Đăng Ký"
// 4. Paste vào WEBHOOK_URL ở trên
// 5. Lưu file và test

