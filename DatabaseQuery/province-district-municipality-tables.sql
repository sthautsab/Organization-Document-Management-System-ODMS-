
GO
/****** Object:  Table [dbo].[tbl_AllDistrict]    Script Date: 5/21/2023 12:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_AllDistrict](
	[DID] [int] IDENTITY(1,1) NOT NULL,
	[District] [nvarchar](150) NOT NULL,
	[Lat] [nvarchar](20) NULL,
	[Lang] [nvarchar](20) NULL,
 CONSTRAINT [PK_tbl_AllDistrict] PRIMARY KEY CLUSTERED 
(
	[DID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DistrictList]    Script Date: 5/21/2023 12:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DistrictList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DId] [int] NOT NULL,
	[District] [nvarchar](100) NOT NULL,
	[StateId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_StateList]    Script Date: 5/21/2023 12:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_StateList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](100) NOT NULL,
	[StateId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Vdc]    Script Date: 5/21/2023 12:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Vdc](
	[VdcID] [int] IDENTITY(1,1) NOT NULL,
	[DistrictID] [int] NOT NULL,
	[Name] [varchar](254) NOT NULL,
	[Code] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[VdcID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_AllDistrict] ON 
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (1, N'Bhaktapur', N'27.6833', N'85.4167')
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (2, N'Dhading', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (3, N'Kathmandu', N'27.7167', N'85.3167')
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (4, N'Kavrepalanchok', N'48.21', N'16.37')
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (5, N'Lalitpur', N'27.5833', N'85.3333')
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (6, N'Nuwakot', N'27.9167', N'85.25')
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (7, N'Rasuwa', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (8, N'Sindhupalchok', N'27.65', N'85.7')
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (9, N'Banke', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (10, N'Bardiya', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (11, N'Dailekh', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (12, N'Jajarkot', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (13, N'Surkhet', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (14, N'Baglung', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (15, N'Mustang', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (16, N'Myagdi', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (17, N'Parbat', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (18, N'Gorkha', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (19, N'Kaski', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (20, N'Lamjung', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (21, N'Manang', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (22, N'Syangja', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (23, N'Tanahu', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (24, N'Dhanusa', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (25, N'Dolakha', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (26, N'Mahottari', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (27, N'Ramechhap', N'27.3256', N'86.0877')
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (28, N'Sarlahi ', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (29, N'Sindhuli', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (30, N'Dolpa', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (31, N'Humla', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (32, N'Jumla', N'29.2747', N'82.1838')
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (33, N'Kalikot', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (34, N'Mugu', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (35, N'Bhojpur', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (36, N'Dhankuta', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (37, N'Morang', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (38, N'Sankhuwasabha', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (39, N'Sunsari', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (40, N'Terhathum', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (41, N'Arghakhanchi', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (42, N'Gulmi', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (43, N'Kapilvastu', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (44, N'Nawalparasi', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (45, N'Palpa', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (46, N'Rupandehi', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (47, N'Baitadi', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (48, N'Dadeldhura', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (49, N'Darchula', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (50, N'Kanchanpur', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (51, N'Ilam', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (52, N'Jhapa', N'26.544', N'88.0944')
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (53, N'Panchthar', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (54, N'Taplejung', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (55, N'Bara', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (56, N'Chitwan', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (57, N'Makwanpur', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (58, N'Parsa', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (59, N'Rautahat', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (60, N'Dang Deokhuri', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (61, N'Pyuthan', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (62, N'Rolpa', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (63, N'Rukum', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (64, N'Salyan', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (65, N'Khotang', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (66, N'Okhaldhunga', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (67, N'Saptari', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (68, N'Siraha', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (69, N'Solukhumbu', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (70, N'Udayapur', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (71, N'Achham', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (72, N'Bajhang', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (73, N'Bajura', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (74, N'Doti', NULL, NULL)
GO
INSERT [dbo].[tbl_AllDistrict] ([DID], [District], [Lat], [Lang]) VALUES (75, N'Kailali', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[tbl_AllDistrict] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_DistrictList] ON 
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (1, 8, N'Terhathum  ', 1)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (2, 7, N'Dhankuta  ', 1)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (3, 12, N'Okhaldhunga  ', 1)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (4, 2, N'Panchthar  ', 1)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (5, 6, N'Sunsari  ', 1)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (6, 10, N'Bhojpur  ', 1)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (7, 13, N'Khotang  ', 1)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (8, 4, N'Jhapa  ', 1)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (9, 3, N'Ilam  ', 1)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (10, 5, N'Morang  ', 1)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (11, 14, N'Udayapur  ', 1)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (12, 11, N'Solukhumbu  ', 1)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (13, 9, N'Sankhuwasabha  ', 1)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (14, 1, N'Taplejung  ', 1)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (15, 15, N'Saptari  ', 2)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (16, 16, N'Siraha  ', 2)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (17, 17, N'Dhanusa  ', 2)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (18, 18, N'Mahottari  ', 2)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (19, 19, N'Sarlahi  ', 2)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (20, 33, N'Bara  ', 2)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (21, 34, N'Parsa  ', 2)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (22, 32, N'Rautahat  ', 2)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (23, 20, N'Sindhuli  ', 3)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (24, 21, N'Ramechhap  ', 3)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (25, 22, N'Dolakha  ', 3)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (26, 26, N'Bhaktapur  ', 3)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (27, 30, N'Dhading  ', 3)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (28, 27, N'Kathmandu  ', 3)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (29, 24, N'Kavrepalanchok  ', 3)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (30, 25, N'Lalitpur  ', 3)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (31, 28, N'Nuwakot  ', 3)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (32, 29, N'Rasuwa  ', 3)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (33, 23, N'Sindhupalchok  ', 3)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (34, 35, N'Chitwan  ', 3)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (35, 31, N'Makwanpur  ', 3)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (36, 45, N'Baglung  ', 4)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (37, 36, N'Gorkha  ', 4)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (38, 40, N'Kaski  ', 4)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (39, 37, N'Lamjung  ', 4)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (40, 41, N'Manang  ', 4)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (41, 42, N'Mustang  ', 4)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (42, 43, N'Myagdi  ', 4)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (43, 76, N'Nawalpur  ', 4)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (44, 44, N'Parbat  ', 4)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (45, 39, N'Syangja  ', 4)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (46, 38, N'Tanahun  ', 4)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (47, 50, N'Kapilvastu  ', 5)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (48, 48, N'NawalParasi', 5)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (49, 49, N'Rupandehi  ', 5)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (50, 51, N'Arghakhanchi  ', 5)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (51, 46, N'Gulmi  ', 5)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (52, 47, N'Palpa  ', 5)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (53, 56, N'Dang Deukhuri  ', 5)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (54, 52, N'Pyuthan  ', 5)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (55, 53, N'Rolpa  ', 5)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (56, 54, N'Eastern Rukum  ', 5)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (57, 57, N'Banke  ', 5)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (58, 58, N'Bardiya  ', 5)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (59, 77, N'Western Rukum  ', 6)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (60, 55, N'Salyan  ', 6)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (61, 62, N'Dolpa  ', 6)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (62, 66, N'Humla  ', 6)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (63, 63, N'Jumla  ', 6)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (64, 64, N'Kalikot  ', 6)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (65, 65, N'Mugu  ', 6)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (66, 59, N'Surkhet  ', 6)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (67, 60, N'Dailekh  ', 6)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (68, 61, N'Jajarkot  ', 6)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (69, 71, N'Kailali  ', 7)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (70, 69, N'Achham  ', 7)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (71, 70, N'Doti  ', 7)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (72, 68, N'Bajhang  ', 7)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (73, 67, N'Bajura  ', 7)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (74, 72, N'Kanchanpur ', 7)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (75, 73, N'Dadeldhura ', 7)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (76, 74, N'Baitadi ', 7)
GO
INSERT [dbo].[tbl_DistrictList] ([Id], [DId], [District], [StateId]) VALUES (77, 75, N'Darchula ', 7)
GO
SET IDENTITY_INSERT [dbo].[tbl_DistrictList] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_StateList] ON 
GO
INSERT [dbo].[tbl_StateList] ([Id], [StateName], [StateId]) VALUES (1, N'Province 1', 1)
GO
INSERT [dbo].[tbl_StateList] ([Id], [StateName], [StateId]) VALUES (2, N'Province 2', 2)
GO
INSERT [dbo].[tbl_StateList] ([Id], [StateName], [StateId]) VALUES (3, N'Bagmati 3', 3)
GO
INSERT [dbo].[tbl_StateList] ([Id], [StateName], [StateId]) VALUES (4, N'Gandaki 4', 4)
GO
INSERT [dbo].[tbl_StateList] ([Id], [StateName], [StateId]) VALUES (5, N'Lumbini Pradesh', 5)
GO
INSERT [dbo].[tbl_StateList] ([Id], [StateName], [StateId]) VALUES (6, N'Karnali 6', 6)
GO
INSERT [dbo].[tbl_StateList] ([Id], [StateName], [StateId]) VALUES (7, N'Sudurpashchim 7', 7)
GO
SET IDENTITY_INSERT [dbo].[tbl_StateList] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Vdc] ON 
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (1, 1, N'Phungling', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (2, 1, N'Aatharai Triveni', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (3, 1, N'Sidingawa', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (4, 1, N'Phakatanglug', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (5, 1, N'Mikwa Khola', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (6, 1, N'Meringden', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (7, 1, N'Maiwa Khola', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (8, 1, N'Yangbarak', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (9, 1, N'Sirijunga', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (10, 2, N'Phidim', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (11, 2, N'Phalelung', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (12, 2, N'Palgunanda', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (13, 2, N'Hilihang', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (14, 2, N'Kummayak', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (15, 2, N'Tumbewa', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (16, 2, N'Yangbarak', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (17, 3, N'Ilam', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (18, 3, N'Deumai', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (19, 3, N'Mai', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (20, 3, N'Sryodaya', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (21, 3, N'Phakaphokthum', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (22, 3, N'Chulachuli', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (23, 3, N'Mai Jogmai', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (24, 3, N'Mangsebung', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (25, 3, N'Rong', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (26, 3, N'Sandakpur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (27, 4, N'Mechi Nagar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (28, 4, N'Damak', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (29, 4, N'Kankai', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (30, 4, N'Bhadrapur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (31, 4, N'Arjundhara', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (32, 4, N'Shiva Sataxi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (33, 4, N'Gauradaha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (34, 4, N'Birtamod', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (35, 4, N'Kamal', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (36, 4, N'Gaurigunj', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (37, 4, N'Barhadashi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (38, 4, N'Jhapa', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (39, 4, N'Budda Shanti', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (40, 4, N'Haldibari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (41, 4, N'Kanchankawai', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (42, 5, N'Biratnagar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (43, 5, N'Belbari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (44, 5, N'Letang', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (45, 5, N'Pathari-Sanishchare', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (46, 5, N'Rangeli', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (47, 5, N'Ratuwamai', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (48, 5, N'Sunbarshi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (49, 5, N'Urlabari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (50, 5, N'Sundar Haraincha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (51, 5, N'Budhi Ganga', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (52, 5, N'Dhanpalthn', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (53, 5, N'Gramthan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (54, 5, N'Jahada', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (55, 5, N'Kenepokhari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (56, 5, N'Katahari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (57, 5, N'kerabari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (58, 5, N'Miklajung', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (59, 6, N'Itahari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (60, 6, N'Dharan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (61, 6, N'Inaruwa', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (62, 6, N'Duhabi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (63, 6, N'Ramdhumi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (64, 6, N'Baraha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (65, 6, N'Dewangunj', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (66, 6, N'Koshi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (67, 6, N'Gadhi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (68, 6, N'Barju', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (69, 6, N'Bhokarha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (70, 6, N'Barinagara', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (71, 7, N'Pakhribas', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (72, 7, N'Dhankuta', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (73, 7, N'Mahalaxmi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (74, 7, N'Sanguri Gadi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (75, 7, N'Khalsa Chhintang Sahidbhuli', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (76, 7, N'Chhathat Jorpati', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (77, 7, N'Chaubise', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (78, 8, N'Myanglung', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (79, 8, N'Laligurans', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (80, 8, N'Aatharai', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (81, 8, N'Chhathar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (82, 8, N'Phedap', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (83, 8, N'Menchayayem', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (84, 9, N'Chainpur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (85, 9, N'Dharma Devi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (86, 9, N'Khadbari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (87, 9, N'Madi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (88, 9, N'Panch Khapan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (89, 9, N'Bhot Khola', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (90, 9, N'Chichila', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (91, 9, N'Makalu', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (92, 9, N'Sabhapokhari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (93, 9, N'Silingchong', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (94, 10, N'Bhojpur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (95, 10, N'Shadananda', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (96, 10, N'Tyamke Maiyum', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (97, 10, N'Ram Prasad Rai', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (98, 10, N'Arun', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (99, 10, N'Pauwa Dungama', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (100, 10, N'Salpasilichho', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (101, 10, N'Aamchok', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (102, 10, N'Hatuwa Gadhi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (103, 11, N'Solu Dudhakund', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (104, 11, N'Dodhakoshi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (105, 11, N'Khumbu Pasang Lhamu', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (106, 11, N'Dudhakaushika', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (107, 11, N'Necha Salyan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (108, 11, N'Maha Kulung', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (109, 11, N'Likhu Pike', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (110, 11, N'Sotang', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (111, 12, N'Siddi Charan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (112, 12, N'Khiji Demba', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (113, 12, N'Champadevi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (114, 12, N'Chishankhu Gadi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (115, 12, N'Mane Bhanjyang', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (116, 12, N'Molung', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (117, 12, N'Likhu', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (118, 12, N'Sunkoshi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (119, 12, N'Champadevi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (120, 12, N'Champadevi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (121, 13, N'Halesi Tuwachung', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (122, 13, N'Rupakot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (123, 13, N'Aiselukharka', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (124, 13, N'Lamidanda', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (125, 13, N'Jantedhanda', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (126, 13, N'Khotehang', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (127, 13, N'Kepilasgadhi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (128, 13, N'Diprung', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (129, 13, N'Sakela', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (130, 13, N'Barahpokhari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (131, 14, N'Katari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (132, 14, N'Chaudandi Gadhi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (133, 14, N'Triyuga', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (134, 14, N'Belka', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (135, 14, N'Udayapur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (136, 14, N'Tapli', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (137, 14, N'Rautamai', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (138, 14, N'Sunkoshi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (139, 15, N'Rajbaraj', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (140, 15, N'Kanchanrup', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (141, 15, N'Dakneshwori', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (142, 15, N'Bode Barsain', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (143, 15, N'Khadak', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (144, 15, N'Shambhunath', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (145, 15, N'Surunga', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (146, 15, N'Hanuman Nagar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (147, 15, N'Krishna Sawaran', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (148, 15, N'Chhinnamasta', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (149, 15, N'Mahadeva', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (150, 15, N'Saptkoshi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (151, 15, N'Tirhut', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (152, 15, N'Tilathi Koiladi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (153, 15, N'Rupani', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (154, 15, N'Belhi Chapani', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (155, 15, N'Bishnupura', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (156, 16, N'Lahan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (157, 16, N'Dhanagadhi Mai', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (158, 16, N'Siraha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (159, 16, N'Gol Bazaar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (160, 16, N'Mirchaiya', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (161, 16, N'Kalyanpur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (162, 16, N'Bhagawanpur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (163, 16, N'Aaurahi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (164, 16, N'Bishnupur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (165, 16, N'Sukhipur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (166, 16, N'Karjanha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (167, 16, N'Baryarpatti', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (168, 16, N'Naraha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (169, 16, N'Sakhuwanankarkatti', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (170, 16, N'Arnama', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (171, 16, N'Nawarajpur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (172, 17, N'Janakpur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (173, 17, N'Chhireshwarnath', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (174, 17, N'Ganeshman Charnath', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (175, 17, N'Dhanusadham', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (176, 17, N'Nagaraen', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (177, 17, N'Bideh', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (178, 17, N'Mithila', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (179, 17, N'Shahid Magar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (180, 17, N'Sabaila', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (181, 17, N'Kamala Siddidatri', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (182, 17, N'Janak Nandini', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (183, 17, N'Bateshwor', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (184, 17, N'Mithila Bihari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (185, 17, N'Mukhiyapatti Musaharmiya', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (186, 17, N'Laxminiya', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (187, 17, N'Hanspur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (188, 17, N'Aaurahi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (189, 18, N'Jaleshwor', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (190, 18, N'Bardibas', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (191, 18, N'Gaushala', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (192, 18, N'Ekadari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (193, 18, N'Sonama', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (194, 18, N'Samsi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (195, 18, N'Loharpatti', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (196, 18, N'Ram Gopal Pur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (197, 18, N'Mohottari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (198, 18, N'Manara', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (199, 18, N'Matihani', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (200, 18, N'Bhangaha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (201, 18, N'Balawa', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (202, 18, N'Pipara', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (203, 18, N'Aaurahi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (204, 19, N'Ishworpur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (205, 19, N'Malangawa', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (206, 19, N'Lalbandi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (207, 19, N'Haripur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (208, 19, N'Haripurwa', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (209, 19, N'Hariwan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (210, 19, N'Barahathawa', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (211, 19, N'Balara', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (212, 19, N'Godaita', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (213, 19, N'Bagamati', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (214, 19, N'Kabilasi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (215, 19, N'Chakraghatta', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (216, 19, N'Chandra Nagar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (217, 19, N'Dhana Koul', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (218, 19, N'Bramhapuri', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (219, 19, N'Ram Nagar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (220, 19, N'Bishnu', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (221, 20, N'Kamalamai', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (222, 20, N'Dudhauli', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (223, 20, N'Golanjor', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (224, 20, N'Ghyanglekh', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (225, 20, N'Teen Patan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (226, 20, N'Phikkal', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (227, 20, N'Marin', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (228, 20, N'Sunkoshi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (229, 20, N'Hariharpur Gadhi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (230, 21, N'Manthali', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (231, 21, N'Ramechhap', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (232, 21, N'Umakunda', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (233, 21, N'Khanda Devi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (234, 21, N'Gokul Ganga', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (235, 21, N'Doramba', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (236, 21, N'Likhu', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (237, 21, N'Sunapati', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (238, 22, N'Jiri', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (239, 22, N'Bhimeshwor', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (240, 22, N'Kalinchok', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (241, 22, N'Gauri Shankar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (242, 22, N'Tamakoshi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (243, 22, N'Melung', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (244, 22, N'Bigu', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (245, 22, N'Baiteshwor', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (246, 22, N'Shailung', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (247, 23, N'Chautara', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (248, 23, N'Barhabise', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (249, 23, N'Melamchi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (250, 23, N'Indrawati', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (251, 23, N'Jugal', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (252, 23, N'Pancha Pokhari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (253, 23, N'Balephi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (254, 23, N'Bhotekoshi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (255, 23, N'Lishankhu Pakhar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (256, 23, N'Sunkoshi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (257, 23, N'Helambu', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (258, 23, N'Tripura Sundari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (259, 24, N'Dhulikhel', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (260, 24, N'Banepa', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (261, 24, N'Panauti', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (262, 24, N'Panchkhal', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (263, 24, N'Namoduddha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (264, 24, N'Mandan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (265, 24, N'Khanikhola', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (266, 24, N'Chaunri Deurali', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (267, 24, N'Temal', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (268, 24, N'Bethanchok', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (269, 24, N'Bhumla', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (270, 24, N'Mahabharat', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (271, 24, N'Roshi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (272, 25, N'Lalitpur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (273, 25, N'Godawari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (274, 25, N'Mahalaxmi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (275, 25, N'Konjyosom', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (276, 25, N'Bagmati', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (277, 25, N'Mahankal', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (278, 26, N'Changunarayan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (279, 26, N'Bhaktapur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (280, 26, N'Madhyapur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (281, 26, N'Surya Binayak', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (282, 27, N'Kathmandu', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (283, 27, N'Kageswori', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (284, 27, N'Kirtipur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (285, 27, N'Gokarneshwor', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (286, 27, N'Chandragiri', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (287, 27, N'Tokha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (288, 27, N'Tarakeshwor', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (289, 27, N'Daxinkali', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (290, 27, N'Nagarjun', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (291, 27, N'Budhanilkhantha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (292, 27, N'Sankharapur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (293, 28, N'Bidur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (294, 28, N'Belkot Gadhi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (295, 28, N'Kakani', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (296, 28, N'Kispang', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (297, 28, N'Tadi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (298, 28, N'Tarkeshwor', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (299, 28, N'Dupcheshwor', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (300, 28, N'Panchakanya', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (301, 28, N'Likuh', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (302, 28, N'Meghang', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (303, 28, N'Shivpuri', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (304, 28, N'Surya Gadhi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (305, 29, N'Uttar Gaya', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (306, 29, N'Kalika', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (307, 29, N'Gosai Kunda', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (308, 29, N'Nau Kunda', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (309, 29, N'Parbati Kunda', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (310, 30, N'Dhunibesi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (311, 30, N'Nilkantha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (312, 30, N'Khaniyabas', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (313, 30, N'Gajuri', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (314, 30, N'Galchhi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (315, 30, N'Ganga Jamuna', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (316, 30, N'Jwalamukhi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (317, 30, N'Thakre', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (318, 30, N'Netrawati', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (319, 30, N'Benighat', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (320, 30, N'Rubi Valley', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (321, 30, N'Sidda Lake', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (322, 30, N'Tripura Sundari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (323, 31, N'Heatunda', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (324, 31, N'Thaha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (325, 31, N'Indra Sarobar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (326, 31, N'Kailash', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (327, 31, N'Bakaiya', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (328, 31, N'Bagmati', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (329, 31, N'Bhimphedi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (330, 31, N'Makawanpur Gadi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (331, 31, N'Manahari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (332, 31, N'Raksirang', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (333, 32, N'Chandrapur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (334, 32, N'Garuda', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (335, 32, N'Gaur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (336, 32, N'Boudhi Mai', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (337, 32, N'Brindaban', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (338, 32, N'Devahi Gonahi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (339, 32, N'Durga Bhagawati', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (340, 32, N'Gadhi Mai', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (341, 32, N'Gujara', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (342, 32, N'Katahariya', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (343, 32, N'Madhav Narayan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (344, 32, N'Moulapur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (345, 32, N'Phatuwa Bijayapur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (346, 32, N'Ish Nath', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (347, 32, N'Paroha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (348, 32, N'Rajpur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (349, 33, N'Kalaiya', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (350, 33, N'Jitpur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (351, 33, N'Kolhabi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (352, 33, N'Nijgadh', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (353, 33, N'Maha Gahdimai', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (354, 33, N'Simraun Gadh', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (355, 33, N'Adarsha Kotwal', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (356, 33, N'Karaiya Mai', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (357, 33, N'Devtaal', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (358, 33, N'PachaRouta', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (359, 33, N'Parawanipur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (360, 33, N'Prasouni', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (361, 33, N'Pheta', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (362, 33, N'Bara Gadhi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (363, 33, N'Subarna', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (364, 34, N'Birgunj', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (365, 34, N'Pokhariya', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (366, 34, N'Subarnapur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (367, 34, N'Jagarnathapur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (368, 34, N'Dhobini', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (369, 34, N'Chhipahar Mai', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (370, 34, N'Pakaha Mainpur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (371, 34, N'Bindabasini', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (372, 34, N'Bahudar Mai', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (373, 34, N'Belawa', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (374, 34, N'Parsa Gadhi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (375, 34, N'Sakhuwa Prasouni', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (376, 34, N'Paterwa Sagauli', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (377, 35, N'Bharatpur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (378, 35, N'Kalika', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (379, 35, N'Khairhani', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (380, 35, N'Madi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (381, 35, N'Ratna Nagar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (382, 35, N'Rapthi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (383, 35, N'Ichhha Kamana', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (384, 36, N'Gorkha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (385, 36, N'Palungtar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (386, 36, N'Sulikot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (387, 36, N'Siranchok', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (388, 36, N'Ajirkot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (389, 36, N'Aarughat', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (390, 36, N'Gandaki', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (391, 36, N'Chaumanubar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (392, 36, N'Dharche', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (393, 36, N'Bhimsen', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (394, 36, N'Shahid Lakhan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (395, 37, N'Besishahar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (396, 37, N'Madhya Nepal', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (397, 37, N'Rainas', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (398, 37, N'Sundarbazar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (399, 37, N'Kabahola Sothar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (400, 37, N'Dhudh Kokhari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (401, 37, N'Dordi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (402, 37, N'Marsyangdi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (403, 38, N'Bhanu', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (404, 38, N'Bhimad', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (405, 38, N'Byas', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (406, 38, N'Sukla', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (407, 38, N'Aanbu Khaireni', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (408, 38, N'Rishing', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (409, 38, N'Ghiring', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (410, 38, N'Devghat', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (411, 38, N'Myagde', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (412, 38, N'Bandipur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (413, 39, N'Galyang', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (414, 39, N'Chapakot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (415, 39, N'Putalibazar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (416, 39, N'Bhirkot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (417, 39, N'Waling', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (418, 39, N'Arjun Chaupari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (419, 39, N'Aandhi Khola', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (420, 39, N'Kali Gandaki', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (421, 39, N'Phedi Khola', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (422, 39, N'Biruwa', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (423, 39, N'Harinas', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (424, 40, N'Pokhara', N'')
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (425, 40, N'Annapurna', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (426, 40, N'Machhapuchhre', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (427, 40, N'Madi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (428, 40, N'Rupa', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (429, 41, N'Chame', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (430, 41, N'Nar Phu', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (431, 41, N'Nashong', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (432, 41, N'Nesyang', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (433, 42, N'Gharpajhong', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (434, 42, N'Thasang', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (435, 42, N'Dalome', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (436, 42, N'Lomanthang', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (437, 42, N'Barha Gaun Kuktichhetra', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (438, 43, N'Beni', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (439, 43, N'Annapurna', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (440, 43, N'Dhawalagiri', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (441, 43, N'Mangala', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (442, 43, N'Malika', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (443, 43, N'Raghu Ganga', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (444, 44, N'Kushma', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (445, 44, N'Phalebas', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (446, 44, N'Jaljala', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (447, 44, N'Painyoo', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (448, 44, N'Maha Shila', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (449, 44, N'Modi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (450, 44, N'Bihadi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (451, 45, N'Baglung', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (452, 45, N'Galkot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (453, 45, N'Jaimini', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (454, 45, N'Dhorpatan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (455, 45, N'Bareng', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (456, 45, N'Kathe Khola', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (457, 45, N'Taman Khola', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (458, 45, N'Tara Khola', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (459, 45, N'Nisi Khola', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (460, 45, N'Badi Gad', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (461, 46, N'Musikot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (462, 46, N'Resunga', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (463, 46, N'Isma', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (464, 46, N'Kali Gandaki', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (465, 46, N'Gulmi Darbar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (466, 46, N'Satyawati', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (467, 46, N'Chandrakot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (468, 46, N'Ruru', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (469, 46, N'Chhatrakot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (470, 46, N'Dhurkot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (471, 46, N'Madane', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (472, 46, N'Malika', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (473, 47, N'Rampur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (474, 47, N'Tansan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (475, 47, N'Nisdi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (476, 47, N'Purba Khola', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (477, 47, N'Rambha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (478, 47, N'Matha Gadhi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (479, 47, N'Tinau', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (480, 47, N'Bagnaskali', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (481, 47, N'Ribdikot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (482, 47, N'Raina Devi Chhahara', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (483, 48, N'Kawasoti', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (484, 48, N'Gaindakot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (485, 48, N'Devchuli', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (486, 48, N'Bardaghat', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (487, 48, N'Madhya Bindu', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (488, 48, N'Ramgram', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (489, 48, N'Sunwal', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (490, 48, N'Triveni Susta', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (491, 48, N'Palhi Nandan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (492, 48, N'Pratappur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (493, 48, N'Bungdi Kali', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (494, 48, N'Bulingtar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (495, 48, N'Binayi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (496, 48, N'Sarawal', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (497, 48, N'Hupsekot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (498, 49, N'Butwal', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (499, 49, N'Devdaha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (500, 49, N'Lumbini Sanskritik', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (501, 49, N'Siddharthanagar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (502, 49, N'Saina Maina', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (503, 49, N'Tilottama', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (504, 49, N'Gaidahawa', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (505, 49, N'Kanchan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (506, 49, N'Kotahi Mai', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (507, 49, N'Marchawari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (508, 49, N'Mayadevi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (509, 49, N'Om Satiya', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (510, 49, N'Rohini', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (511, 49, N'Sammari Mai', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (512, 49, N'Siyari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (513, 49, N'Suddodhana', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (514, 50, N'Kapilbastu', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (515, 50, N'Buddabhumi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (516, 50, N'Shivaraj', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (517, 50, N'Maharajgani', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (518, 50, N'Krishna Nagar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (519, 50, N'Banganga', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (520, 50, N'Mayadevi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (521, 50, N'Yashodhara', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (522, 50, N'Suddodhana', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (523, 50, N'Bijay Nagar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (524, 51, N'Sandhikharka', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (525, 51, N'Shit Ganga', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (526, 51, N'Bhumikasthan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (527, 51, N'Chhatra Dev', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (528, 51, N'Panini', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (529, 51, N'Malarani', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (530, 52, N'Pyuthan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (531, 52, N'Swargadwari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (532, 52, N'Gaumukhi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (533, 52, N'Mandavi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (534, 52, N'Sarumarani', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (535, 52, N'Mallarani', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (536, 52, N'Nau Bahini', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (537, 52, N'Jhimaruk', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (538, 52, N'Eairabati', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (539, 53, N'Rolpa', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (540, 53, N'Triveni', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (541, 53, N'Dui Kholi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (542, 53, N'Madi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (543, 53, N'Runti Gadhi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (544, 53, N'Lungri', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (545, 53, N'Sukidaha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (546, 53, N'Sunchhahari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (547, 53, N'Subarnawati', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (548, 53, N'Thawang', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (549, 54, N'Musikot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (550, 54, N'Chaurjahari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (551, 54, N'Aathabiskot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (552, 54, N'Putha Uttar Ganga', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (553, 54, N'Bhume', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (554, 54, N'Sisne', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (555, 54, N'Barphikot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (556, 54, N'Triveni', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (557, 54, N'Sani Bheri', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (558, 55, N'Sharada', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (559, 55, N'Bagchaur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (560, 55, N'Bangad', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (561, 55, N'Kalimati', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (562, 55, N'Triveni', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (563, 55, N'Kapurkot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (564, 55, N'Chhatreshwori', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (565, 55, N'Dhorchaur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (566, 55, N'Kumakha Malika', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (567, 55, N'Darma', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (568, 56, N'Tulsipur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (569, 56, N'Ghorahi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (570, 56, N'Lamahi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (571, 56, N'Banglachuli', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (572, 56, N'Dangi Sharan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (573, 56, N'Gadhawa', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (574, 56, N'Rajpur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (575, 56, N'Rapti', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (576, 56, N'Shanti Nagar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (577, 56, N'Babai', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (578, 57, N'Nepalgunj', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (579, 57, N'Kohalpur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (580, 57, N'Narainapur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (581, 57, N'Raptisonari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (582, 57, N'Baijanath', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (583, 57, N'Khajura', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (584, 57, N'Duduwa', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (585, 57, N'Janaki', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (586, 58, N'Gulariya', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (587, 58, N'Maduvan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (588, 58, N'Rajapur Taratal', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (589, 58, N'Thakura Baba', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (590, 58, N'Bansgadhi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (591, 58, N'Bar Bardiya', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (592, 58, N'Badhaiya Tal', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (593, 58, N'Geruwa', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (594, 59, N'Birendra Nagar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (595, 59, N'Bheri Ganga', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (596, 59, N'Gurbhakot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (597, 59, N'Panchapuri', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (598, 59, N'Lak Besi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (599, 59, N'Chaukune', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (600, 59, N'Baraha Tal', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (601, 59, N'Chingad', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (602, 59, N'Simta', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (603, 60, N'Narayani', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (604, 60, N'Dullu', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (605, 60, N'Chamunda Bindrasaini', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (606, 60, N'Aathabis', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (607, 60, N'Bhagawati Mai', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (608, 60, N'Gurans', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (609, 60, N'Dungeshwor', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (610, 60, N'Naumule', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (611, 60, N'Mahabu', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (612, 60, N'Bairavi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (613, 60, N'Thantikandh', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (614, 61, N'Bheri', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (615, 61, N'Chhedagad', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (616, 61, N'Triveni Nalgad', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (617, 61, N'Kuse', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (618, 61, N'Junichande', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (619, 61, N'Barekot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (620, 61, N'Shivalaya', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (621, 62, N'Thuli Bheri', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (622, 62, N'Tripura Sundari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (623, 62, N'Dolpa Buddha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (624, 62, N'She Phoksundo', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (625, 62, N'Jagadulla', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (626, 62, N'Mudke Chula Gaun', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (627, 62, N'Kaieke', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (628, 62, N'Chharko Tongsong', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (629, 63, N'Chandannath', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (630, 63, N'Kanaka Sundari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (631, 63, N'Sinja', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (632, 63, N'Hima', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (633, 63, N'Tila', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (634, 63, N'Guthichaur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (635, 63, N'Tatopani', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (636, 63, N'Patarasi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (637, 64, N'Khandachakra', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (638, 64, N'Raskot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (639, 64, N'Tila', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (640, 64, N'Pachal Jharana', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (641, 64, N'Sanni Triveni', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (642, 64, N'Narhari Nath', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (643, 64, N'Kalika', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (644, 64, N'Mahawai', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (645, 64, N'Palata', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (646, 65, N'Chhaya Nath Rara', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (647, 65, N'Mugumakarmarong', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (648, 65, N'Soru', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (649, 65, N'Khatyad', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (650, 66, N'Simikot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (651, 66, N'Namkha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (652, 66, N'Kharpu Nath', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (653, 66, N'Sarkegad', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (654, 66, N'Chankheli', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (655, 66, N'Adanchuli', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (656, 66, N'Tanjakot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (657, 67, N'Badi Malika', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (658, 67, N'Triveni', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (659, 67, N'Budhi Ganga', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (660, 67, N'Budhi Nanda', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (661, 67, N'Gaumul', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (662, 67, N'Pandav Gupha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (663, 67, N'Swami Kartik', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (664, 67, N'Chhededaha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (665, 67, N'Himali', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (666, 68, N'Jaya Prithivi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (667, 68, N'Bungal', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (668, 68, N'Talkot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (669, 68, N'Masta', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (670, 68, N'Khaptad Chhanna', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (671, 68, N'Thalara', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (672, 68, N'Bitthadchir', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (673, 68, N'Surma', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (674, 68, N'Chhabis Pathibhera', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (675, 68, N'Durgathali', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (676, 68, N'Kedarsyun', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (677, 68, N'Kanda', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (678, 69, N'Mangalsen', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (679, 69, N'Sanfebagar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (680, 69, N'KamalBazar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (681, 69, N'Panchdeval Binayak', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (682, 69, N'Chourpati', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (683, 69, N'Mellekh', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (684, 69, N'Bannigadhi Jayagadh', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (685, 69, N'Rama Roshan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (686, 69, N'Dhakari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (687, 69, N'Turmakhand', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (688, 70, N'Dipayal Silgadi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (689, 70, N'Shikhar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (690, 70, N'Purbi Chouki', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (691, 70, N'Badikedar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (692, 70, N'Jorayal', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (693, 70, N'Sayal', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (694, 70, N'Aadarsha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (695, 70, N'K I Shing', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (696, 70, N'Bogtan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (697, 71, N'Dhangadhi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (698, 71, N'Tikapur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (699, 71, N'Ghodaghodi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (700, 71, N'Lamki Chuha', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (701, 71, N'Bhajani', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (702, 71, N'Godavari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (703, 71, N'Gauri Ganga', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (704, 71, N'Janaki', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (705, 71, N'Bardagoriya', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (706, 71, N'Mohanyal', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (707, 71, N'Kailari', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (708, 71, N'Joshipur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (709, 71, N'Chure', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (710, 72, N'Bhimdatta', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (711, 72, N'Punarbas', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (712, 72, N'Bedkot', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (713, 72, N'Mahakali', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (714, 72, N'Shuklaphanta', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (715, 72, N'Belauri', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (716, 72, N'Krishanapur', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (717, 72, N'Beldandi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (718, 72, N'Laljhadi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (719, 73, N'Amargadhi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (720, 73, N'Parashuram', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (721, 73, N'Aalitaal', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (722, 73, N'Bhageshwor', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (723, 73, N'Navadurga', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (724, 73, N'Ajaymeru', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (725, 73, N'Ganyapdhura', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (726, 74, N'Dasharath Chanda', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (727, 74, N'Patan', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (728, 74, N'Melauli', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (729, 74, N'Purchaundi', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (730, 74, N'Surnaiya', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (731, 74, N'Sigas', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (732, 74, N'Shivanath', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (733, 74, N'Pancheshwor', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (734, 74, N'Dogada Kedar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (735, 74, N'Dilasaini', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (736, 75, N'Mahakali', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (737, 75, N'Sailya Shikhar', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (738, 75, N'Malik Arjun', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (739, 75, N'Api Himal', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (740, 75, N'Duhun', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (741, 75, N'Naugad', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (742, 75, N'Marma', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (743, 75, N'Lekam', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (744, 75, N'Byans', NULL)
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (745, 40, N'Pokhara', N'')
GO
INSERT [dbo].[tbl_Vdc] ([VdcID], [DistrictID], [Name], [Code]) VALUES (746, 40, N'Pokhara 16', N'')
GO
SET IDENTITY_INSERT [dbo].[tbl_Vdc] OFF
GO
