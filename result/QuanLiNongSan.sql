
CREATE DATABASE QuanLySanPhamNN
go

-- Sử dụng cơ sở dữ liệu vừa tạo
USE QuanLySanPhamNN;
-- Tạo bảng Nhà Cung Cấp
CREATE TABLE NhaCungCap (
    MaNCC INT PRIMARY KEY,
    TenNCC NVARCHAR(255) NOT NULL,
    DiaChi NVARCHAR(255) NOT NULL,
    SDT VARCHAR(15) NOT NULL,
    email VARCHAR(50)
);

INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, SDT, email)
VALUES
    (1, N'Nhà cung cấp A', N'Địa chỉ A', '0987654321', 'nhacungcapA@example.com'),
    (2, N'Nhà cung cấp B', N'Địa chỉ B', '0909090909', 'nhacungcapB@example.com'),
    (3, N'Nhà cung cấp C', N'Địa chỉ C', '0123456789', 'nhacungcapC@example.com'),
    (4, N'Nhà cung cấp D', N'Địa chỉ D', '0977777777', 'nhacungcapD@example.com'),
    (5, N'Nhà cung cấp E', N'Địa chỉ E', '0988888888', 'nhacungcapE@example.com'),
    (6, N'Nhà cung cấp F', N'Địa chỉ F', '0900000000', 'nhacungcapF@example.com'),
    (7, N'Nhà cung cấp G', N'Địa chỉ G', '0966666666', 'nhacungcapG@example.com'),
    (8, N'Nhà cung cấp H', N'Địa chỉ H', '0955555555', 'nhacungcapH@example.com'),
    (9, N'Nhà cung cấp I', N'Địa chỉ I', '0911111111', 'nhacungcapI@example.com'),
    (10, N'Nhà cung cấp J', N'Địa chỉ J', '0944444444', 'nhacungcapJ@example.com');

-- Tạo bảng Kho
CREATE TABLE Kho (
    MaKho INT PRIMARY KEY,
    TenKho NVARCHAR(255) NOT NULL,
    DiaChi NVARCHAR(255) NOT NULL
);

INSERT INTO Kho (MaKho, TenKho, DiaChi)
VALUES
    (1, N'Kho A', N'Địa chỉ Kho A'),
    (2, N'Kho B', N'Địa chỉ Kho B'),
    (3, N'Kho C', N'Địa chỉ Kho C'),
    (4, N'Kho D', N'Địa chỉ Kho D'),
    (5, N'Kho E', N'Địa chỉ Kho E'),
    (6, N'Kho F', N'Địa chỉ Kho F'),
    (7, N'Kho G', N'Địa chỉ Kho G'),
    (8, N'Kho H', N'Địa chỉ Kho H'),
    (9, N'Kho I', N'Địa chỉ Kho I'),
    (10, N'Kho J', N'Địa chỉ Kho J');

-- Tạo bảng Khách hàng
CREATE TABLE KhachHang (
    MaKH INT PRIMARY KEY,
    tenKH NVARCHAR(255) NOT NULL,
    DiaChi NVARCHAR(255) NOT NULL,
    SDT NVARCHAR(15) NOT NULL
);

INSERT INTO KhachHang (MaKH, tenKH, DiaChi, SDT)
VALUES
    (1, N'Khách hàng A', N'Địa chỉ A', '0981234567'),
    (2, N'Khách hàng B', N'Địa chỉ B', '0909876543'),
    (3, N'Khách hàng C', N'Địa chỉ C', '0123456789'),
    (4, N'Khách hàng D', N'Địa chỉ D', '0955555555'),
    (5, N'Khách hàng E', N'Địa chỉ E', '0911111111'),
    (6, N'Khách hàng F', N'Địa chỉ F', '0966666666'),
    (7, N'Khách hàng G', N'Địa chỉ G', '0977777777'),
    (8, N'Khách hàng H', N'Địa chỉ H', '0944444444'),
    (9, N'Khách hàng I', N'Địa chỉ I', '0988888888'),
    (10, N'Khách hàng J', N'Địa chỉ J', '0900000000');

-- Tạo bảng Nhân viên
CREATE TABLE NhanVien (
    MaNV INT PRIMARY KEY,
    TenNV NVARCHAR(30) NOT NULL,
    SDT NVARCHAR(15) NOT NULL
);

