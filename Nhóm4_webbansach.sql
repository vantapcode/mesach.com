use QuanLySachMemee;

/* 1. THỂ LOẠI */
create table TheLoai (
    MaTL char(10) primary key,
    TenTL nvarchar(100) not null
);

/* 2. TRẠNG THÁI */
create table TrangThai (
    MaTT char(10) primary key,
    TenTrangThai nvarchar(100) not null
);

/* 3. NHÀ XUẤT BẢN */
create table NhaXuatBan (
    MaNXB char(10) primary key,
    TenNXB nvarchar(200) not null,
    DiaChi nvarchar(255),
    SDT nvarchar(20)
);

/* 4. TÁC GIẢ */
create table TacGia (
    MaTacGia char(10) primary key,
    TenTacGia nvarchar(200) not null,
    NamSinh int,
    NamMat int,
    QuocGia nvarchar(100),
    MoTa nvarchar(1000)
);

/* 5. SÁCH */
create table Sach (
    MaSach char(10) primary key,
    TenSach nvarchar(200) not null,
    NgayXuatBan date,
    MoTa nvarchar(1000),
    SoTrang int,
    KhoSach nvarchar(50),
    ChatLuongGiay nvarchar(50),
    SoLuong int,
    GiaBan decimal(18,2) not null,
    MaTT char(10),
    MaNXB char(10),
    MaTacGia char(10),
    MaTL char(10),

    foreign key (MaTT) references TrangThai(MaTT),
    foreign key (MaNXB) references NhaXuatBan(MaNXB),
    foreign key (MaTacGia) references TacGia(MaTacGia),
    foreign key (MaTL) references TheLoai(MaTL)
);

/* 6. KHÁCH HÀNG */
create table KhachHang (
    MaKH char(10) primary key,
    TenKH nvarchar(200),
    NgaySinh date,
    SDT nvarchar(20),
    Email nvarchar(100),
    DiaChi nvarchar(255),
    TenDangNhap nvarchar(100)
);

/* 7. NHÂN VIÊN */
create table NhanVien (
    MaNV char(10) primary key,
    TenNV nvarchar(200),
    SDT nvarchar(20),
    NgaySinh date,
    DiaChi nvarchar(255),
    Email nvarchar(100),
    MoTa nvarchar(1000),
    TenDangNhap nvarchar(100)
);

/* 8. TÀI KHOẢN */
create table TaiKhoan (
    TenDangNhap nvarchar(100) primary key,
    MatKhau nvarchar(100),
    QuyenHan nvarchar(50)
);

/* 9. GIỎ HÀNG */
create table GioHang (
    MaGH char(10) primary key,
    MaKH char(10),
    TongTien decimal(18,2),

    foreign key (MaKH) references KhachHang(MaKH)
);

/* 10. CHI TIẾT GIỎ HÀNG */
create table ChiTietGioHang (
    MaGH char(10),
    MaSach char(10),
    SoLuong int,

    primary key (MaGH, MaSach),
    foreign key (MaGH) references GioHang(MaGH),
    foreign key (MaSach) references Sach(MaSach)
);

/* 11. PHIẾU NHẬP */
create table PhieuNhap (
    MaPN char(10) primary key,
    NgayNhap date,
    MaNV char(10),
    TongTien decimal(18,2),
    MoTa nvarchar(1000),

    foreign key (MaNV) references NhanVien(MaNV)
);

/* 12. CHI TIẾT NHẬP */
create table ChiTietNhap (
    MaPN char(10),
    MaSach char(10),
    SoLuong int,
    DonGiaNhap decimal(18,2),

    primary key (MaPN, MaSach),
    foreign key (MaPN) references PhieuNhap(MaPN),
    foreign key (MaSach) references Sach(MaSach)
);

/* 13. HÓA ĐƠN */
create table HoaDon (
    MaHD char(10) primary key,
    TongSoLuong int,
    TongTien decimal(18,2),
    NgayLap date,
    MaKH char(10),
    MaNV char(10),

    foreign key (MaKH) references KhachHang(MaKH),
    foreign key (MaNV) references NhanVien(MaNV)
);

