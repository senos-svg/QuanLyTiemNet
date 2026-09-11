create database QuanLyTiemNet;
USE QuanLyTiemNet;
CREATE TABLE Phong (
    MaPhong INT PRIMARY KEY IDENTITY(1,1),
    TenPhong NVARCHAR(100) NOT NULL,
    SoLuongMay INT NOT NULL
);
CREATE TABLE CauHinhMay (
    MaCauHinh INT PRIMARY KEY IDENTITY(1,1),
    ManHinh NVARCHAR(50),
    CPU NVARCHAR(50),
    RAM NVARCHAR(50),
    O_Cung NVARCHAR(50)
);

CREATE TABLE MayTinh (
    MaMay INT PRIMARY KEY IDENTITY(1,1),
    MaPhong INT NOT NULL,
    MaCauHinh INT NOT NULL,
    TrangThai NVARCHAR(50) NOT NULL CHECK (TrangThai IN ('Dang Hoat Dong', 'Dang Bao Tri', 'Dang Hu Hong')),
    FOREIGN KEY (MaPhong) REFERENCES Phong(MaPhong),
    FOREIGN KEY (MaCauHinh) REFERENCES CauHinhMay(MaCauHinh)
);

CREATE TABLE NguoiChoi (
    MaNguoiChoi INT PRIMARY KEY IDENTITY(1,1),
    HoTen NVARCHAR(100) NOT NULL,
    TenDangNhap NVARCHAR(50) UNIQUE NOT NULL,
    MatKhau NVARCHAR(255) NOT NULL,
    SoTien FLOAT DEFAULT 0
);
CREATE TABLE NhanVien (
    MaNhanVien INT PRIMARY KEY IDENTITY(1,1),
    HoTen NVARCHAR(100) NOT NULL,
    TenDangNhap NVARCHAR(50) UNIQUE NOT NULL,
    MatKhau NVARCHAR(255) NOT NULL,
    DiaChi NVARCHAR(255),
    SoDienThoai NVARCHAR(15)
);
CREATE TABLE QuanTri (
    MaQuanTri INT PRIMARY KEY IDENTITY(1,1),
    TenDangNhap NVARCHAR(50) UNIQUE NOT NULL,
    MatKhau NVARCHAR(255) NOT NULL
);
CREATE TABLE NapTien (
    MaGiaoDich INT PRIMARY KEY IDENTITY(1,1),
    MaNguoiChoi INT FOREIGN KEY REFERENCES NguoiChoi(MaNguoiChoi),
    SoTienNap FLOAT CHECK(SoTienNap >= 0),
    ThoiGian DATE DEFAULT GETDATE()
);

CREATE TABLE DoanhThu (
    MaDoanhThu INT PRIMARY KEY IDENTITY(1,1),
    Ngay DATE NOT NULL  UNIQUE,
    TongTien FLOAT DEFAULT 0
);

CREATE TABLE BaoCaoViPham (
    MaBaoCao INT PRIMARY KEY IDENTITY(1,1),
    MaNguoiChoi INT FOREIGN KEY REFERENCES NguoiChoi(MaNguoiChoi),
    HanhViViPham NVARCHAR(255),
    NgayBaoCao DATE DEFAULT GETDATE()
);
CREATE TABLE TinhTrangMay (
    MaCapNhat INT PRIMARY KEY IDENTITY(1,1),
    MaMay INT NOT NULL,
    MaNhanVien INT NOT NULL,
    TrangThai NVARCHAR(50),
    TrangThaiMoi NVARCHAR(50) NOT NULL CHECK (TrangThaiMoi IN ('Dang Hoat Dong', 'Dang Bao Tri', 'Dang Hu Hong')),
    NgayCapNhat DATE DEFAULT GETDATE(),
    FOREIGN KEY (MaMay) REFERENCES MayTinh(MaMay),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
);
-- Trigger cập nhật doanh thu khi nạp tiền
CREATE TRIGGER trg_UpdateDoanhThu
ON NapTien
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    MERGE INTO DoanhThu AS target
    USING (
        SELECT ThoiGian AS Ngay, SUM(SoTienNap) AS TongTien
        FROM inserted
        GROUP BY ThoiGian
    ) AS source
    ON target.Ngay = source.Ngay
    WHEN MATCHED THEN 
        UPDATE SET target.TongTien = target.TongTien + source.TongTien
    WHEN NOT MATCHED THEN 
        INSERT (Ngay, TongTien) VALUES (source.Ngay, source.TongTien);
END;



INSERT INTO May_Tinh (MaPhong, MaCauHinh, TrangThai)
VALUES
-- Mã phòng 1 (10 máy)
(1, 1, N'Dang Bao Tri'),
(1, 1, N'Dang Hoat Dong'),
(1, 1, N'Dang Hoat Dong'),
(1, 1, N'Dang Hoat Dong'),
(1, 1, N'Dang hu hong'),
(1, 1, N'Dang hu hong'),
(1, 1, N'Dang hu hong'),
(1, 1, N'Dang Hoat Dong'),
(1, 1, N'Dang Hoat Dong'),
(1, 1, N'Dang Hoat Dong'),