INSERT INTO NhanVien (MaNV, TenNV, SDT)
VALUES
    (1, N'Nhân viên A', '0981111111'),
    (2, N'Nhân viên B', '0909222222'),
    (3, N'Nhân viên C', '0123333333'),
    (4, N'Nhân viên D', '0966666666'),
    (5, N'Nhân viên E', '0955555555'),
    (6, N'Nhân viên F', '0911111111'),
    (7, N'Nhân viên G', '0977777777'),
    (8, N'Nhân viên H', '0944444444'),
    (9, N'Nhân viên I', '0900000000'),
    (10, N'Nhân viên J', '0988888888');
   
-- Tạo bảng Sản Phẩm
CREATE TABLE SanPham (
    MaSP INT PRIMARY KEY,
    MaNCC INT NOT NULL,
    TenSP NVARCHAR(255) NOT NULL,
    DonViTinh NVARCHAR(50),
    HinhDaiDien NVARCHAR(255),
    DonGia FLOAT NOT NULL,
    QuiCachDongGoi NVARCHAR(100),
    HinhThucBaoQuan NVARCHAR(100),
    CONSTRAINT fk_sp_ncc FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC)
);

INSERT INTO SanPham (MaSP, MaNCC, TenSP, DonViTinh, HinhDaiDien, DonGia, QuiCachDongGoi, HinhThucBaoQuan)
VALUES
    (1, 1, N'Sản phẩm A', N'Cái', 'hinh_a.jpg', 100000, N'Qui cách A', N'Bảo quan A'),
    (2, 2, N'Sản phẩm B', N'Chai', 'hinh_b.jpg', 50000, N'Qui cách B', N'Bảo quan B'),
    (3, 3, N'Sản phẩm C', N'Hộp', 'hinh_c.jpg', 80000, N'Qui cách C', N'Bảo quan C'),
    (4, 4, N'Sản phẩm D', N'Thùng', 'hinh_d.jpg', 150000, N'Qui cách D', N'Bảo quan D'),
    (5, 5, N'Sản phẩm E', N'Lon', 'hinh_e.jpg', 75000, N'Qui cách E', N'Bảo quan E'),
    (6, 6, N'Sản phẩm F', N'Gói', 'hinh_f.jpg', 90000, N'Qui cách F', N'Bảo quan F'),
    (7, 7, N'Sản phẩm G', N'Thùng', 'hinh_g.jpg', 200000, N'Qui cách G', N'Bảo quan G'),
    (8, 8, N'Sản phẩm H', N'Chai', 'hinh_h.jpg', 35000, N'Qui cách H', N'Bảo quan H'),
    (9, 9, N'Sản phẩm I', N'Cái', 'hinh_i.jpg', 60000, N'Qui cách I', N'Bảo quan I'),
    (10, 10, N'Sản phẩm J', N'Lon', 'hinh_j.jpg', 85000, N'Qui cách J', N'Bảo quan J');
    
-- Tạo bảng Đơn nhập hàng
CREATE TABLE DonNhapHang (
    maDNH INT PRIMARY KEY,
    NgayLap DATE NOT NULL,
    MaNV INT NOT NULL,
    MaNCC INT NOT NULL,
    MaKho INT NOT NULL,
    CONSTRAINT fk_nh_ncc FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC),
    CONSTRAINT fk_nh_nv FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
    CONSTRAINT fk_nh_kho FOREIGN KEY (MaKho) REFERENCES Kho(MaKho)
);

INSERT INTO DonNhapHang (maDNH, NgayLap, MaNV, MaNCC, MaKho)
VALUES
    (1, '2023-08-01', 1, 1, 1),
    (2, '2023-08-02', 2, 2, 2),
    (3, '2023-08-03', 3, 3, 3),
    (4, '2023-08-04', 4, 4, 4),
    (5, '2023-08-05', 5, 5, 5),
    (6, '2023-08-06', 6, 6, 6),
    (7, '2023-08-07', 7, 7, 7),
    (8, '2023-08-08', 8, 8, 8),
    (9, '2023-08-09', 9, 9, 9),
    (10, '2023-08-10', 10, 10, 10);