/* 14. CHI TIẾT HÓA ĐƠN */
create table ChiTietHoaDon (
    MaHD char(10),
    MaSach char(10),
    SoLuong int,
    DonGiaBan decimal(18,2),
    ThanhTien decimal(18,2),

    primary key (MaHD, MaSach),
    foreign key (MaHD) references HoaDon(MaHD),
    foreign key (MaSach) references Sach(MaSach)
);

/* 15. ĐÁNH GIÁ */
create table DanhGia (
    MaKH char(10),
    MaSach char(10),
    SoSao int,
    NoiDung nvarchar(1000),
    NgayDanhGia date,

    primary key (MaKH, MaSach),
    foreign key (MaKH) references KhachHang(MaKH),
    foreign key (MaSach) references Sach(MaSach)
);

/* 16. ADMIN */
create table Admin (
    MaAdmin char(10) primary key,
    TenAdmin nvarchar(200),
    Email nvarchar(100),
    SDT nvarchar(20),
    TenDangNhap nvarchar(100),

    foreign key (TenDangNhap) references TaiKhoan(TenDangNhap)
);

/* 17. NHẬT KÝ QUẢN LÝ */
create table NhatKyQuanLy (
    MaLog char(15) primary key,
    TenDangNhap nvarchar(100) not null,
    VaiTro nvarchar(50),
    HanhDong nvarchar(50),
    DoiTuong nvarchar(100),
    MaDoiTuong nvarchar(100),
    ThoiGian datetime default CURRENT_TIMESTAMP,
    GhiChu nvarchar(255),

    foreign key (TenDangNhap) references TaiKhoan(TenDangNhap)
);

/* 18. DANH MỤC */
create table DanhMuc (
    MaDanhMuc char(10) primary key,
    TenDanhMuc nvarchar(100) not null
);

/* 19. SẢN PHẨM */
create table SanPham (
    MaSP char(10) primary key,
    TenSP nvarchar(200) not null,
    GiaBan decimal(18,2) not null,
    SoLuong int not null,
    MaDanhMuc char(10) not null,
    TrangThai nvarchar(50),
    MoTa nvarchar(1000),

    foreign key (MaDanhMuc) references DanhMuc(MaDanhMuc)
);

INSERT INTO DanhMuc VALUES
('DM01', N'Sách'),
('DM02', N'Văn phòng phẩm'),
('DM03', N'Quà lưu niệm – Đồ chơi');
SELECT*FROM DanhMuc;

