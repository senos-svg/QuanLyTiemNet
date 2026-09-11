# 🖥️ Phần mềm Quản lý Tiệm Net (Cyber Cafe Management)

Đây là dự án phần mềm desktop hỗ trợ quản lý vận hành phòng máy (tiệm net), được phát triển bằng ngôn ngữ Java (cấu trúc Maven) và hệ quản trị cơ sở dữ liệu SQL Server[cite: 1, 2].

## 🛠 Công nghệ sử dụng
* **Ngôn ngữ:** Java (Quản lý thư viện qua `pom.xml`).
* **Giao diện:** Java Swing[cite: 1].
* **Cơ sở dữ liệu:** Microsoft SQL Server.
* **Bảo mật:** Thuật toán mã hóa mật khẩu (Bcrypt/Hashing)[cite: 1, 2].

## 📂 Cấu trúc dự án
Dự án được xây dựng theo mô hình phân lớp rõ ràng nhằm dễ dàng bảo trì và mở rộng:
* `com.mycompany.baitaplon`: Chứa class Main (`BaiTapLon.java`) và các class giao diện điều hướng (`Menu.java`, `Menu_AD.java`, `Menu_NV.java`, `Menu_PL.java`)[cite: 1].
* `model`: Định nghĩa các thực thể dữ liệu như `Admin`, `NhanVien`, `NguoiChoi`, `MayTinh`, `TinhTrangMay`, `DoanhThu`, `BaoCaoViPham`[cite: 1].
* `DAOS`: Chứa các lớp xử lý logic tương tác trực tiếp với cơ sở dữ liệu (ví dụ: `AdminDAO.java`, `NhanVienDAO.java`, `NguoiChoiDAO.java`)[cite: 1].
* `ketnoi`: Chứa class `DBConnection.java` chuyên phụ trách kết nối giữa ứng dụng Java và SQL Server[cite: 1].
* `utils`: Các công cụ hỗ trợ tiện ích như `MaHoa.java` (mã hóa dữ liệu) và `CheckDangNhap.java` (xác thực luồng đăng nhập)[cite: 1].

## 🚀 Các tính năng nổi bật
1. **Phân quyền hệ thống đa dạng:**
   * **Quản trị viên (Admin):** Quản lý toàn bộ nhân viên, tài chính và cấu hình hệ thống[cite: 1, 2].
   * **Nhân viên:** Quản lý tình trạng máy, nạp tiền cho khách và xử lý các báo cáo[cite: 1, 2].
   * **Người chơi:** Giao diện xem thông tin tài khoản, gọi dịch vụ hoặc báo cáo sự cố[cite: 1, 2].
2. **Quản lý thiết bị chặt chẽ:** 
   * Theo dõi chi tiết các phòng máy (Phòng thường, Phòng đôi, VIP).
   * Cập nhật trạng thái máy tính theo thời gian thực (Đang hoạt động, Đang bảo trì, Đang hư hỏng) kèm lịch sử cập nhật (`TinhTrangMay`).
3. **Tự động hóa doanh thu:** 
   * Cơ sở dữ liệu sử dụng Trigger (`trg_UpdateDoanhThu`) để tự động cộng dồn doanh thu ngày ngay khi có giao dịch nạp tiền thành công, đảm bảo số liệu tài chính luôn chính xác tuyệt đối[cite: 2].
4. **Bảo mật thông tin:** Toàn bộ mật khẩu của Admin, Nhân viên và Người chơi đều được mã hóa an toàn trước khi lưu xuống Database[cite: 2].

## ⚙️ Hướng dẫn cài đặt
1. **Clone dự án về máy:**
   ```bash
   git clone [https://github.com/](https://github.com/)<tên-tài-khoản-của-bạn>/<tên-repo>.git