-- Tạo bảng Đơn xuất hàng
CREATE TABLE DonXuatHang (
    maDXH INT PRIMARY KEY,
    NgayLap DATE NOT NULL,
    NgayDuKien DATE NOT NULL,
    MaNV INT NOT NULL,
    MaKH INT NOT NULL,
    CONSTRAINT fk_xh_nv FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
    CONSTRAINT fk_xh_kh FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);

INSERT INTO DonXuatHang (maDXH, NgayLap, NgayDuKien, MaNV, MaKH)
VALUES
    (1, '2023-08-01', '2023-08-05', 1, 1),
    (2, '2023-08-02', '2023-08-06', 2, 2),
    (3, '2023-08-03', '2023-08-07', 3, 3),
    (4, '2023-08-04', '2023-08-08', 4, 4),
    (5, '2023-08-05', '2023-08-09', 5, 5),
    (6, '2023-08-06', '2023-08-10', 6, 6),
    (7, '2023-08-07', '2023-08-11', 7, 7),
    (8, '2023-08-08', '2023-08-12', 8, 8),
    (9, '2023-08-09', '2023-08-13', 9, 9),
    (10, '2023-08-10', '2023-08-14', 10, 10);

-- Tạo bảng Nhập hàng chi tiết
CREATE TABLE NhapHangChiTiet (
    maDNH INT NOT NULL,
    maSP INT NOT NULL,
    SoLuongNhap INT NOT NULL,
    CONSTRAINT pk_nhct PRIMARY KEY (maDNH, maSP),
    CONSTRAINT fk_nhct_nh FOREIGN KEY (maDNH) REFERENCES DonNhapHang(maDNH),
    CONSTRAINT fk_nhct_sp FOREIGN KEY (maSP) REFERENCES SanPham(MaSP)
);

INSERT INTO NhapHangChiTiet (maDNH, maSP, SoLuongNhap)
VALUES
    (1, 1, 100),
    (1, 2, 50),
    (2, 3, 80),
    (2, 4, 120),
    (3, 5, 70),
    (4, 6, 90),
    (4, 7, 110),
    (5, 8, 60),
    (5, 9, 70),
    (6, 10, 40);

-- Tạo bảng Sản phẩm tồn kho
CREATE TABLE SanPhamTonKho (
    maSPtonKho INT PRIMARY KEY,
    MaKho INT NOT NULL,
    MaSP INT NOT NULL,
    SoLuongTonKho INT NOT NULL,
    CONSTRAINT fk_tk_kho FOREIGN KEY (MaKho) REFERENCES Kho(MaKho),
    CONSTRAINT fk_tk_sp FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);

INSERT INTO SanPhamTonKho (maSPtonKho, MaKho, MaSP, SoLuongTonKho)
VALUES
    (1, 1, 1, 70),
    (2, 2, 2, 90),
    (3, 3, 3, 60),
    (4, 4, 4, 110),
    (5, 5, 5, 80),
    (6, 6, 6, 100),
    (7, 7, 7, 120),
    (8, 8, 8, 50),
    (9, 9, 9, 70),
    (10, 10, 10, 40);

-- Tạo bảng Xuất hàng chi tiết
CREATE TABLE XuatHangChiTiet (
    maXHCT INT PRIMARY KEY,
    SoLuongSp INT NOT NULL,
    maDXH INT NOT NULL,
    maSPtonKho INT NOT NULL,
    CONSTRAINT fk_xhct_dxh FOREIGN KEY (maDXH) REFERENCES DonXuatHang(maDXH),
    CONSTRAINT fk_xhct_sptk FOREIGN KEY (maSPtonKho) REFERENCES SanPhamTonKho(maSPtonKho)
);

INSERT INTO XuatHangChiTiet (maXHCT, SoLuongSp, maDXH, maSPtonKho)
VALUES
    (1, 30, 1, 1),
    (2, 40, 2, 2),
    (3, 50, 3, 3),
    (4, 60, 4, 4),
    (5, 70, 5, 5),
    (6, 25, 6, 6),
    (7, 35, 7, 7),
    (8, 45, 8, 8),
    (9, 55, 9, 9),
    (10, 65, 10, 10);
