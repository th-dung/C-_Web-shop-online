USE [master]
GO
/****** Object:  Database [QLNN]    Script Date: 07/01/2022 4:33:31 CH ******/
CREATE DATABASE [QLNN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLNN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLNN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLNN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLNN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLNN] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLNN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLNN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLNN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLNN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLNN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLNN] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLNN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLNN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLNN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLNN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLNN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLNN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLNN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLNN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLNN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLNN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLNN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLNN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLNN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLNN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLNN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLNN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLNN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLNN] SET RECOVERY FULL 
GO
ALTER DATABASE [QLNN] SET  MULTI_USER 
GO
ALTER DATABASE [QLNN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLNN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLNN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLNN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLNN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLNN] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLNN', N'ON'
GO
ALTER DATABASE [QLNN] SET QUERY_STORE = OFF
GO
USE [QLNN]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 07/01/2022 4:33:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[UserAdmin] [varchar](30) NOT NULL,
	[PassAdmin] [varchar](30) NOT NULL,
	[Hoten] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDatHang]    Script Date: 07/01/2022 4:33:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDatHang](
	[SoDH] [int] NOT NULL,
	[MaDT] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
 CONSTRAINT [Pk_ChiTietDatHang] PRIMARY KEY CLUSTERED 
(
	[SoDH] ASC,
	[MaDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuDe]    Script Date: 07/01/2022 4:33:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDe](
	[MaCD] [int] IDENTITY(1,1) NOT NULL,
	[TenChuDe] [nvarchar](50) NOT NULL,
 CONSTRAINT [Pk_ChuDe] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 07/01/2022 4:33:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[SoDH] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayDH] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[DaThanhToan] [bit] NULL,
	[TinhTrangGiaoHang] [bit] NULL,
 CONSTRAINT [Pk_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[SoDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DT]    Script Date: 07/01/2022 4:33:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DT](
	[MaDT] [int] IDENTITY(1,1) NOT NULL,
	[TenDT] [nvarchar](100) NOT NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[MoTa] [nvarchar](max) NULL,
	[AnhBia] [varchar](50) NULL,
	[NgayCapNhat] [datetime] NULL,
	[SoLuongTon] [int] NULL,
	[MaCD] [int] NULL,
	[MaNSX] [int] NULL,
 CONSTRAINT [Pk_DT] PRIMARY KEY CLUSTERED 
(
	[MaDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 07/01/2022 4:33:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[Email] [varchar](100) NULL,
	[DiachiKH] [nvarchar](200) NULL,
	[DienThoaiKH] [varchar](50) NULL,
	[NgaySinh] [datetime] NULL,
 CONSTRAINT [Pk_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MAC]    Script Date: 07/01/2022 4:33:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAC](
	[MaTG] [int] IDENTITY(1,1) NOT NULL,
	[MaDT] [int] NULL,
	[VaiTro] [nvarchar](50) NULL,
	[ViTri] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 07/01/2022 4:33:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNSX] [int] IDENTITY(1,1) NOT NULL,
	[TenNSX] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](200) NULL,
	[DienThoai] [varchar](50) NULL,
 CONSTRAINT [Pk_NhaSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 07/01/2022 4:33:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia](
	[MaTG] [int] IDENTITY(1,1) NOT NULL,
	[TenTG] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
	[TieuSu] [nvarchar](max) NULL,
	[DienThoai] [varchar](50) NULL,
 CONSTRAINT [Pk_TacGia] PRIMARY KEY CLUSTERED 
(
	[MaTG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([UserAdmin], [PassAdmin], [Hoten]) VALUES (N'admin', N'123456', N'Tran Hung Dung')
INSERT [dbo].[Admin] ([UserAdmin], [PassAdmin], [Hoten]) VALUES (N'user', N'654321', N'Mr Dung')
GO
INSERT [dbo].[ChiTietDatHang] ([SoDH], [MaDT], [SoLuong], [DonGia]) VALUES (1, 10, 1, CAST(4300000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDatHang] ([SoDH], [MaDT], [SoLuong], [DonGia]) VALUES (2, 16, 4, CAST(1790000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDatHang] ([SoDH], [MaDT], [SoLuong], [DonGia]) VALUES (3, 8, 1, CAST(24000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDatHang] ([SoDH], [MaDT], [SoLuong], [DonGia]) VALUES (4, 7, 4, CAST(63000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDatHang] ([SoDH], [MaDT], [SoLuong], [DonGia]) VALUES (5, 10, 1, CAST(4300000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDatHang] ([SoDH], [MaDT], [SoLuong], [DonGia]) VALUES (6, 9, 1, CAST(2300000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDatHang] ([SoDH], [MaDT], [SoLuong], [DonGia]) VALUES (7, 7, 2, CAST(63000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDatHang] ([SoDH], [MaDT], [SoLuong], [DonGia]) VALUES (8, 7, 1, CAST(63000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDatHang] ([SoDH], [MaDT], [SoLuong], [DonGia]) VALUES (9, 7, 1, CAST(63000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDatHang] ([SoDH], [MaDT], [SoLuong], [DonGia]) VALUES (10, 9, 1, CAST(2300000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[ChuDe] ON 

INSERT [dbo].[ChuDe] ([MaCD], [TenChuDe]) VALUES (1, N' MACBOOK ')
INSERT [dbo].[ChuDe] ([MaCD], [TenChuDe]) VALUES (2, N' LAPTOP KHÁC')
INSERT [dbo].[ChuDe] ([MaCD], [TenChuDe]) VALUES (3, N' BÀN PHÍM')
INSERT [dbo].[ChuDe] ([MaCD], [TenChuDe]) VALUES (4, N' CON CHUỘT')
INSERT [dbo].[ChuDe] ([MaCD], [TenChuDe]) VALUES (5, N' AIRPOD')
SET IDENTITY_INSERT [dbo].[ChuDe] OFF
GO
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 

INSERT [dbo].[DonDatHang] ([SoDH], [MaKH], [NgayDH], [NgayGiao], [DaThanhToan], [TinhTrangGiaoHang]) VALUES (1, 1, CAST(N'2022-01-05T14:03:37.780' AS DateTime), CAST(N'2022-01-05T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[DonDatHang] ([SoDH], [MaKH], [NgayDH], [NgayGiao], [DaThanhToan], [TinhTrangGiaoHang]) VALUES (2, 1, CAST(N'2022-01-05T14:08:08.413' AS DateTime), CAST(N'2022-01-05T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[DonDatHang] ([SoDH], [MaKH], [NgayDH], [NgayGiao], [DaThanhToan], [TinhTrangGiaoHang]) VALUES (3, 1, CAST(N'2022-01-05T14:16:40.300' AS DateTime), CAST(N'2022-01-12T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[DonDatHang] ([SoDH], [MaKH], [NgayDH], [NgayGiao], [DaThanhToan], [TinhTrangGiaoHang]) VALUES (4, 1, CAST(N'2022-01-05T14:31:41.487' AS DateTime), CAST(N'2022-01-05T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[DonDatHang] ([SoDH], [MaKH], [NgayDH], [NgayGiao], [DaThanhToan], [TinhTrangGiaoHang]) VALUES (5, 1, CAST(N'2022-01-05T14:32:13.427' AS DateTime), CAST(N'2022-01-27T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[DonDatHang] ([SoDH], [MaKH], [NgayDH], [NgayGiao], [DaThanhToan], [TinhTrangGiaoHang]) VALUES (6, 1, CAST(N'2022-01-05T14:46:39.867' AS DateTime), CAST(N'2021-12-28T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[DonDatHang] ([SoDH], [MaKH], [NgayDH], [NgayGiao], [DaThanhToan], [TinhTrangGiaoHang]) VALUES (7, 1, CAST(N'2022-01-05T14:50:23.747' AS DateTime), CAST(N'2022-01-12T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[DonDatHang] ([SoDH], [MaKH], [NgayDH], [NgayGiao], [DaThanhToan], [TinhTrangGiaoHang]) VALUES (8, 1, CAST(N'2022-01-05T14:53:56.220' AS DateTime), CAST(N'2022-01-12T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[DonDatHang] ([SoDH], [MaKH], [NgayDH], [NgayGiao], [DaThanhToan], [TinhTrangGiaoHang]) VALUES (9, 1, CAST(N'2022-01-06T11:06:00.150' AS DateTime), CAST(N'2022-01-05T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[DonDatHang] ([SoDH], [MaKH], [NgayDH], [NgayGiao], [DaThanhToan], [TinhTrangGiaoHang]) VALUES (10, 2, CAST(N'2022-01-07T16:25:32.917' AS DateTime), CAST(N'2022-01-07T00:00:00.000' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
GO
SET IDENTITY_INSERT [dbo].[DT] ON 

INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (1, N' Macbook pro 13 ', CAST(23000000 AS Decimal(18, 0)), N'Trong các dòng Macbook, cái tên thôi đã nói lên tất cả về sức mạnh cũng như thiết kế của máy rồi. Cấu hình mạnh mẽ, GPU đáp ứng nhu cầu chỉnh sửa video chất lượng 4K ở mức ổn, đặc biệt là màn hình Retina chuẩn 2K vô cùng sắc nét. ', N'pro13.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 1, 1)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (2, N' Macbook air M1 ', CAST(19000000 AS Decimal(18, 0)), N'Laptop Apple MacBook Air M1 2020 thuộc dòng laptop cao cấp sang trọng có cấu hình mạnh mẽ, chinh phục được các tính năng văn phòng lẫn đồ hoạ mà bạn mong muốn, thời lượng pin dài, thiết kế mỏng nhẹ sẽ đáp ứng tốt các nhu cầu làm việc của bạn. ', N'air.jpg', CAST(N'2016-04-07T00:00:00.000' AS DateTime), 9, 1, 1)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (3, N' Macbook retina ', CAST(19000000 AS Decimal(18, 0)), N'Laptop Apple MacBook Air M1 2020 thuộc dòng laptop cao cấp sang trọng có cấu hình mạnh mẽ, chinh phục được các tính năng văn phòng lẫn đồ hoạ mà bạn mong muốn, thời lượng pin dài, thiết kế mỏng nhẹ sẽ đáp ứng tốt các nhu cầu làm việc của bạn. ', N'retina.jpg', CAST(N'2016-04-07T00:00:00.000' AS DateTime), 9, 1, 1)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (4, N' Macbook pro 15 ', CAST(46000000 AS Decimal(18, 0)), N' Cuối cùng sẽ là dòng máy được người dùng đánh giá cao nhất bởi chiếc máy MacBook Pro này chẳng những mạnh nhất, bự nhất, nặng nhất mà còn …đắt nhất của Apple giới thiệu, dành riêng cho MacBook đưa hiệu năng của MacBook Pro 2020 lên một tầm cao mới. Màn hình Retina siêu nét, thời lượng pin ấn tượng và hàng loạt các tính năng hiện đại giúp bạn có được trải nghiệm làm việc chuyên nghiệp nhất.', N'pro15.jpg', CAST(N'2016-04-04T00:00:00.000' AS DateTime), 9, 1, 1)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (5, N' Macbook air 2019  ', CAST(23000000 AS Decimal(18, 0)), N'MacBook Air 2019 128 GB i5 đã ra mắt giữ nguyên các ưu điểm vốn có của dòng MacBook Air: Mỏng nhẹ, cấu hình khỏe và pin trâu. Mẫu MacBook mới còn được trang bị màn hình True Tone và cải tiến bàn phím Butterfly thế hệ mới, ổn định và gõ êm hơn. ', N'air2019.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 1, 1)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (6, N' Macbook pro 13 2020 ', CAST(43000000 AS Decimal(18, 0)), N'MacBook Pro 13 2020 mới với bộ vi xử lý Intel thế hệ thứ 10 mạnh mẽ, bàn phím Magic Keyboard mới bền vững hơn, sẽ đưa bạn đến trải nghiệm của sự chuyên nghiệp, tốc độ và tính tiện lợi trong công việc.. ', N'pro2020.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 1, 1)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (7, N' Macbook pro 15 2020 ', CAST(63000000 AS Decimal(18, 0)), N'Macbook Pro 15 inch Touch Bar 2019 – MV912 sử dụng chip Intel Core I9 thế hệ 9 có 8 nhân 16 luồng I9-9880H với xung nhịp cơ bản 2.3GHz, TurboBoost lên đến 4.8GHz và bộ nhớ đệm 16MB với công nghệ SmartCache.. ', N'pro2021.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 1, 1)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (8, N' Macbook retina ', CAST(24000000 AS Decimal(18, 0)), N'Là thế hệ đầu tiên sử dụng chip do chính Apple sản xuất, MacBook Air M1 2020 sở hữu hiệu năng vô cùng mạnh mẽ khi mang tới tốc độ xử lý nhanh, chính xác dù phải làm việc với những tác vụ lớn và nặng. Bên cạnh đó, thời gian sử dụng pin cũng được nâng cấp lâu hơn, đem tới trải nghiệm tốt hơn cho người dùng. ', N'retina2020.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 1, 1)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (9, N' Airpod2 ', CAST(2300000 AS Decimal(18, 0)), N'sở hữu thiết kế tinh tế với hai bên tai nghe không dây đi kèm hộp đựng vừa có vai trò sạc pin là nét đặc trưng của dòng AirPods. Thừa hưởng một vài nét thiết kế từ thế hệ đời đầu, AirPods 2 có thân tai nghe chạy dọc xuống phía dưới mang đến nét riêng biệt mà không nhầm lẫn với các dòng tai nghe nào khác.', N'airpod2.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 5, 1)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (10, N' Airpodpro ', CAST(4300000 AS Decimal(18, 0)), N'Apple AirPods Pro đã tạm biệt kiểu dáng ear-bud quen thuộc bấy lâu nay trên AirPod 2 và chuyển sang thiết kế in-ear với phần đệm silicon mềm mại, êm ái cho tai nghe. Đặc biệt đệm silicon còn có khả năng cách âm cực tốt, ngăn chặn tạp âm hiệu quả. Tai nghe cũng có trọng lượng tương đối nhẹ, chỉ là 5.4g và khi đi kèm với hộp thì là 45.6g. Trong hộp đựng AirPods Pro sẽ có sẵn ba kích cỡ đệm khác nhau để bạn chọn lựa sao cho phù hợp và thoải mái nhất. Nhờ vậy mà nó có thể phù hợp để đồng hành cùng mọi người mọi lúc mọi nơi.', N'airpodpro.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 5, 1)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (11, N' Laptop usus vivobook ', CAST(26000000 AS Decimal(18, 0)), N'chiếc máy chính hãng, chất lượng, có khả năng đáp ứng mọi tác vụ văn phòng một cách hiệu quả. Ngoài ra, máy cũng luôn được trang bị một ổ nhớ SSD với khả năng tăng tốc độ xử lý nhanh nhằm mang đến những trải nghiệm thú vị cho người dùng. Đồng thời, cũng đừng quên khám phá thêm mẫu laptop ASUS Vivobook 15 X515EA-EJ062T, một trong những dòng laptop văn phòng có khả năng giải quyết nhiều tác vụ nặng một cách ổn định.', N'vivobook.jpg', CAST(N'2016-04-04T00:00:00.000' AS DateTime), 9, 2, 2)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (12, N' Laptop dell vostro ', CAST(23000000 AS Decimal(18, 0)), N'Laptop Dell Vostro 3510 7T2YC1 mang đến cho bạn trải nghiệm hình ảnh ấn tượng với độ rõ nét cao, màu sắc chân thực nhờ trang bị màn hình 15.6 inch Full HD với viền cực mỏng. Hơn nữa, màn hình laptop còn có lớp chống chói Anti-Glare giúp màn hình không bị chói lóa, bảo vệ mắt ở nơi có cường độ ánh sáng cao.', N'vostro.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 2, 4)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (13, N' Acer pretador ', CAST(43000000 AS Decimal(18, 0)), N'Xét về phong cách thiết kế, Acer Predator Helios 300 không có quá nhiều thay đổi so với thế hệ tiền nhiệm. Máy vẫn sở hữu kiểu dáng to hầm hố với nhiều chi tiết góc cạnh như khe tản nhiệt, 2 đường kẻ xanh trên nắp lưng của máy hay logo Predator với LED đơn sắc Electric Blue. Ban đầu tác giả không đánh giá cao bộ khung của Helios 300 bởi vì anh ấy liên tưởng tới dòng máy gaming phổ thông cũng của Acer là Nitro 5. ', N'helios.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 2, 5)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (14, N' MSI leopard GL65 ', CAST(23000000 AS Decimal(18, 0)), N'ó một thiết kế rất thể thao và đậm chất gaming, đúng với phong cách thường thấy của những chiếc laptop MSI. Với cấu hình mạnh mẽ và một hệ thống tản nhiệt ấn tượng,đây là mẫu laptop thuộc phân khúc tầm trung đáng để bạn quan tâm.. ', N'leopard.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 2, 3)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (15, N'Bàn phím Logitech g610  ', CAST(1740000 AS Decimal(18, 0)), N'Logitech G610 Orion là một trong những dòng bàn phím cơ được thiết kế dành riêng cho game thủ với thiết kế hơi hướng classic, ít phá cách nhưng vẫn sang trọng và cá tính. Bề mặt sản phẩm và các nút bấm sử dụng chất liệu nhựa cao cấp, chắc chắn và không để lại vân tay. ', N'banphim1.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 3, 6)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (16, N'Bàn phím Logitech g613  ', CAST(1790000 AS Decimal(18, 0)), N'G613 là bàn phím không dây thế hệ tiếp theo dành cho những game thủ muốn cả hiệu suất cao của phím switch cơ học và sự tự do chơi game không dây. ', N'banphim2.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 3, 6)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (17, N'Bàn phím Logitech g512  ', CAST(2300000 AS Decimal(18, 0)), N'Logitech G512 GX được thiết kế hướng đến hiệu suất và tích hợp công nghệ chơi game mạnh mẽ. Từ các chi tiết tinh tế nhất như kết cấu mờ phủ vân tay và dây cáp có độ bền cao, tới chi tiết phức tạp nhất, mỗi khía cạnh được thiết kế chính xác bởi công nghệ dẫn đầu ngành của Logitech G cùng chất lượng vào kiểu dáng được chế tạo độc đáo. ', N'banphim3.jpg ', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 3, 6)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (18, N'Bàn phím Durgod  ', CAST(2000000 AS Decimal(18, 0)), N'Bàn phím Durgod V87s RGB được thiết kế khá gọn và nhẹ thuận tiện việc di chuyển thường xuyên hoặc đặt bàn phím ở những nơi hạn chế về không gian thì bàn phím Durgod V87s RGB sẽ là sự lựa chọn hoàn hảo.', N'banphim4.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 3, 7)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (19, N'Bàn phím cơ Kingston ', CAST(2400000 AS Decimal(18, 0)), N'Alloy Origins Core ứng dụng switch được thiết kế tùy chỉnh- đây là sự cân bằng giữa độ phản hồi và độ chính xác, có hành trình phím ngắn và lực kích thích nhẹ. Chúng cũng rất tin cậy ở mức 80 triệu lần nhấn phím mà không giảm chất lượng.', N'banphim5.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 3, 7)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (20, N'Chuột Logitech  ', CAST(2300000 AS Decimal(18, 0)), N'HERO 16K là một trong những dòng chuột logitech đưuọc trang bị cảm biến chơi game chính xác nhất từ trước tới nay của chúng tôi với độ chính xác thế hệ tiếp theo và cấu trúc toàn diện. HERO 16K có khả năng tạo ra 400+ IPS, 100 - 16,000 DPI, và làm mịn, lọc hay tăng tốc trên toàn bộ dải DPI. ', N'conchuot1.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 4, 6)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (21, N'Chuột HyperX ', CAST(1200000 AS Decimal(18, 0)), N'Thiết kế công thái học để vừa với tay của bạn cùng với hai rãnh bám để bạn luôn bám chắc ngay cả khi di chuyển nhanh.. ', N'conchuot2.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 4, 7)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (22, N'Chuột Logitech G502 Hero ', CAST(1900000 AS Decimal(18, 0)), N'Ngoài hiệu suất cốt lõi và các tính năng cá nhân, nhiều chi tiết được thiết kế và chế tạo với sự tận tâm. Logitech G502 Hero là một trong những dòng chuột gaming giá rẻ so với các sản phẩm ở cùng phân khúc với dây bện với nút buộc dây có khóa nhám, phần cầm nắm bên có viền cao su, cửa từ vào khoang để khối nặng và nhiều hơn nữa. ', N'conchuot3.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 4, 6)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (23, N'Chuột Logitech G Pro Hero ', CAST(1100000 AS Decimal(18, 0)), N'HERO 16K đạt được độ chính xác cấp độ thi đấu và độ nhạy ổn định nhất từ trước tới nay. Hãy chắc chắn tùy chỉnh và sửa các cài đặt DPI của bạn bằng Logitech G HUB.   ', N'conchuot4.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 4, 6)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (24, N' Macbook air 2017 ', CAST(25000000 AS Decimal(18, 0)), N'Macbook Air 2017 mang những đặc trưng thiết kế của dòng MacBook Air với trọng lượng và độ dày của laptop lần lượt là 1.7 cm và 1.35 kg rất tiện lợi và dễ dàng giúp người dùng không cảm thấy bất tiện khi mang trên vai thường xuyên khi đi học hay đi làm.  ', N'air2017.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 1, 1)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (25, N' Macbook pro 2018 ', CAST(27000000 AS Decimal(18, 0)), N'Thế hệ Macbook Pro 2018 đã được ra mắt với nâng cấp mạnh mẽ về cấu hình và khả năng bảo mật với con chip Apple T2. Máy vẫn giữ nguyên các ưu điểm đặc trưng như màn hình siêu nét, thiết kế cao cấp cùng thanh Touch Bar cho khả năng tương tác tuyệt vời với các ứng dụng.  ', N'pro2018.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 1, 1)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (26, N' Macbook pro 2019 ', CAST(43000000 AS Decimal(18, 0)), N'Được thiết kế tốt nhất dành cho các nhà làm phim, thiết kế, khoa học, những nhà làm nhạc chuyên dụng, phát triển ứng dụng… và cho tất cả những ai sống, làm việc và giải trí trên MacBook. ', N'pro2019.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 1, 1)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (27, N' Macbook air 2015 ', CAST(25000000 AS Decimal(18, 0)), N'Macbook Air là dòng laptop nổi bật của Apple, được người dùng ưa chuộng trong suốt thời gian dài kể từ ngày chính thức ra mắt. Với thiết kế gần như hoàn hảo, hiệu năng mượt mà, phiên bản Macbook Air 2015 13 inch sẽ còn tối ưu hơn khi được trang bị card đồ họa tích hợp Intel HD Graphics 6000, thanh RAM 8 GB mạnh mẽ, ổ cứng lưu trữ SSD tốc độ tăng gấp đôi 128 GB và bộ vi xử lý mới từ Intel.  ', N'air2015.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 1, 1)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (28, N' Macbook air 2016 ', CAST(23000000 AS Decimal(18, 0)), N'Macbook Air 2016 MMGF2 của Apple là một siêu phẩm với sức mạnh vượt trội bên trong kích thước siêu nhỏ gọn. Với thời lượng pin dài cung cấp cho bạn năng lượng để làm việc hiệu quả. Không chỉ là sự khác biệt giữa kích thước và thiết kế mà Macbook Air còn ấn tượng về hiệu suất hoạt động. Được trang bị bộ xử lý Intel Core i5 Dual Core thế hệ thứ 5, bộ nhớ Ram được nâng cấp lên đến 8GB cùng ổ cứng SSD 128GB, bộ xử lý đồ họa mới Intel HD Graphics 6000. ', N'air2016.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 1, 1)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (29, N' Macbook pro 2016 ', CAST(33000000 AS Decimal(18, 0)), N'Macbook Pro 2016 MLUQ2 là dòng sản phẩm cao cấp với thiết kế kim loại nguyên khối, chip i5 thế hệ thứ 6 và dùng ổ SSD dung lượng 256 GB mang đến sự bền bỉ và mạnh mẽ khi sử dụng. ', N'pro2016.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 1, 1)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (30, N' Macbook pro 2017 ', CAST(36000000 AS Decimal(18, 0)), N'phiên bản 2017 Apple có nhiều cải tiếng gia tăng. Tại sự kiện WWDC 2017, Apple đã cho ra mắt thế hệ MacBook Pro 2017 MPTR2 với những cải tiến đáng kể trên chip xử lý, cụ thể là Apple đã sử dụng chip Intel thế hệ 7 với mã Kaby Lake. ', N'pro2017.jpg', CAST(N'2016-05-04T00:00:00.000' AS DateTime), 9, 1, 1)
INSERT [dbo].[DT] ([MaDT], [TenDT], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaCD], [MaNSX]) VALUES (32, N'Laptop Asus tuf', CAST(28000000 AS Decimal(18, 0)), N'<p>ASUS TUF Gaming Dash F15 l&agrave; một chiếc laptop gaming hạng nặng với bộ vi xử l&yacute; AMD Ryzen 5000 mới nhất kết hợp với GPU Nvidia RTX 3000 mới nhất v&agrave; một thiết lập &acirc;m thanh tổng thể tuyệt vời.</p>', N'tuf.jpg', CAST(N'2022-01-06T00:00:00.000' AS DateTime), 3, 2, 2)
SET IDENTITY_INSERT [dbo].[DT] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiachiKH], [DienThoaiKH], [NgaySinh]) VALUES (1, N'Trần Hùng Dũng', N'HungDungTran', N'123', N'thdung@gmail.com', N'Quận 1 - Sài Gòn', N'0987654321', CAST(N'2022-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiachiKH], [DienThoaiKH], [NgaySinh]) VALUES (2, N'Dư Thoại Kỳ', N'ThoaiKyDu', N'123', N'dtky@gmail.com', N'ABC', N'0987654321', CAST(N'2022-01-05T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[MAC] ON 

INSERT [dbo].[MAC] ([MaTG], [MaDT], [VaiTro], [ViTri]) VALUES (1, 1, N'', N'')
SET IDENTITY_INSERT [dbo].[MAC] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaSanXuat] ON 

INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (1, N'  Apple', N' 161 B Lý Chính Thắng - Phường 7 - Quận 3 - Thành phố Hồ Chí Minh', N'0909030102')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (2, N'  Asus', N' 5 Quang trung - Phường 3 - Gò Vấp - Thành phố Hồ Chí Minh', N'0999995153')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (3, N'  Msi', N' 151 Công Điền - Phường 5 - Quận 4 - Thành phố Hồ Chí Minh', N'0909372561')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (4, N'  Dell', N'  Tô Vân - Phường 1 - Quận Tân Bình - Thành phố Hồ Chí Minh', N'0903125463')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (5, N'  Acer', N' DT43 - Phường 2 - Quận 12 - Thành phố Hồ Chí Minh', N'0909636363')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (6, N'  Logitech', N' 161 B Lý Chính Thắng - Phường 7 - Quận 3 - Thành phố Hồ Chí Minh', N'0909030102')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (7, N'  HyperX', N' 161 B Lý Chính Thắng - Phường 7 - Quận 3 - Thành phố Hồ Chí Minh', N'0909030102')
SET IDENTITY_INSERT [dbo].[NhaSanXuat] OFF
GO
SET IDENTITY_INSERT [dbo].[TacGia] ON 

INSERT [dbo].[TacGia] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (1, N'Steve Jobs, Steve Wozniak, Ronald Wayne', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[TacGia] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KhachHan__A9D10534F913C5B9]    Script Date: 07/01/2022 4:33:32 CH ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KhachHan__D5B8C7F0211ED8A1]    Script Date: 07/01/2022 4:33:32 CH ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChiTietDatHang]  WITH CHECK ADD  CONSTRAINT [Fk_DonHang] FOREIGN KEY([SoDH])
REFERENCES [dbo].[DonDatHang] ([SoDH])
GO
ALTER TABLE [dbo].[ChiTietDatHang] CHECK CONSTRAINT [Fk_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDatHang]  WITH CHECK ADD  CONSTRAINT [Fk_Sach] FOREIGN KEY([MaDT])
REFERENCES [dbo].[DT] ([MaDT])
GO
ALTER TABLE [dbo].[ChiTietDatHang] CHECK CONSTRAINT [Fk_Sach]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [Fk_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [Fk_KhachHang]
GO
ALTER TABLE [dbo].[DT]  WITH CHECK ADD  CONSTRAINT [Fk_ChuDe] FOREIGN KEY([MaCD])
REFERENCES [dbo].[ChuDe] ([MaCD])
GO
ALTER TABLE [dbo].[DT] CHECK CONSTRAINT [Fk_ChuDe]
GO
ALTER TABLE [dbo].[DT]  WITH CHECK ADD  CONSTRAINT [Fk_NhaSanXuat] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NhaSanXuat] ([MaNSX])
GO
ALTER TABLE [dbo].[DT] CHECK CONSTRAINT [Fk_NhaSanXuat]
GO
ALTER TABLE [dbo].[MAC]  WITH CHECK ADD  CONSTRAINT [Fk_TacGia] FOREIGN KEY([MaTG])
REFERENCES [dbo].[TacGia] ([MaTG])
GO
ALTER TABLE [dbo].[MAC] CHECK CONSTRAINT [Fk_TacGia]
GO
ALTER TABLE [dbo].[ChiTietDatHang]  WITH CHECK ADD CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[ChiTietDatHang]  WITH CHECK ADD CHECK  (([SoLuong]>(0)))
GO
ALTER TABLE [dbo].[DT]  WITH CHECK ADD CHECK  (([GiaBan]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [QLNN] SET  READ_WRITE 
GO
