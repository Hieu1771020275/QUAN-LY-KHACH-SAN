-- Tạo database
CREATE DATABASE QLKHACHSAN;
USE QLKHACHSAN;
-- Bảng KHACHHANG
CREATE TABLE KHACHHANG (
    MaKhachHang INT PRIMARY KEY IDENTITY(1,1),
    TenKhachHang VARCHAR(100),
    SoDienThoai VARCHAR(15),
    DiaChi VARCHAR(255)
);
-- Bảng PHONG
CREATE TABLE PHONG (
    MaPhong INT PRIMARY KEY IDENTITY(1,1),
    LoaiPhong VARCHAR(50),
    TrangThai VARCHAR(20),
    GiaPhong DECIMAL(10,2)
);
-- Bảng DATPHONG
CREATE TABLE DATPHONG (
    MaDatPhong INT PRIMARY KEY IDENTITY(1,1),
    MaKhachHang INT
,
    MaPhong INT,
    NgayNhanPhong DATE,
    NgayTraPhong DATE,
    FOREIGN KEY (MaKhachHang) REFERENCES KHACHHANG(MaKhachHang),
    FOREIGN KEY (MaPhong) REFERENCES PHONG(MaPhong)
);
-- Bảng DICHVU
CREATE TABLE DICHVU (
    MaDichVu INT PRIMARY KEY IDENTITY(1,1),
    TenDichVu VARCHAR(100),
    MoTa TEXT,
    DonGia DECIMAL(10,2)
);
-- Bảng HOADON
CREATE TABLE HOADON (
    MaHoaDon INT PRIMARY KEY IDENTITY(1,1),
    MaKhachHang INT,
    TongTien DECIMAL(15,2),
    NgayThanhToan DATE,
    FOREIGN KEY (MaKhachHang) REFERENCES KHACHHANG(MaKhachHang)
);
-- Bảng CHITIETDATPHONG
CREATE TABLE CHITIETDATPHONG (
    MaChiTietDatPhong INT PRIMARY KEY IDENTITY(1,1),
    MaDatPhong INT,
    MaDichVu INT,
    SoLuong INT,
    ThanhTien DECIMAL(10,2),
    FOREIGN KEY (MaDatPhong) REFERENCES DATPHONG(MaDatPhong),
    FOREIGN KEY (MaDichVu) REFERENCES DICHVU(MaDichVu)
);
-- Bảng CHITIETHOADON
CREATE TABLE CHITIETHOADON (
    MaChiTietHoaDon INT PRIMARY KEY IDENTITY(1,1),
    MaHoaDon INT,
    MaDatPhong INT,
    MaDichVu INT,
    SoLuong INT,
    ThanhTien DECIMAL(10,2),
    FOREIGN KEY (MaHoaDon) REFERENCES HOADON(MaHoaDon),
    FOREIGN KEY (MaDatPhong) REFERENCES DATPHONG(MaDatPhong),
    FOREIGN KEY (MaDichVu) REFERENCES DICHVU(MaDichVu)
);
-- Thêm dữ liệu vào KHACHHANG
INSERT INTO KHACHHANG (TenKhachHang, SoDienThoai, DiaChi) VALUES
('Nguyen Van A', '0987654321', 'Hanoi'),
('Tran Thi B', '0912345678', 'HCM'),
('Le Van C', '0923456789', 'Da Nang'),
('Pham Thi D', '0934567890', 'Hue'),
('Hoang Van E', '0945678901', 'Hai Phong'),
('Vu Thi F', '0956789012', 'Can Tho'),
('Dang Van G', '0967890123', 'Nha Trang'),
('Bui Thi H', '0978901234', 'Vung Tau'),
('Do Van I', '0989012345', 'Quang Ninh'),
('Ngo Thi K', '0990123456', 'Thanh Hoa');
-- Thêm dữ liệu vào PHONG
INSERT INTO PHONG (LoaiPhong, TrangThai, GiaPhong) VALUES
('Tieu chuan', 'Trong', 500000),
('Cao cap', 'Trong', 800000),
('Thuong hang', 'Trong', 1200000),
('Tieu chuan', 'Da dat', 500000),
('Cao cap', 'Da dat', 800000),
('Thuong hang', 'Trong', 1200000),
('Tieu chuan', 'Trong', 500000),
('Cao cap', 'Trong', 800000),
('Thuong hang', 'Da dat', 1200000),
('Tieu chuan', 'Trong', 500000);
DELETE FROM PHONG;           
DBCC CHECKIDENT ('PHONG', RESEED, 0);
DELETE FROM DATPHONG;
DBCC CHECKIDENT ('DATPHONG', RESEED, 0); -- Reset ID nếu cần
DELETE FROM CHITIETDATPHONG;
DBCC CHECKIDENT ('CHITIETDATPHONG', RESEED, 0); -- Reset ID nếu cần
DELETE FROM CHITIETHOADON;
DBCC CHECKIDENT ('CHITIETHOADON', RESEED, 0);
-- Them du lieu vao DICHVU
INSERT INTO DICHVU (TenDichVu, MoTa, DonGia) VALUES
('Buffet sang', 'Buffet sang voi nhieu mon an', 150000),
('Spa', 'Dich vu spa thu gian', 300000),
('Giat ui', 'Dich vu giat ui quan ao', 50000),
('Thue xe', 'Dich vu thue xe may', 200000),
('Tour du lich', 'Dich vu tham quan du lich', 1000000),
('Massage', 'Dich vu massage toan than', 400000),
('Gym', 'Dich vu phong tap gym', 100000),
('Ho boi', 'Su dung ho boi', 50000),
('Dua don san bay', 'Dich vu dua don san bay', 250000),                
('Thue phong hop', 'Dich vu thue phong hop', 1500000);
-- Thêm dữ liệu vào DATPHONG
INSERT INTO DATPHONG (MaKhachHang, MaPhong, NgayNhanPhong, NgayTraPhong) VALUES
(4, 4, '2025-03-04', '2025-03-08'),
(5, 5, '2025-03-05', '2025-03-09'),
(6, 6, '2025-03-06', '2025-03-10'),
(7, 7, '2025-03-07', '2025-03-11'),
(8, 8, '2025-03-08', '2025-03-12'),
(9, 9, '2025-03-09', '2025-03-13'),
(10, 10, '2025-03-10', '2025-03-14'),
(1, 1, '2025-03-11', '2025-03-15'),
(2, 2, '2025-03-12', '2025-03-16'),
(3, 3, '2025-03-13', '2025-03-17');
-- Thêm dữ liệu vào HOADON
INSERT INTO HOADON (MaKhachHang, TongTien, NgayThanhToan) VALUES
(4, 1800000, '2025-03-08'),
(5, 2600000, '2025-03-09'),
(6, 3200000, '2025-03-10'),
(7, 2500000, '2025-03-11'),
(8, 3000000, '2025-03-12'),
(9, 2100000, '2025-03-13'),
(10, 2800000, '2025-03-14'),
(1, 1900000, '2025-03-15'),
(2, 2700000, '2025-03-16'),
(3, 3100000, '2025-03-17');
-- Thêm dữ liệu vào CHITIETDATPHONG
INSERT INTO CHITIETDATPHONG (MaDatPhong, MaDichVu, SoLuong, ThanhTien) VALUES
(4, 4, 1, 200000),
(5, 5, 1, 1000000),
(6, 6, 2, 800000), 
(7, 7, 1, 100000),
(8, 8, 2, 100000),
(9, 9, 1, 250000),
(10, 10, 1, 1500000),
(3, 3, 3, 150000),
(1, 1, 1, 150000),
(2, 2, 1, 300000);
-- Thêm dữ liệu vào CHITIETHOADON
INSERT INTO CHITIETHOADON (MaHoaDon, MaDatPhong, MaDichVu, SoLuong, ThanhTien) VALUES
(4, 4, 4, 1, 200000),
(5, 5, 5, 1, 1000000),
(7, 7, 7, 1, 100000),
(8, 8, 8, 2, 100000),
(9, 9, 9, 1, 250000),
(10, 10, 10, 1, 1500000),
(1, 1, 3, 3, 150000),
(2, 2, 1, 1, 150000),
(3, 3, 2, 1, 300000),
(6, 6, 6, 2, 800000);
GO
--tạo Index
CREATE INDEX IDX_KHACHHANG_SDT ON KHACHHANG(SoDienThoai);
GO
--tạo View
CREATE VIEW VIEW_DANHSACH_DATPHONG AS  
SELECT DP.MaDatPhong, KH.TenKhachHang, P.LoaiPhong, DP.NgayNhanPhong, DP.NgayTraPhong
FROM DATPHONG DP
JOIN KHACHHANG KH ON DP.MaKhachHang = KH.MaKhachHang
JOIN PHONG P ON DP.MaPhong = P.MaPhong;
GO
SELECT * FROM VIEW_DANHSACH_DATPHONG
GO
--Tạo Thủ Tục (Stored Procedures)
CREATE PROCEDURE SP_ThemKhachHang
    @TenKhachHang VARCHAR(100),
    @SoDienThoai VARCHAR(15),
    @DiaChi VARCHAR(255)
