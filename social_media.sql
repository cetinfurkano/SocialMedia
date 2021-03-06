USE [master]
GO
/****** Object:  Database [SozlukForum]    Script Date: 17.04.2021 13:49:12 ******/
CREATE DATABASE [SozlukForum]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SozlukForum', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SozlukForum.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SozlukForum_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SozlukForum_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SozlukForum] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SozlukForum].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SozlukForum] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SozlukForum] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SozlukForum] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SozlukForum] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SozlukForum] SET ARITHABORT OFF 
GO
ALTER DATABASE [SozlukForum] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SozlukForum] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SozlukForum] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SozlukForum] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SozlukForum] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SozlukForum] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SozlukForum] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SozlukForum] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SozlukForum] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SozlukForum] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SozlukForum] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SozlukForum] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SozlukForum] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SozlukForum] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SozlukForum] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SozlukForum] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SozlukForum] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SozlukForum] SET RECOVERY FULL 
GO
ALTER DATABASE [SozlukForum] SET  MULTI_USER 
GO
ALTER DATABASE [SozlukForum] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SozlukForum] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SozlukForum] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SozlukForum] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SozlukForum] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SozlukForum] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SozlukForum', N'ON'
GO
ALTER DATABASE [SozlukForum] SET QUERY_STORE = OFF
GO
USE [SozlukForum]
GO
/****** Object:  Table [dbo].[BlokBilgileri]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlokBilgileri](
	[BlokBilgiId] [int] IDENTITY(1,1) NOT NULL,
	[BlokPaylasimId] [int] NOT NULL,
	[KullaniciId] [int] NOT NULL,
 CONSTRAINT [PK_BlokBilgileri] PRIMARY KEY CLUSTERED 
(
	[BlokBilgiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BloklananPaylasimlar]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloklananPaylasimlar](
	[BlokPaylasimId] [int] IDENTITY(1,1) NOT NULL,
	[PaylasimId] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_BlokPaylasimlar] PRIMARY KEY CLUSTERED 
(
	[BlokPaylasimId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EtkilesimDislike]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EtkilesimDislike](
	[EtkilesimId] [int] NOT NULL,
	[BegenmeyenKullaniciId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etkilesimler]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etkilesimler](
	[EtkilesimId] [int] IDENTITY(1,1) NOT NULL,
	[PaylasimId] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Etkilesimler_1] PRIMARY KEY CLUSTERED 
(
	[EtkilesimId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EtkilesimLike]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EtkilesimLike](
	[EtkilesimId] [int] NOT NULL,
	[BegenenKullaniciId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[KategoriId] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAdi] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[KategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[KullaniciId] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](50) NOT NULL,
	[Soyad] [nvarchar](50) NOT NULL,
	[KullaniciAdi] [nvarchar](50) NOT NULL,
	[Eposta] [nvarchar](50) NOT NULL,
	[Parola] [nvarchar](8) NOT NULL,
	[Yetki] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_Kullanicilar] PRIMARY KEY CLUSTERED 
(
	[KullaniciId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paylasimlar]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paylasimlar](
	[PaylasimId] [nvarchar](100) NOT NULL,
	[KategoriId] [int] NOT NULL,
	[KullaniciId] [int] NOT NULL,
	[PaylasimTipi] [int] NOT NULL,
	[GirilmeZamani] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PaylasimId] PRIMARY KEY CLUSTERED 
(
	[PaylasimId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaylasimMetinleri]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaylasimMetinleri](
	[PaylasimId] [nvarchar](100) NOT NULL,
	[GirilenMetin] [ntext] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaylasimResimleri]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaylasimResimleri](
	[ResimId] [int] NOT NULL,
	[PaylasimId] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfilResimleri]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfilResimleri](
	[ResimId] [int] NOT NULL,
	[KullaniciId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RaporBilgileri]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RaporBilgileri](
	[RaporBilgiId] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciId] [int] NOT NULL,
	[RaporId] [int] NOT NULL,
 CONSTRAINT [PK_RaporBilgileri] PRIMARY KEY CLUSTERED 
(
	[RaporBilgiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RaporlananPaylasimlar]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RaporlananPaylasimlar](
	[RaporId] [int] IDENTITY(1,1) NOT NULL,
	[PaylasimId] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_RaporlananPaylasimlar] PRIMARY KEY CLUSTERED 
(
	[RaporId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resimler]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resimler](
	[ResimId] [int] IDENTITY(1,1) NOT NULL,
	[ResimYolu] [nvarchar](max) NOT NULL,
	[ResimAdi] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Resimler] PRIMARY KEY CLUSTERED 
(
	[ResimId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TakipEdenler]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TakipEdenler](
	[TakipEtId] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciId] [int] NOT NULL,
 CONSTRAINT [PK_TakipEdenler] PRIMARY KEY CLUSTERED 
(
	[TakipEtId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TakipEdilenBilgileri]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TakipEdilenBilgileri](
	[TakipEdilenBilgiId] [int] IDENTITY(1,1) NOT NULL,
	[TakipEdilenId] [int] NOT NULL,
	[KullaniciId] [int] NOT NULL,
 CONSTRAINT [PK_TakipEdilenBilgileri] PRIMARY KEY CLUSTERED 
(
	[TakipEdilenBilgiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TakipEdilenler]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TakipEdilenler](
	[TakipEdilenId] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciId] [int] NOT NULL,
 CONSTRAINT [PK_TakipEdilenler] PRIMARY KEY CLUSTERED 
(
	[TakipEdilenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TakipEtmeBilgileri]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TakipEtmeBilgileri](
	[TakipEtBilgiId] [int] IDENTITY(1,1) NOT NULL,
	[TakipEtId] [int] NOT NULL,
	[KullaniciId] [int] NOT NULL,
 CONSTRAINT [PK_TakipEtmeBilgileri] PRIMARY KEY CLUSTERED 
(
	[TakipEtBilgiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yorumlar]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yorumlar](
	[YorumId] [nvarchar](100) NOT NULL,
	[EtkilesimId] [int] NOT NULL,
	[KullaniciId] [int] NOT NULL,
	[YorumTipi] [int] NOT NULL,
	[YapilmaZamani] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Yorumlar] PRIMARY KEY CLUSTERED 
(
	[YorumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YorumMetinleri]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YorumMetinleri](
	[YorumId] [nvarchar](100) NOT NULL,
	[YorumMetni] [ntext] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YorumResimleri]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YorumResimleri](
	[ResimId] [int] NOT NULL,
	[YorumId] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Kullanicilar] ADD  CONSTRAINT [cd_default]  DEFAULT ('False') FOR [Yetki]
GO
ALTER TABLE [dbo].[BlokBilgileri]  WITH CHECK ADD  CONSTRAINT [fk_BlokKullanici] FOREIGN KEY([KullaniciId])
REFERENCES [dbo].[Kullanicilar] ([KullaniciId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlokBilgileri] CHECK CONSTRAINT [fk_BlokKullanici]
GO
ALTER TABLE [dbo].[BlokBilgileri]  WITH CHECK ADD  CONSTRAINT [fk_BlokPaylasim] FOREIGN KEY([BlokPaylasimId])
REFERENCES [dbo].[BloklananPaylasimlar] ([BlokPaylasimId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlokBilgileri] CHECK CONSTRAINT [fk_BlokPaylasim]
GO
ALTER TABLE [dbo].[BloklananPaylasimlar]  WITH CHECK ADD  CONSTRAINT [fk_PaylasimBlok] FOREIGN KEY([PaylasimId])
REFERENCES [dbo].[Paylasimlar] ([PaylasimId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BloklananPaylasimlar] CHECK CONSTRAINT [fk_PaylasimBlok]
GO
ALTER TABLE [dbo].[EtkilesimDislike]  WITH CHECK ADD  CONSTRAINT [fk_EtkiDislikeKullanici] FOREIGN KEY([BegenmeyenKullaniciId])
REFERENCES [dbo].[Kullanicilar] ([KullaniciId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EtkilesimDislike] CHECK CONSTRAINT [fk_EtkiDislikeKullanici]
GO
ALTER TABLE [dbo].[EtkilesimDislike]  WITH CHECK ADD  CONSTRAINT [fk_EtkilesimDislike] FOREIGN KEY([EtkilesimId])
REFERENCES [dbo].[Etkilesimler] ([EtkilesimId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EtkilesimDislike] CHECK CONSTRAINT [fk_EtkilesimDislike]
GO
ALTER TABLE [dbo].[Etkilesimler]  WITH CHECK ADD  CONSTRAINT [fk_EtkilesimEntry] FOREIGN KEY([PaylasimId])
REFERENCES [dbo].[Paylasimlar] ([PaylasimId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Etkilesimler] CHECK CONSTRAINT [fk_EtkilesimEntry]
GO
ALTER TABLE [dbo].[EtkilesimLike]  WITH CHECK ADD  CONSTRAINT [fk_EtkiBegeniKullanici] FOREIGN KEY([BegenenKullaniciId])
REFERENCES [dbo].[Kullanicilar] ([KullaniciId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EtkilesimLike] CHECK CONSTRAINT [fk_EtkiBegeniKullanici]
GO
ALTER TABLE [dbo].[EtkilesimLike]  WITH CHECK ADD  CONSTRAINT [fk_EtkilesimLike] FOREIGN KEY([EtkilesimId])
REFERENCES [dbo].[Etkilesimler] ([EtkilesimId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EtkilesimLike] CHECK CONSTRAINT [fk_EtkilesimLike]
GO
ALTER TABLE [dbo].[Paylasimlar]  WITH CHECK ADD  CONSTRAINT [fk_KategoriPaylasim] FOREIGN KEY([KategoriId])
REFERENCES [dbo].[Kategoriler] ([KategoriId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Paylasimlar] CHECK CONSTRAINT [fk_KategoriPaylasim]
GO
ALTER TABLE [dbo].[Paylasimlar]  WITH CHECK ADD  CONSTRAINT [fk_KullaniciPaylasim] FOREIGN KEY([KullaniciId])
REFERENCES [dbo].[Kullanicilar] ([KullaniciId])
GO
ALTER TABLE [dbo].[Paylasimlar] CHECK CONSTRAINT [fk_KullaniciPaylasim]
GO
ALTER TABLE [dbo].[PaylasimMetinleri]  WITH CHECK ADD  CONSTRAINT [fk_PaylasimMetni] FOREIGN KEY([PaylasimId])
REFERENCES [dbo].[Paylasimlar] ([PaylasimId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PaylasimMetinleri] CHECK CONSTRAINT [fk_PaylasimMetni]
GO
ALTER TABLE [dbo].[PaylasimResimleri]  WITH CHECK ADD  CONSTRAINT [fk_EntryResmi] FOREIGN KEY([PaylasimId])
REFERENCES [dbo].[Paylasimlar] ([PaylasimId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PaylasimResimleri] CHECK CONSTRAINT [fk_EntryResmi]
GO
ALTER TABLE [dbo].[PaylasimResimleri]  WITH CHECK ADD  CONSTRAINT [fk_ResimId] FOREIGN KEY([ResimId])
REFERENCES [dbo].[Resimler] ([ResimId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PaylasimResimleri] CHECK CONSTRAINT [fk_ResimId]
GO
ALTER TABLE [dbo].[ProfilResimleri]  WITH CHECK ADD  CONSTRAINT [fk_ProfilKullanici] FOREIGN KEY([KullaniciId])
REFERENCES [dbo].[Kullanicilar] ([KullaniciId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProfilResimleri] CHECK CONSTRAINT [fk_ProfilKullanici]
GO
ALTER TABLE [dbo].[ProfilResimleri]  WITH CHECK ADD  CONSTRAINT [fk_ProfilResim] FOREIGN KEY([ResimId])
REFERENCES [dbo].[Resimler] ([ResimId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProfilResimleri] CHECK CONSTRAINT [fk_ProfilResim]
GO
ALTER TABLE [dbo].[RaporBilgileri]  WITH CHECK ADD  CONSTRAINT [fk_RaporBilgiId] FOREIGN KEY([RaporId])
REFERENCES [dbo].[RaporlananPaylasimlar] ([RaporId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RaporBilgileri] CHECK CONSTRAINT [fk_RaporBilgiId]
GO
ALTER TABLE [dbo].[RaporBilgileri]  WITH CHECK ADD  CONSTRAINT [fk_RaporBilgiKullanici] FOREIGN KEY([KullaniciId])
REFERENCES [dbo].[Kullanicilar] ([KullaniciId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RaporBilgileri] CHECK CONSTRAINT [fk_RaporBilgiKullanici]
GO
ALTER TABLE [dbo].[RaporlananPaylasimlar]  WITH CHECK ADD  CONSTRAINT [fk_PaylasimRapor] FOREIGN KEY([PaylasimId])
REFERENCES [dbo].[Paylasimlar] ([PaylasimId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RaporlananPaylasimlar] CHECK CONSTRAINT [fk_PaylasimRapor]
GO
ALTER TABLE [dbo].[TakipEdenler]  WITH CHECK ADD  CONSTRAINT [fk_KullaniciTakipEt] FOREIGN KEY([KullaniciId])
REFERENCES [dbo].[Kullanicilar] ([KullaniciId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TakipEdenler] CHECK CONSTRAINT [fk_KullaniciTakipEt]
GO
ALTER TABLE [dbo].[TakipEdilenBilgileri]  WITH CHECK ADD  CONSTRAINT [fk_TakipEdilenBilgi] FOREIGN KEY([TakipEdilenId])
REFERENCES [dbo].[TakipEdilenler] ([TakipEdilenId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TakipEdilenBilgileri] CHECK CONSTRAINT [fk_TakipEdilenBilgi]
GO
ALTER TABLE [dbo].[TakipEdilenler]  WITH CHECK ADD  CONSTRAINT [fk_TakipEdilenKullanici] FOREIGN KEY([KullaniciId])
REFERENCES [dbo].[Kullanicilar] ([KullaniciId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TakipEdilenler] CHECK CONSTRAINT [fk_TakipEdilenKullanici]
GO
ALTER TABLE [dbo].[TakipEtmeBilgileri]  WITH CHECK ADD  CONSTRAINT [fk_TakipEtBilgi] FOREIGN KEY([TakipEtId])
REFERENCES [dbo].[TakipEdenler] ([TakipEtId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TakipEtmeBilgileri] CHECK CONSTRAINT [fk_TakipEtBilgi]
GO
ALTER TABLE [dbo].[Yorumlar]  WITH CHECK ADD  CONSTRAINT [fk_KullaniciYorum] FOREIGN KEY([KullaniciId])
REFERENCES [dbo].[Kullanicilar] ([KullaniciId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Yorumlar] CHECK CONSTRAINT [fk_KullaniciYorum]
GO
ALTER TABLE [dbo].[Yorumlar]  WITH CHECK ADD  CONSTRAINT [fk_YorumEtkilesim] FOREIGN KEY([EtkilesimId])
REFERENCES [dbo].[Etkilesimler] ([EtkilesimId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Yorumlar] CHECK CONSTRAINT [fk_YorumEtkilesim]
GO
ALTER TABLE [dbo].[YorumMetinleri]  WITH CHECK ADD  CONSTRAINT [fk_YorumIdMetin] FOREIGN KEY([YorumId])
REFERENCES [dbo].[Yorumlar] ([YorumId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[YorumMetinleri] CHECK CONSTRAINT [fk_YorumIdMetin]
GO
ALTER TABLE [dbo].[YorumResimleri]  WITH CHECK ADD  CONSTRAINT [fk_ResimYorumId] FOREIGN KEY([ResimId])
REFERENCES [dbo].[Resimler] ([ResimId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[YorumResimleri] CHECK CONSTRAINT [fk_ResimYorumId]
GO
ALTER TABLE [dbo].[YorumResimleri]  WITH CHECK ADD  CONSTRAINT [fk_YorumResim] FOREIGN KEY([YorumId])
REFERENCES [dbo].[Yorumlar] ([YorumId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[YorumResimleri] CHECK CONSTRAINT [fk_YorumResim]
GO
/****** Object:  StoredProcedure [dbo].[sp_EtkilesimDislikeEkle]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_EtkilesimDislikeEkle]
(
	@PaylasimId nvarchar(100),
	@dislikeAtanKullanici int
)
as
declare @EtkilesimId int
if exists(select *  from Etkilesimler where PaylasimId = @PaylasimId)
begin
	select @EtkilesimId = EtkilesimId from Etkilesimler where PaylasimId = @PaylasimId
	if not exists(select * from EtkilesimDislike where EtkilesimId = @EtkilesimId and BegenmeyenKullaniciId = @dislikeAtanKullanici)
	begin
		insert EtkilesimDislike values(@EtkilesimId, @dislikeAtanKullanici)
	end
end
else
begin
	 insert Etkilesimler values(@PaylasimId)
	 select @EtkilesimId = EtkilesimId from Etkilesimler where PaylasimId = @PaylasimId
	 insert EtkilesimDislike values(@EtkilesimId, @dislikeAtanKullanici)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EtkilesimDislikeIstekGetir]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_EtkilesimDislikeIstekGetir]
(
	@PaylasimId nvarchar(100)
)
as
select ed.EtkilesimId, ed.BegenmeyenKullaniciId, e.PaylasimId from EtkilesimDislike ed inner join Etkilesimler e on e.EtkilesimId = ed.EtkilesimId where e.PaylasimId = @PaylasimId
GO
/****** Object:  StoredProcedure [dbo].[sp_EtkilesimDislikeSil]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_EtkilesimDislikeSil]
(
	@dislikeKaldıranKullanici int,
	@PaylasimId nvarchar(100)
)
as
declare @etkilesimId int
select @etkilesimId = EtkilesimId from Etkilesimler where PaylasimId = @PaylasimId
delete from EtkilesimDislike where BegenmeyenKullaniciId = @dislikeKaldıranKullanici and EtkilesimId = @etkilesimId
if not exists(select * from EtkilesimDislike where EtkilesimId = @etkilesimId) and 
not exists(select * from EtkilesimLike where EtkilesimId = @etkilesimId) and not exists(select * from Yorumlar where EtkilesimId = @etkilesimId)
begin
	delete from Etkilesimler where EtkilesimId = @etkilesimId
end















GO
/****** Object:  StoredProcedure [dbo].[sp_EtkilesimLikeEkle]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_EtkilesimLikeEkle]
(
	@PaylasimId nvarchar(100),
	@BegenenKullaniciId int

)
as
declare @EtkilesimId int
if exists(select *  from Etkilesimler where PaylasimId = @PaylasimId)
begin
	select @EtkilesimId = EtkilesimId from Etkilesimler where PaylasimId = @PaylasimId
	if not exists(select * from EtkilesimLike where EtkilesimId = @EtkilesimId and BegenenKullaniciId = @BegenenKullaniciId)
	begin
		insert EtkilesimLike values(@EtkilesimId, @BegenenKullaniciId)
	end
end
else
begin
	 insert Etkilesimler values(@PaylasimId)
	 select @EtkilesimId = EtkilesimId from Etkilesimler where PaylasimId = @PaylasimId
	 insert EtkilesimLike values(@EtkilesimId, @BegenenKullaniciId)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EtkilesimLikeIstekGetir]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_EtkilesimLikeIstekGetir]
(
	@PaylasimId nvarchar(100)
)
as
select el.EtkilesimId, el.BegenenKullaniciId, e.PaylasimId from EtkilesimLike el inner join Etkilesimler e on e.EtkilesimId = el.EtkilesimId where e.PaylasimId = @PaylasimId
GO
/****** Object:  StoredProcedure [dbo].[sp_EtkilesimLikeSil]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_EtkilesimLikeSil]
(
	@begeniyiKaldiranKullanici int,
	@PaylasimId nvarchar(100)
)
as
declare @etkilesimId int
select @etkilesimId = EtkilesimId from Etkilesimler where PaylasimId = @PaylasimId
delete from EtkilesimLike where BegenenKullaniciId = @begeniyiKaldiranKullanici and EtkilesimId = @etkilesimId
if not exists(select * from EtkilesimDislike where EtkilesimId = @etkilesimId) and 
not exists(select * from EtkilesimLike where EtkilesimId = @etkilesimId) and not exists(select * from Yorumlar where EtkilesimId = @etkilesimId)
begin
	delete from Etkilesimler where EtkilesimId = @etkilesimId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_PaylasiminRaporSayisi]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_PaylasiminRaporSayisi]
(
	@PaylasimId nvarchar(100)
)
as
select COUNT(rb.RaporId) Sayi from RaporlananPaylasimlar rp inner join RaporBilgileri rb on rb.RaporId = rp.RaporId where rp.PaylasimId = @PaylasimId 
GO
/****** Object:  StoredProcedure [dbo].[sp_PaylasimMetniEkle]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_PaylasimMetniEkle]
(
	@PaylasimId nvarchar(100),
	@KategoriId int,
	@KullaniciId int,
	@GirilenMetin ntext,
	@GirilmeZamani nvarchar(50)
)
as
if not exists(select * from Paylasimlar where PaylasimId = @PaylasimId)
begin
	insert Paylasimlar values(@PaylasimId, @KategoriId, @KullaniciId,1,@GirilmeZamani)
	insert PaylasimMetinleri values (@PaylasimId, @GirilenMetin)
end
else
begin
update Paylasimlar set PaylasimTipi = 3 where PaylasimId = @PaylasimId
insert PaylasimMetinleri values (@PaylasimId, @GirilenMetin)
end


GO
/****** Object:  StoredProcedure [dbo].[sp_PaylasimMetniGuncelle]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_PaylasimMetniGuncelle]
(
	@PaylasimId nvarchar(100),
	@GuncellenecekMetin ntext
)
as
update PaylasimMetinleri set GirilenMetin = @GuncellenecekMetin where PaylasimId = @PaylasimId
GO
/****** Object:  StoredProcedure [dbo].[sp_PaylasimMetniHepsiniGetir]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_PaylasimMetniHepsiniGetir]
as
select p.PaylasimId,p.KategoriId,p.KullaniciId,pm.GirilenMetin,p.GirilmeZamani from Paylasimlar p inner join PaylasimMetinleri pm on p.PaylasimId = pm.PaylasimId
GO
/****** Object:  StoredProcedure [dbo].[sp_PaylasimMetniIstekGetir]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_PaylasimMetniIstekGetir]
(
	@PaylasimId nvarchar(100)
)
as
select p.PaylasimId,p.KategoriId,p.KullaniciId,pm.GirilenMetin,p.GirilmeZamani from Paylasimlar p inner join PaylasimMetinleri pm on p.PaylasimId = pm.PaylasimId where p.PaylasimId = @PaylasimId
GO
/****** Object:  StoredProcedure [dbo].[sp_PaylasimMetniSil]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_PaylasimMetniSil]
(
	@PaylasimId nvarchar(50)
)
as
delete from PaylasimMetinleri where PaylasimId = @PaylasimId
if not exists(select * from PaylasimResimleri where PaylasimId = @PaylasimId) and not exists(select * from PaylasimMetinleri where PaylasimId = @PaylasimId)
begin
	delete from Paylasimlar where PaylasimId = @PaylasimId
end
else
begin
	update Paylasimlar set PaylasimTipi = 2 where PaylasimId = @PaylasimId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_PaylasimResmiEkle]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_PaylasimResmiEkle]
(
	@ResimAdi nvarchar(max), 
	@ResimYolu nvarchar(max),
	@PaylasimId nvarchar(100),
	@KategoriId int,
	@KullaniciId int,
	@GirilmeZamani nvarchar(50)

)
as
declare @ResimId int
insert Resimler values(@ResimYolu, @ResimAdi)
select @ResimId = ResimId from Resimler where ResimAdi = @ResimAdi
if not exists(select * from Paylasimlar where PaylasimId = @PaylasimId)
begin
	insert Paylasimlar values(@PaylasimId, @KategoriId, @KullaniciId,2,@GirilmeZamani)
	insert PaylasimResimleri values (@ResimId, @PaylasimId)
end
else
begin
update Paylasimlar set PaylasimTipi = 3 where PaylasimId = @PaylasimId
insert PaylasimResimleri values (@ResimId, @PaylasimId)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_PaylasimResmiGuncelle]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_PaylasimResmiGuncelle]
(
	@ResimId int,
	@ResimYolu nvarchar(max)
)
as
update Resimler set ResimYolu = @ResimYolu where ResimId = @ResimId
GO
/****** Object:  StoredProcedure [dbo].[sp_PaylasimResmiHepsiniGetir]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_PaylasimResmiHepsiniGetir]
as
select pr.PaylasimId,pr.ResimId,p.KategoriId,p.KullaniciId,p.GirilmeZamani from PaylasimResimleri pr inner join Paylasimlar p on p.PaylasimId = pr.PaylasimId 
GO
/****** Object:  StoredProcedure [dbo].[sp_PaylasimResmiIstekGetir]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_PaylasimResmiIstekGetir]
(
	@PaylasimId nvarchar(100)
)
as
select pr.PaylasimId,pr.ResimId,p.KategoriId,p.KullaniciId,p.GirilmeZamani from PaylasimResimleri pr inner join Paylasimlar p on p.PaylasimId = pr.PaylasimId where pr.PaylasimId = @PaylasimId
GO
/****** Object:  StoredProcedure [dbo].[sp_PaylasimResmiSil]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_PaylasimResmiSil]
(
	@ResimId int
)
as
declare @PaylasimId nvarchar(100)
select @PaylasimId = PaylasimId from PaylasimResimleri where ResimId = @ResimId
delete from Resimler where ResimId = @ResimId
if not exists(select * from PaylasimResimleri where PaylasimId = @PaylasimId) and not exists(select * from PaylasimMetinleri where PaylasimId = @PaylasimId)
begin
	delete from Paylasimlar where PaylasimId = @PaylasimId
end
else if exists(select * from PaylasimResimleri where PaylasimId = @PaylasimId) and not exists(select * from PaylasimMetinleri where PaylasimId = @PaylasimId)
begin
	update Paylasimlar set PaylasimTipi = 2 where PaylasimId = @PaylasimId
end


GO
/****** Object:  StoredProcedure [dbo].[sp_ProfilResmiEkle]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ProfilResmiEkle]
(
	@ResimAdi nvarchar(max), 
	@ResimYolu nvarchar(max),
	@KullaniciId int
	
)
as
declare @ResimId int
insert Resimler values(@ResimYolu, @ResimAdi)
select @ResimId = ResimId from Resimler where ResimAdi = @ResimAdi
insert ProfilResimleri values(@ResimId, @KullaniciId)
GO
/****** Object:  StoredProcedure [dbo].[sp_ProfilResmiGuncelle]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ProfilResmiGuncelle]
(
	@ResimId int,
	@ResimYolu nvarchar(max)
)
as
update Resimler set ResimYolu = @ResimYolu where ResimId = @ResimId
GO
/****** Object:  StoredProcedure [dbo].[sp_ProfilResmiHepsiniGetir]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ProfilResmiHepsiniGetir]
as
select r.ResimId,r.ResimYolu,r.ResimAdi, pr.KullaniciId from Resimler r inner join ProfilResimleri pr on pr.ResimId = r.ResimId 
GO
/****** Object:  StoredProcedure [dbo].[sp_ProfilResmiIstekGetir]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ProfilResmiIstekGetir]
(
	@KullaniciId int
)
as
select r.ResimId, r.ResimAdi,r.ResimYolu,pr.KullaniciId from Resimler r inner join ProfilResimleri pr on pr.ResimId = r.ResimId where pr.KullaniciId = @KullaniciId
 
GO
/****** Object:  StoredProcedure [dbo].[sp_ProfilResmiSil]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ProfilResmiSil]
(
	@id int
)
as
delete from Resimler where ResimId = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_TakipEdil]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_TakipEdil]
(
	@takipEdilen int,
	@kimTarafindan int
)
as
if Exists(Select * from TakipEdilenler where KullaniciId = @takipEdilen)
	begin
		declare @takipEdilenId int
		select @takipEdilenId = TakipEdilenId from TakipEdilenler where KullaniciId = @takipEdilen

		if not exists(select * from TakipEdilenBilgileri where KullaniciId = @kimTarafindan and TakipEdilenId = @takipEdilenId)
		begin
			insert TakipEdilenBilgileri values(@takipEdilenId, @kimTarafindan)
		end
					
	end
else
	begin
		declare @takipEdilId2 int
		insert TakipEdilenler values(@takipEdilen)
		select @takipEdilId2 = TakipEdilenId from TakipEdilenler where KullaniciId = @takipEdilen
		insert TakipEdilenBilgileri values(@takipEdilId2, @kimTarafindan)
		
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_TakipEdildenCikar]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_TakipEdildenCikar]
(
	@kimTakipEdiliyor int,
	@kimTakipEtmeyiBirakti int
)
as
if exists(select * from TakipEdilenler where KullaniciId =@kimTakipEdiliyor)
	begin
		declare @takipEdilenId int
		select @takipEdilenId = TakipEdilenId from TakipEdilenler where  KullaniciId =@kimTakipEdiliyor
		if exists(select  * from TakipEdilenBilgileri where TakipEdilenId = @takipEdilenId and KullaniciId = @kimTakipEtmeyiBirakti)
			begin
				delete from TakipEdilenBilgileri where TakipEdilenId = @takipEdilenId and KullaniciId = @kimTakipEtmeyiBirakti
			end
			if not exists(select * from TakipEdilenBilgileri where TakipEdilenId = @takipEdilenId)
			begin
				delete from TakipEdilenler where TakipEdilenId = TakipEdilenId
			end

	end
GO
/****** Object:  StoredProcedure [dbo].[sp_TakipEt]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_TakipEt]
(
	@takipEden int,
	@kimi int
)
as
if Exists(Select * from TakipEdenler where KullaniciId = @takipEden)
	begin
		declare @takipEtId int
		select @takipEtId = TakipEtId from TakipEdenler where KullaniciId = @takipEden
		
		if not exists(select * from TakipEtmeBilgileri where KullaniciId = @kimi and TakipEtId = @takipEtId)
		begin
			insert TakipEtmeBilgileri values(@takipEtId, @kimi)
			Exec sp_TakipEdil @kimi, @takipEden
			
		end
				 
	end
else
	begin
		declare @takipEtId2 int
		insert TakipEdenler values(@takipEden)
		select @takipEtId2 = TakipEtId from TakipEdenler where KullaniciId = @takipEden
		insert TakipEtmeBilgileri values(@takipEtId2, @kimi)
		Exec sp_TakipEdil @kimi, @takipEden
				 
	end
		   


GO
/****** Object:  StoredProcedure [dbo].[sp_TakiptenCikar]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_TakiptenCikar]
(
	@kimCikariyor int,
	@kimiCikariyor int
)
as
if exists(select * from TakipEdenler where KullaniciId =@kimCikariyor)
	begin
		declare @takipEtId int
		select @takipEtId = TakipEtId from TakipEdenler where  KullaniciId =@kimCikariyor
		if exists(select  * from TakipEtmeBilgileri where TakipEtId = @takipEtId and KullaniciId = @kimiCikariyor)
			begin
				delete from TakipEtmeBilgileri where TakipEtId = @TakipEtId and KullaniciId = @kimiCikariyor
				Exec sp_TakipEdildenCikar @kimiCikariyor,@kimCikariyor
			end
			if not exists(select * from TakipEtmeBilgileri where TakipEtId = @takipEtId)
			begin
				delete from TakipEdenler where TakipEtId = @takipEtId
			end

	end
GO
/****** Object:  StoredProcedure [dbo].[sp_YorumIstekGetir]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_YorumIstekGetir]
(
	@PaylasimId nvarchar(100)
)
as
select y.EtkilesimId,y.KullaniciId,y.YapilmaZamani,y.YorumId,p.PaylasimId,y.YorumTipi from Etkilesimler et inner join Paylasimlar p on p.PaylasimId = et.PaylasimId inner join Yorumlar y on y.EtkilesimId = et.EtkilesimId where et.PaylasimId = @PaylasimId
GO
/****** Object:  StoredProcedure [dbo].[sp_YorumMetniEkle]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_YorumMetniEkle]
(	
	@YorumId nvarchar(100),
	@PaylasimId nvarchar(100),
	@KullaniciId int,
	@GirilenMetin ntext,
	@YapilmaZamani nvarchar(50)
)
as
declare @etkilesimId int
if exists(select * from Etkilesimler where PaylasimId = @PaylasimId)
begin
	select @etkilesimId = EtkilesimId from Etkilesimler where PaylasimId = @PaylasimId
	if not exists( select * from Yorumlar where YorumId = @YorumId)
	begin
		insert Yorumlar values(@YorumId, @etkilesimId, @KullaniciId,1,@YapilmaZamani)
		insert YorumMetinleri values(@YorumId , @GirilenMetin)
	end
	else
	begin
		update Yorumlar set YorumTipi = 3 where YorumId = @YorumId
		insert YorumMetinleri values(@YorumId, @GirilenMetin)
	end
		
end
else
begin
	insert Etkilesimler values(@PaylasimId)
	select @etkilesimId = EtkilesimId from Etkilesimler where PaylasimId = @PaylasimId
	insert Yorumlar values(@YorumId, @etkilesimId, @KullaniciId,1,@YapilmaZamani)
	insert YorumMetinleri values(@YorumId, @GirilenMetin)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_YorumMetniGuncelle]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_YorumMetniGuncelle]
(
	@YorumId nvarchar(100),
	@GirilenMetin ntext
)
as
update YorumMetinleri set YorumMetni = @GirilenMetin where YorumId = @YorumId
GO
/****** Object:  StoredProcedure [dbo].[sp_YorumMetniHepsiniGetir]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_YorumMetniHepsiniGetir]
as
select ym.YorumId, y.KullaniciId,e.PaylasimId,ym.YorumMetni,y.YapilmaZamani from YorumMetinleri ym inner join Yorumlar y on y.YorumId = ym.YorumId inner join Etkilesimler e on e.EtkilesimId = y.EtkilesimId 
GO
/****** Object:  StoredProcedure [dbo].[sp_YorumMetniIstekGetir]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_YorumMetniIstekGetir]
(
	@YorumId nvarchar(100)
)
as
select ym.YorumId, y.KullaniciId,e.PaylasimId,ym.YorumMetni,y.YapilmaZamani from YorumMetinleri ym inner join Yorumlar y on y.YorumId = ym.YorumId inner join Etkilesimler e on e.EtkilesimId = y.EtkilesimId where ym.YorumId = @YorumId
GO
/****** Object:  StoredProcedure [dbo].[sp_YorumMetniSil]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_YorumMetniSil]
(
	@YorumId nvarchar(100)
)
as
delete from YorumMetinleri where YorumId = @YorumId
if not exists(select * from YorumMetinleri where YorumId = @YorumId) and not exists(select * from YorumResimleri where YorumId = @YorumId)
	begin
		exec sp_YorumSil @YorumId
	end
else
	begin
		update Yorumlar set YorumTipi = 2 where YorumId = @YorumId
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_YorumResmiEkle]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_YorumResmiEkle]
(
	@ResimAdi nvarchar(max), 
	@ResimYolu nvarchar(max),
	@YorumId nvarchar(100),
	@PaylasimId nvarchar(100),
	@KullaniciId int,
	@YapilmaZamani nvarchar(50)
)
as
declare @ResimId int, @etkilesimId int
insert Resimler values(@ResimYolu, @ResimAdi)
select @ResimId = ResimId from Resimler where ResimAdi = @ResimAdi

if exists(select * from Etkilesimler where PaylasimId = @PaylasimId)
begin
	select @etkilesimId = EtkilesimId from Etkilesimler where PaylasimId = @PaylasimId
	if not exists( select * from Yorumlar where YorumId = @YorumId)
	begin
		insert Yorumlar values(@YorumId, @etkilesimId, @KullaniciId,2,@YapilmaZamani)
		insert YorumResimleri values(@YorumId , @ResimId)
	end
	else
	begin
		update Yorumlar set YorumTipi = 3 where YorumId = @YorumId
		insert YorumResimleri values(@YorumId, @ResimId)
	end
		
end
else
begin
	insert Etkilesimler values(@PaylasimId)
	select @etkilesimId = EtkilesimId from Etkilesimler where PaylasimId = @PaylasimId
	insert Yorumlar values(@YorumId, @etkilesimId, @KullaniciId,2,@YapilmaZamani)
	insert YorumResimleri values(@ResimId , @YorumId)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_YorumResmiGuncelle]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_YorumResmiGuncelle]
(
	@ResimId int,
	@ResimYolu nvarchar(max)
)
as
update Resimler set ResimYolu = @ResimYolu where ResimId = @ResimId
GO
/****** Object:  StoredProcedure [dbo].[sp_YorumResmiHepsiniGetir]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_YorumResmiHepsiniGetir]
as
select yr.YorumId, y.KullaniciId,e.PaylasimId,yr.ResimId,y.YapilmaZamani from YorumResimleri yr inner join Yorumlar y on y.YorumId = yr.YorumId inner join Etkilesimler e on e.EtkilesimId = y.EtkilesimId
GO
/****** Object:  StoredProcedure [dbo].[sp_YorumResmiIstekGetir]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_YorumResmiIstekGetir]
(
	@YorumId nvarchar(100)
)
as
select yr.YorumId, y.KullaniciId,e.PaylasimId,yr.ResimId,y.YapilmaZamani from YorumResimleri yr inner join Yorumlar y on y.YorumId = yr.YorumId inner join Etkilesimler e on e.EtkilesimId = y.EtkilesimId where yr.YorumId = @YorumId
GO
/****** Object:  StoredProcedure [dbo].[sp_YorumResmiSil]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_YorumResmiSil]
(
	@id int
)
as
declare @YorumId nvarchar(100)
select @YorumId = YorumId from YorumResimleri where ResimId = @id
delete from Resimler where ResimId = @id
if not exists(select * from YorumMetinleri where YorumId = @YorumId) and not exists(select * from YorumResimleri where YorumId = @YorumId)
	exec sp_YorumSil @YorumId

else if exists(select * from YorumResimleri where YorumId = @YorumId) and not exists(select * from YorumMetinleri where YorumId = @YorumId)
begin
	update Yorumlar set YorumTipi = 2 where YorumId = @YorumId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_YorumSil]    Script Date: 17.04.2021 13:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_YorumSil]
(
	@YorumId nvarchar(100)
)
as
declare @EtkilesimId int
select @EtkilesimId = EtkilesimId from Yorumlar where YorumId = @YorumId
delete from Yorumlar where YorumId = @YorumId
if not exists(select * from EtkilesimDislike where EtkilesimId = @etkilesimId) and 
not exists(select * from EtkilesimLike where EtkilesimId = @etkilesimId) and not exists(select * from Yorumlar where EtkilesimId = @etkilesimId)
begin
	delete from Etkilesimler where EtkilesimId = @etkilesimId
end
GO
USE [master]
GO
ALTER DATABASE [SozlukForum] SET  READ_WRITE 
GO
