USE [Library]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/3/2023 02:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[DOB] [date] NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Role] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 7/3/2023 02:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[AuthorID] [nvarchar](50) NOT NULL,
	[AuthorName] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 7/3/2023 02:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [nvarchar](50) NOT NULL,
	[BookName] [nvarchar](max) NULL,
	[AuthorID] [nvarchar](50) NULL,
	[CategoryID] [nvarchar](50) NULL,
	[PublisherID] [nvarchar](50) NULL,
	[PublishYear] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
	[Doi] [nvarchar](max) NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/3/2023 02:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [nvarchar](50) NOT NULL,
	[CategoryName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 7/3/2023 02:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceID] [nvarchar](50) NOT NULL,
	[ReaderID] [nvarchar](50) NOT NULL,
	[AccountID] [int] NOT NULL,
	[BorrowDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceDetails]    Script Date: 7/3/2023 02:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetails](
	[InvoiceID] [nvarchar](50) NULL,
	[BookID] [nvarchar](50) NULL,
	[Note] [nvarchar](max) NULL,
	[Paid] [int] NULL,
	[PaidDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 7/3/2023 02:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[PublisherID] [nvarchar](50) NOT NULL,
	[PublisherName] [nvarchar](max) NULL,
	[PublisherAddress] [nvarchar](max) NULL,
	[PublisherEmail] [nvarchar](max) NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reader]    Script Date: 7/3/2023 02:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reader](
	[ReaderID] [nvarchar](50) NOT NULL,
	[ReaderName] [nvarchar](max) NULL,
	[ReaderAddress] [nvarchar](max) NULL,
	[ReaderDOB] [date] NULL,
	[ReaderEmail] [nvarchar](max) NULL,
	[BeginDate] [date] NULL,
 CONSTRAINT [PK_Reader] PRIMARY KEY CLUSTERED 
(
	[ReaderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountID], [Name], [DOB], [PhoneNumber], [Address], [Email], [Username], [Password], [Role]) VALUES (1, N'Nguyễn Trung Đức', CAST(N'2001-10-04' AS Date), N'0866565950', N'Thái Nguyên', N'ducnguyenthptdh@gmail.com', N'admin', N'12345', 1)
INSERT [dbo].[Account] ([AccountID], [Name], [DOB], [PhoneNumber], [Address], [Email], [Username], [Password], [Role]) VALUES (24, N'DPV', CAST(N'2022-04-27' AS Date), N'0866565950', N'Thái Nguyên', N'ducprovng@gmail.com', N'admin1', N'12345', 0)
INSERT [dbo].[Account] ([AccountID], [Name], [DOB], [PhoneNumber], [Address], [Email], [Username], [Password], [Role]) VALUES (25, N'khanh manh', CAST(N'2001-01-01' AS Date), N'12345678', N'lâm thao-phú tho', N'Manhnkhe153424@fpt.edu.vn', N'manhdsz', N'dsz', 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [Note]) VALUES (N'AT1651028217706', N'Paulo Coelho', N'')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [Note]) VALUES (N'AT1651029058844', N'Mario Puzo', N'')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [Note]) VALUES (N'AT1651029589255', N'Victor Hugo', N'')
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [Note]) VALUES (N'AT1651029855056', N'David Walliams', N'')
GO
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [CategoryID], [PublisherID], [PublishYear], [Quantity], [Price], [Doi]) VALUES (N'BO1651028454476', N'Nhà Giả Kim', N'AT1651028217706', N'CT1651028391690', N'PL1651028303793', N'2020', 100, 50000, N'10.1145/2783446.2783605')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [CategoryID], [PublisherID], [PublishYear], [Quantity], [Price], [Doi]) VALUES (N'BO1651029394020', N'Bố Già', N'AT1651029058844', N'CT1651028391690', N'PL1651029063667', N'2016', 100, 65000, N'10.1145/2783446.2783605')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [CategoryID], [PublisherID], [PublishYear], [Quantity], [Price], [Doi]) VALUES (N'BO1651029687495', N'Những Người Khốn Khổ', N'AT1651029589255', N'CT1651028391690', N'PL1651029593121', N'2016', 10, 300000, N'10.1145/2783446.2783605')
INSERT [dbo].[Book] ([BookID], [BookName], [AuthorID], [CategoryID], [PublisherID], [PublishYear], [Quantity], [Price], [Doi]) VALUES (N'BO1651029898248', N'Ông Nội Vượt Ngục', N'AT1651029855056', N'CT1651029754401', N'PL1651029861023', N'2021', 10, 100000, N'10.1145/2783446.2783605')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'CT1651028391690', N'Tiểu thuyết')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'CT1651029754401', N'Truyện cười')
GO
INSERT [dbo].[Invoice] ([InvoiceID], [ReaderID], [AccountID], [BorrowDate]) VALUES (N'IN1651108332627', N'RD1651028714293', 1, CAST(N'2022-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [ReaderID], [AccountID], [BorrowDate]) VALUES (N'IN1651119413781', N'RD1651028714293', 1, CAST(N'2022-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [ReaderID], [AccountID], [BorrowDate]) VALUES (N'IN1688362980412', N'RD1651028714293', 1, CAST(N'2023-07-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [ReaderID], [AccountID], [BorrowDate]) VALUES (N'IN1688363860582', N'RD1651028714293', 1, CAST(N'2023-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [ReaderID], [AccountID], [BorrowDate]) VALUES (N'IN1688363916350', N'RD1651028714293', 1, CAST(N'2023-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [ReaderID], [AccountID], [BorrowDate]) VALUES (N'IN1688368472403', N'RD1651028714293', 1, CAST(N'2023-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [ReaderID], [AccountID], [BorrowDate]) VALUES (N'IN1688368508536', N'RD1651028714293', 1, CAST(N'2023-07-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[InvoiceDetails] ([InvoiceID], [BookID], [Note], [Paid], [PaidDate]) VALUES (N'IN1651119413781', N'BO1651028454476', NULL, 1, CAST(N'2023-07-03T12:58:30.867' AS DateTime))
INSERT [dbo].[InvoiceDetails] ([InvoiceID], [BookID], [Note], [Paid], [PaidDate]) VALUES (N'IN1651119413781', N'BO1651029394020', NULL, 1, CAST(N'2023-07-03T12:58:30.867' AS DateTime))
INSERT [dbo].[InvoiceDetails] ([InvoiceID], [BookID], [Note], [Paid], [PaidDate]) VALUES (N'IN1651108332627', N'BO1651028454476', NULL, 1, CAST(N'2022-04-28T08:13:07.887' AS DateTime))
INSERT [dbo].[InvoiceDetails] ([InvoiceID], [BookID], [Note], [Paid], [PaidDate]) VALUES (N'IN1651108332627', N'BO1651029898248', NULL, 1, CAST(N'2022-04-28T08:13:07.887' AS DateTime))
INSERT [dbo].[InvoiceDetails] ([InvoiceID], [BookID], [Note], [Paid], [PaidDate]) VALUES (N'IN1688363860582', N'BO1651029394020', NULL, 1, CAST(N'2023-07-03T12:58:01.610' AS DateTime))
INSERT [dbo].[InvoiceDetails] ([InvoiceID], [BookID], [Note], [Paid], [PaidDate]) VALUES (N'IN1688363916350', N'BO1651029687495', NULL, 0, NULL)
INSERT [dbo].[InvoiceDetails] ([InvoiceID], [BookID], [Note], [Paid], [PaidDate]) VALUES (N'IN1688363916350', N'BO1651029394020', NULL, 0, NULL)
INSERT [dbo].[InvoiceDetails] ([InvoiceID], [BookID], [Note], [Paid], [PaidDate]) VALUES (N'IN1688363916350', N'BO1651029898248', NULL, 0, NULL)
INSERT [dbo].[InvoiceDetails] ([InvoiceID], [BookID], [Note], [Paid], [PaidDate]) VALUES (N'IN1688363916350', N'BO1651028454476', NULL, 0, NULL)
INSERT [dbo].[InvoiceDetails] ([InvoiceID], [BookID], [Note], [Paid], [PaidDate]) VALUES (N'IN1688368472403', N'BO1651029687495', NULL, 1, CAST(N'2023-07-03T14:15:05.250' AS DateTime))
INSERT [dbo].[InvoiceDetails] ([InvoiceID], [BookID], [Note], [Paid], [PaidDate]) VALUES (N'IN1688368472403', N'BO1651029394020', NULL, 1, CAST(N'2023-07-03T14:15:05.250' AS DateTime))
GO
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherAddress], [PublisherEmail]) VALUES (N'PL1651028303793', N'Nhà Xuất Bản Hà Nội', N'4 P. Tống Duy Tân, Hàng Bông, Hoàn Kiếm, Hà Nội', N'vanthu_nxbhanoi@hanoi.gov.vn')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherAddress], [PublisherEmail]) VALUES (N'PL1651029063667', N'Công Ty CP Văn Hóa Đông A', N'113 P. Đông Các, Chợ Dừa, Đống Đa, Hà Nội', N'contact@sachdonga.vn')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherAddress], [PublisherEmail]) VALUES (N'PL1651029593121', N'Nhà Xuất Bản Văn Học', N'18 NGUYỄN TRƯỜNG TỘ - BA ĐÌNH - HÀ NỘI', N'info.nxbvanhoc@gmail.com')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [PublisherAddress], [PublisherEmail]) VALUES (N'PL1651029861023', N'Nhà Xuất Bản Hội Nhà Văn', N'65 Nguyễn Du - Hà Nội', N'nxbhoinhavan65@gmail.com')
GO
INSERT [dbo].[Reader] ([ReaderID], [ReaderName], [ReaderAddress], [ReaderDOB], [ReaderEmail], [BeginDate]) VALUES (N'RD1651028714293', N'Nguyễn Trung Đức', N'Thái Nguyên', CAST(N'2001-04-10' AS Date), N'ducprovng@gmail.com', CAST(N'2022-04-27' AS Date))
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Author] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Author] ([AuthorID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Author]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Category]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Publisher2] FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Publisher] ([PublisherID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Publisher2]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Account]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Reader] FOREIGN KEY([ReaderID])
REFERENCES [dbo].[Reader] ([ReaderID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Reader]
GO
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetails_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[InvoiceDetails] CHECK CONSTRAINT [FK_InvoiceDetails_Book]
GO
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetails_Invoice] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoice] ([InvoiceID])
GO
ALTER TABLE [dbo].[InvoiceDetails] CHECK CONSTRAINT [FK_InvoiceDetails_Invoice]
GO