AS
BEGIN
    INSERT INTO KHACHHANG (TenKhachHang, SoDienThoai, DiaChi)
    VALUES (@TenKhachHang, @SoDienThoai, @DiaChi);
END;
GO
EXEC SP_ThemKhachHang 'Nguyen Van X', '0999999999', 'Ha Noi';
SELECT * FROM KHACHHANG
GO
-- Tạo UDF 
CREATE FUNCTION UF_TinhTongTienDatPhong (@MaKhachHang INT) RETURNS DECIMAL(15,2)
AS
BEGIN
    DECLARE @TongTien DECIMAL(15,2);
    SELECT @TongTien = SUM(TongTien) FROM HOADON WHERE MaKhachHang = @MaKhachHang;
    RETURN @TongTien;
END;
GO
SELECT dbo.UF_TinhTongTienDatPhong(4) AS TongTien;
GO
-- Tạo Trigger 
CREATE TRIGGER TRG_CapNhatTrangThaiPhong
ON DATPHONG
AFTER INSERT
AS
BEGIN
    UPDATE PHONG SET TrangThai = 'Da dat'
    WHERE MaPhong IN (SELECT MaPhong FROM inserted);
END;
GO
INSERT INTO DATPHONG (MaKhachHang, MaPhong, NgayNhanPhong, NgayTraPhong) VALUES (1, 1, '2025-03-18', '2025-03-20');
GO
--kết quả Trigger
SELECT * FROM PHONG WHERE MaPhong = 1;