INSERT INTO SanPham (MaSP, TenSP, GiaBan, SoLuong, MaDanhMuc, TrangThai, MoTa) VALUES
-- ===== SÁCH (60 sản phẩm) =====
/* SÁCH TÂM LÝ - KỸ NĂNG SỐNG - PHÁT TRIỂN BẢN THÂN (19 quyển) */
/* (Self help, tư duy, thói quen, động lực) */
('SP01', N'Đắc Nhân Tâm (Tâm lý - kĩ năng sống)', 88000, 50, 'DM01', N'Đang bán', N'Sách kỹ năng sống kinh điển'),
('SP08', N'7 Thói Quen Hiệu Quả (Tâm lý)', 110000, 28, 'DM01', N'Đang bán', N'Phát triển bản thân'),
('SP09', N'Tôi Tài Giỏi Bạn Cũng Thế (Tâm lý)', 98000, 34, 'DM01', N'Đang bán', N'Sách tạo động lực'),
('SP12', N'Sống Đơn Giản Cho Mình Thanh Thản (Tâm lý)', 90000, 22, 'DM01', N'Đang bán', N'Lối sống tối giản'),
('SP20', N'Tư Duy Phản Biện (Tâm lý)', 98000, 26, 'DM01', N'Đang bán', N'Phát triển tư duy'),
('SP28', N'Tư Duy Tích Cực (Tâm lý)', 88000, 36, 'DM01', N'Đang bán', N'Sách self-help'),
('SP31', N'Đừng Bao Giờ Đi Ăn Một Mình (Kỹ năng)', 102000, 25, 'DM01', N'Đang bán', N'Xây dựng mối quan hệ'),
('SP33', N'Thiên Tài Bên Trái Kẻ Điên Bên Phải (Tâm lý)', 108000, 28, 'DM01', N'Đang bán', N'Khám phá tâm lý con người'),
('SP35', N'Cà Phê Cùng Tony (Kỹ năng sống)', 90000, 40, 'DM01', N'Đang bán', N'Truyền cảm hứng tuổi trẻ'),
('SP36', N'Tư Duy Ngược (Tư duy)', 95000, 27, 'DM01', N'Đang bán', N'Phát triển tư duy sáng tạo'),
('SP37', N'Dám Bị Ghét (Tâm lý)', 105000, 32, 'DM01', N'Đang bán', N'Triết lý sống hạnh phúc'),
('SP40', N'Đời Ngắn Đừng Ngủ Dài (Kỹ năng sống)', 88000, 45, 'DM01', N'Đang bán', N'Tạo động lực sống'),
('SP41', N'Quẳng Gánh Lo Đi Và Vui Sống (Tâm lý)', 97000, 38, 'DM01', N'Đang bán', N'Giải tỏa căng thẳng'),
('SP42', N'Atomic Habits – Thay Đổi Tí Hon (Kỹ năng)', 120000, 26, 'DM01', N'Đang bán', N'Hình thành thói quen tốt'),
('SP43', N'Tâm Lý Học Đám Đông (Tâm lý)', 110000, 24, 'DM01', N'Đang bán', N'Phân tích hành vi xã hội'),
('SP44', N'Hiệu Ứng Domino (Kỹ năng)', 99000, 29, 'DM01', N'Đang bán', N'Tư duy hành động nhỏ'),
('SP45', N'Làm Ít Được Nhiều (Kỹ năng)', 101000, 21, 'DM01', N'Đang bán', N'Quản lý thời gian'),
('SP56', N'Tư Duy Nền Tảng (Tư duy)', 99000, 31, 'DM01', N'Đang bán', N'Tư duy cốt lõi'),
('SP58', N'Đọc Vị Bất Kỳ Ai (Tâm lý)', 108000, 22, 'DM01', N'Đang bán', N'Ngôn ngữ cơ thể'),
('SP59', N'Tư Duy Logic (Tư duy)', 92000, 35, 'DM01', N'Đang bán', N'Rèn luyện suy luận'),

/* SÁCH KINH TẾ - TÀI CHÍNH - KINH DOANH - KHỞI NGHIỆP (9 quyển) */
/* (Đầu tư, làm giàu, quản trị, bán hàng) */
('SP03', N'Tư Duy Nhanh Và Chậm (Kinh tế)', 135000, 30, 'DM01', N'Đang bán', N'Sách kinh tế – tâm lý học'),
('SP04', N'Cha Giàu Cha Nghèo (Kinh tế)', 99000, 45, 'DM01', N'Đang bán', N'Quản lý tài chính cá nhân'),
('SP10', N'Dạy Con Làm Giàu (Kinh tế)', 105000, 29, 'DM01', N'Đang bán', N'Tài chính – đầu tư'),
('SP29', N'Nghĩ Giàu Làm Giàu (Kinh tế)', 99000, 27, 'DM01', N'Đang bán', N'Tư duy làm giàu'),
('SP30', N'Khởi Nghiệp Tinh Gọn (Kinh tế)', 115000, 21, 'DM01', N'Đang bán', N'Sách startup'),
('SP32', N'Bí Mật Tư Duy Triệu Phú (Kinh tế)', 98000, 30, 'DM01', N'Đang bán', N'Tư duy tài chính thành công'),
('SP55', N'Bán Hàng Đỉnh Cao (Kinh tế)', 115000, 28, 'DM01', N'Đang bán', N'Kỹ năng sales'),
('SP57', N'Nhà Đầu Tư Thông Minh (Kinh tế)', 145000, 16, 'DM01', N'Đang bán', N'Đầu tư chứng khoán'),
('SP60', N'The Psychology of Money (Kinh tế)', 125000, 19, 'DM01', N'Đang bán', N'Tâm lý tài chính'),