-- Mã phòng 2 (20 máy)
(2, 2, N'Dang Hoat Dong'),
(2, 2, N'Dang Hoat Dong'),
(2, 2, N'Dang Hoat Dong'),
(2, 2, N'Dang Hoat Dong'),
(2, 2, N'Dang Hoat Dong'),
(2, 2, N'Dang Hoat Dong'),
(2, 2, N'Dang Hoat Dong'),
(2, 2, N'Dang Hoat Dong'),
(2, 2, N'Dang Hoat Dong'),
(2, 2, N'Dang Hoat Dong'),
(2, 2, N'Dang Hoat Dong'),
(2, 2, N'Dang Hoat Dong'),
(2, 2, N'Dang Hoat Dong'),
(2, 2, N'Dang Hoat Dong'),
(2, 2, N'Dang Hoat Dong'),
(2, 2, N'Dang Hoat Dong'),
(2, 2, N'Dang Hoat Dong'),
(2, 2, N'Dang Hoat Dong'),
(2, 2, N'Dang Hoat Dong'),
(2, 2, N'Dang Hoat Dong'),

-- Mã phòng 3 (15 máy)
(3, 3, N'Dang Hoat Dong'),
(3, 3, N'Dang Hoat Dong'),
(3, 3, N'Dang Hoat Dong'),
(3, 3, N'Dang Hoat Dong'),
(3, 3, N'Dang Hoat Dong'),
(3, 3, N'Dang Hoat Dong'),
(3, 3, N'Dang Hoat Dong'),
(3, 3, N'Dang Hoat Dong'),
(3, 3, N'Dang Hoat Dong'),
(3, 3, N'Dang Hoat Dong'),
(3, 3, N'Dang Hoat Dong'),
(3, 3, N'Dang Hoat Dong'),
(3, 3, N'Dang Hoat Dong'),
(3, 3, N'Dang Hoat Dong'),
(3, 3, N'Dang Hoat Dong'),

-- Mã phòng 4 (15 máy)
(4, 4, N'Dang Hoat Dong'),
(4, 4, N'Dang Hoat Dong'),
(4, 4, N'Dang Hoat Dong'),
(4, 4, N'Dang Hoat Dong'),
(4, 4, N'Dang Hoat Dong'),
(4, 4, N'Dang Hoat Dong'),
(4, 4, N'Dang Hoat Dong'),
(4, 4, N'Dang Hoat Dong'),
(4, 4, N'Dang Hoat Dong'),
(4, 4, N'Dang Hoat Dong'),
(4, 4, N'Dang Hoat Dong'),
(4, 4, N'Dang Hoat Dong'),
(4, 4, N'Dang Hoat Dong'),
(4, 4, N'Dang Hoat Dong'),
(4, 4, N'Dang Hoat Dong');

INSERT INTO NguoiChoi(HoTen, TenDangNhap, MatKhau, SoTien) 
VALUES 
('le thanh phát', 'phatle', '$2a$12$gBs0p4V.ZWzYfheoYSXnHu5Ixsd0gN3ekUjgjRbpQKpQhLaMTY02e', 45004),--phat123
('nguyen van a', 'hoclamchi', '$2a$12$3f.pq9OM76M4.wD17rwQ2.A9Yiuil0g9vNH7kz0a2YZ', 11000),-- nghihoc
('thế văn an', 'andeptrai', '$2a$12$ywQymAYOjtfmfc8IRc2BrehvY4YCOFl2G0WJludUNRKoDCzcRirhK', 0);--nhonggiu

INSERT INTO Phong (TenPhong, SoLuongMay)
VALUES
( N'Phòng 1', 10),
( N'Phòng 2', 20),
( N'Phòng Đôi', 15),
(N'Phòng VIP', 15);

INSERT INTO QuanTri ( TenDangNhap, MatKhau)
VALUES
('admin', '$2a$12$IqB3xoDNonPszMkY2Aa6H0XtczrHGBmouvC52lLXoB1NcaA9oyAhy'); -- admin12
INSERT INTO NhanVien ( HoTen, TenDangNhap, MatKhau, DiaChi, SoDienThoai)
VALUES
( N'lê thanh phon', 'heocon', '$2a$12$RwRNE.bQy67nUQrbNmxdcJUszidCRELjb9XTr7l2czPflRaX4Di', N'cần thơ', '0123456789'), -- phongle
( N'nguyen van tien', 'thanhnhi', '$2a$12$Tof/cgjhkfv.Tgt5neG/BOOjaF4K97j2brsxJYBI1NFKjeU4AcaQG', N'vinh long', '0978456123'),--nhinhi
( N'thanh truc', 'truc', '$2a$12$37wr8vNeCm2qitPXnc87IO/MU7lrqkufvAxoU6QZmQybqwNqNFd7y', N'đồng tháp', '0147258369');--truc123


