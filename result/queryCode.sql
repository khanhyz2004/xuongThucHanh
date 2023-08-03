use QuanLySanPhamNN
go
--create or alter function
--go
create or alter trigger tr_insert_NHCT on nhaphangchitiet
for insert
as
begin
	declare @masptk int, @sl int;
	select @masptk = masptonkho, @sl = SoLuongNhap from inserted;
	--insert into @tempExists
	--select sptk.maSPtonKho from inserted ins
	--join SanPhamTonKho sptk on sptk.maSPtonKho = ins.maSPTonKho

	if @masptk in (select maSPtonKho from SanPhamTonKho)
	begin
		update SanPhamTonKho
		set SoLuongTonKho += @sl
		where maSPtonKho = @masptk
	end
	else
	begin
		insert into SanPhamTonKho values
		(@masptk, )
	end

end
--Tạo view xuất ra các sản phẩm tồn kho và số lượng của chúng <group by maKho>

CREATE VIEW ViewSanPhamTonKho AS
SELECT makho AS MaKho, masp AS MaSP, soluongtonkho AS SoLuongTonKho
FROM SanPhamTonKho
GROUP BY makho, masp, soluongtonkho;
 select * from ViewSanPhamTonKho


--Tạo view doanh thu công ty = tổng tất cả đơn xh – tổng tất cả đơn nhập hàng
CREATE VIEW ViewDoanhThuCongTy AS
SELECT 
    ISNULL(SUM(XHCT.SoLuongSp * SP.DonGia), 0) - ISNULL(SUM(NHCT.SoLuongNhap * SP.DonGia), 0) AS DoanhThu
FROM 
(
    SELECT maDXH, maSPtonKho, SoLuongSp
    FROM XuatHangChiTiet
) AS XHCT
LEFT JOIN SanPhamTonKho ON XHCT.maSPtonKho = SanPhamTonKho.maSPtonKho
LEFT JOIN SanPham AS SP ON XHCT.maSPtonKho = SP.MaSP
LEFT JOIN (
    SELECT maDNH, maSP, SoLuongNhap
    FROM NhapHangChiTiet
) AS NHCT ON XHCT.maSPtonKho = NHCT.maSP;

SELECT * FROM ViewDoanhThuCongTy