/* SÁCH VĂN HỌC VIỆT NAM VÀ NƯỚC NGOÀI (19 quyển) */
/* (Tiểu thuyết, truyện, tác phẩm kinh điển) */
('SP02', N'Nhà Giả Kim (Văn học)', 79000, 40, 'DM01', N'Đang bán', N'Tiểu thuyết truyền cảm hứng'),
('SP05', N'Không Gia Đình (Văn học)', 72000, 25, 'DM01', N'Đang bán', N'Tác phẩm văn học kinh điển'),
('SP06', N'Harry Potter Tập 1 (Tiểu thuyết)', 120000, 35, 'DM01', N'Đang bán', N'Tiểu thuyết giả tưởng'),
('SP07', N'Harry Potter Tập 2 (Tiểu thuyết)', 125000, 30, 'DM01', N'Đang bán', N'Tiểu thuyết giả tưởng'),
('SP11', N'Tuổi Trẻ Đáng Giá Bao Nhiêu (Văn học)', 85000, 40, 'DM01', N'Đang bán', N'Sách truyền cảm hứng'),
('SP13', N'The Alchemist (Tiểu thuyết)', 115000, 20, 'DM01', N'Đang bán', N'Tiểu thuyết nước ngoài'),
('SP21', N'Truyện Kiều (Văn học)', 68000, 50, 'DM01', N'Đang bán', N'Tác phẩm văn học Việt Nam'),
('SP22', N'Số Đỏ (Văn học)', 72000, 44, 'DM01', N'Đang bán', N'Truyện châm biếm'),
('SP23', N'1984 (Tiểu thuyết)', 89000, 33, 'DM01', N'Đang bán', N'Tiểu thuyết dystopia'),
('SP24', N'Hoàng Tử Bé (Văn học)', 75000, 48, 'DM01', N'Đang bán', N'Truyện thiếu nhi'),
('SP25', N'Bố Già (Tiểu thuyết)', 95000, 31, 'DM01', N'Đang bán', N'Tiểu thuyết kinh điển'),
('SP26', N'Những Người Khốn Khổ (Tiểu thuyết)', 120000, 24, 'DM01', N'Đang bán', N'Tác phẩm kinh điển'),
('SP27', N'Chiến Tranh Và Hòa Bình (Tiểu thuyết)', 130000, 18, 'DM01', N'Đang bán', N'Tiểu thuyết lịch sử'),
('SP34', N'Muôn Kiếp Nhân Sinh (Văn học)', 115000, 35, 'DM01', N'Đang bán', N'Triết lý nhân sinh'),
('SP38', N'Giết Con Chim Nhại (Văn học)', 98000, 20, 'DM01', N'Đang bán', N'Tác phẩm văn học Mỹ'),
('SP39', N'Bắt Trẻ Đồng Xanh (Văn học)', 92000, 22, 'DM01', N'Đang bán', N'Tiểu thuyết kinh điển'),
('SP51', N'Tôi Thấy Hoa Vàng Trên Cỏ Xanh (Văn học)', 78000, 42, 'DM01', N'Đang bán', N'Truyện tuổi thơ'),
('SP52', N'Mắt Biếc (Văn học)', 82000, 38, 'DM01', N'Đang bán', N'Truyện tình cảm'),
('SP53', N'Cho Tôi Xin Một Vé Đi Tuổi Thơ (Văn học)', 75000, 40, 'DM01', N'Đang bán', N'Truyện Nguyễn Nhật Ánh'),

/* SÁCH GIÁO KHOA - HỌC TẬP - CÔNG NGHỆ - LẬP TRÌNH (9 quyển) */
/* (Sách học, IT, kỹ thuật) */
('SP16', N'Tiếng Anh Giao Tiếp Cơ Bản (Giáo khoa)', 65000, 60, 'DM01', N'Đang bán', N'Sách học ngoại ngữ'),
('SP17', N'Toán Cao Cấp (Giáo khoa)', 70000, 55, 'DM01', N'Đang bán', N'Sách tham khảo'),
('SP18', N'Lập Trình C Cơ Bản (Giáo khoa)', 90000, 42, 'DM01', N'Đang bán', N'Sách IT'),
('SP19', N'Học SQL Trong 24 Giờ (Giáo khoa)', 95000, 38, 'DM01', N'Đang bán', N'Sách công nghệ'),
('SP46', N'Clean Code (Công nghệ)', 150000, 18, 'DM01', N'Đang bán', N'Lập trình chuẩn mực'),
('SP47', N'Design Patterns (Công nghệ)', 160000, 15, 'DM01', N'Đang bán', N'Mẫu thiết kế phần mềm'),
('SP48', N'Tư Duy Lập Trình (Công nghệ)', 98000, 34, 'DM01', N'Đang bán', N'Phát triển logic'),
('SP49', N'Học Python Cơ Bản (Giáo khoa)', 105000, 30, 'DM01', N'Đang bán', N'Sách lập trình Python'),
('SP50', N'Nhập Môn Trí Tuệ Nhân Tạo (Công nghệ)', 135000, 17, 'DM01', N'Đang bán', N'AI cơ bản'),