GO
--Tạo người dùng và quyền truy cập
CREATE LOGIN User1 WITH PASSWORD = '123';
CREATE USER User1 FOR LOGIN User1;
GRANT SELECT, INSERT, UPDATE ON KHACHHANG TO User1;
--Thu hồi quyền
REVOKE UPDATE ON KHACHHANG FROM User1;
--Tạo Role và gán quyền
CREATE ROLE RoleNhanVien;
GRANT SELECT, INSERT ON KHACHHANG TO RoleNhanVien;
ALTER ROLE RoleNhanVien ADD MEMBER User1; 
GO
--Bảo mật cơ sở dữ liệu
--Sử dụng tài khoản người dùng và quyền hạn
---- Tạo user cho nhân viên lễ tân
CREATE LOGIN LeTan WITH PASSWORD = 'LeTan@123';
CREATE USER LeTan FOR LOGIN LeTan;
--Thu hồi quyền hạn
REVOKE SELECT ON PHONG FROM LeTan;
-- Xóa user
DROP USER LeTan;
DROP LOGIN LeTan;
-- Cấp quyền chỉ đọc dữ liệu phòng
GRANT SELECT ON PHONG TO LeTan;
-- Tạo view để ẩn thông tin 
CREATE VIEW v_KhachHang AS
SELECT MaKhachHang, TenKhachHang, DiaChi
FROM KHACHHANG;
-- Tạo LOGIN cho lễ tân
CREATE LOGIN LeTan WITH PASSWORD = 'LeTan123';
-- Tạo USER tương ứng trong database
CREATE USER LeTan FOR LOGIN LeTan;
-- Cấp quyền chỉ đọc trên view v_KhachHang
GRANT SELECT ON v_KhachHang TO LeTan;
-- Kiểm tra xem LeTan có truy vấn được view không
EXECUTE AS USER = 'LeTan';
SELECT * FROM v_KhachHang;
REVERT; -- Trở lại user admin
--Dùng SCHEMA để nhóm các bảng, view, stored procedure lại và phân quyền truy cập riêng biệt.
--Tạo SCHEMA dành cho nhân viên lễ tân
CREATE SCHEMA LeTan;
GO
-- Di chuyển bảng KHACHHANG vào SCHEMA LeTan
ALTER SCHEMA LeTan TRANSFER dbo.KHACHHANG;
GO
--Cấp quyền truy cập schema
GRANT SELECT, INSERT, UPDATE ON SCHEMA::LeTan TO LeTan;