/* SÁCH TIỂU SỬ - HỒI KÝ - LÃNH ĐẠO (3 quyển) */
/* (Doanh nhân, truyển cảm hứng) */
('SP14', N'Steve Jobs (Tiểu sử - hồi ký)', 140000, 18, 'DM01', N'Đang bán', N'Tiểu sử doanh nhân'),
('SP15', N'Elon Musk (Tiểu sử - hồi ký)', 145000, 16, 'DM01', N'Đang bán', N'Tiểu sử công nghệ'),
('SP54', N'Nhà Lãnh Đạo Không Chức Danh (Kỹ năng)', 110000, 23, 'DM01', N'Đang bán', N'Kỹ năng lãnh đạo'),

-- ===== VĂN PHÒNG PHẨM (10) =====
('SP61', N'Bút bi Thiên Long', 6000, 200, 'DM02', N'Đang bán', N'Bút bi xanh'),
('SP62', N'Bút chì 2B', 5000, 180, 'DM02', N'Đang bán', N'Bút chì học sinh'),
('SP63', N'Tập 200 trang', 12000, 150, 'DM02', N'Đang bán', N'Tập học sinh'),
('SP64', N'Sổ tay da', 45000, 60, 'DM02', N'Đang bán', N'Sổ ghi chép'),
('SP65', N'Thước kẻ 20cm', 8000, 120, 'DM02', N'Đang bán', N'Dụng cụ học tập'),
('SP66', N'Gôm tẩy', 4000, 140, 'DM02', N'Đang bán', N'Gôm cao su'),
('SP67', N'Bút dạ quang', 15000, 90, 'DM02', N'Đang bán', N'Bút đánh dấu'),
('SP68', N'Bìa hồ sơ', 10000, 110, 'DM02', N'Đang bán', N'Bìa nhựa'),
('SP69', N'Kéo văn phòng', 25000, 70, 'DM02', N'Đang bán', N'Kéo inox'),
('SP70', N'Băng keo trong', 9000, 130, 'DM02', N'Đang bán', N'Băng keo dán'),

-- ===== QUÀ LƯU NIỆM – ĐỒ CHƠI (10) =====
('SP71', N'Móc khóa anime', 25000, 80, 'DM03', N'Đang bán', N'Móc khóa trang trí'),
('SP72', N'Gấu bông nhỏ', 90000, 45, 'DM03', N'Đang bán', N'Quà tặng'),
('SP73', N'Bình nước dễ thương', 75000, 55, 'DM03', N'Đang bán', N'Bình nhựa'),
('SP74', N'Hộp bút hoạt hình', 35000, 65, 'DM03', N'Đang bán', N'Quà học sinh'),
('SP75', N'Đèn ngủ mini', 120000, 30, 'DM03', N'Đang bán', N'Đèn trang trí'),
('SP76', N'Sticker trang trí', 15000, 100, 'DM03', N'Đang bán', N'Sticker cute'),
('SP77', N'Tượng trang trí mini', 110000, 25, 'DM03', N'Đang bán', N'Đồ decor'),
('SP78', N'Hộp quà lưu niệm', 95000, 40, 'DM03', N'Đang bán', N'Quà tặng'),
('SP79', N'Bút máy khắc tên', 180000, 20, 'DM03', N'Đang bán', N'Quà cao cấp'),
('SP80', N'Combo quà sinh nhật', 220000, 15, 'DM03', N'Đang bán', N'Quà tặng tổng hợp');
SELECT*FROM SanPham;