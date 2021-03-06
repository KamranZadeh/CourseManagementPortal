USE [master]
GO
/****** Object:  Database [CourseManagementPortalData]    Script Date: 2/12/2022 10:14:41 AM ******/
CREATE DATABASE [CourseManagementPortalData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CourseManagementPortalData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CourseManagementPortalData.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CourseManagementPortalData_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CourseManagementPortalData_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CourseManagementPortalData] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CourseManagementPortalData].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CourseManagementPortalData] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CourseManagementPortalData] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CourseManagementPortalData] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CourseManagementPortalData] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CourseManagementPortalData] SET ARITHABORT OFF 
GO
ALTER DATABASE [CourseManagementPortalData] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CourseManagementPortalData] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CourseManagementPortalData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CourseManagementPortalData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CourseManagementPortalData] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CourseManagementPortalData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CourseManagementPortalData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CourseManagementPortalData] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CourseManagementPortalData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CourseManagementPortalData] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CourseManagementPortalData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CourseManagementPortalData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CourseManagementPortalData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CourseManagementPortalData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CourseManagementPortalData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CourseManagementPortalData] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CourseManagementPortalData] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CourseManagementPortalData] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CourseManagementPortalData] SET  MULTI_USER 
GO
ALTER DATABASE [CourseManagementPortalData] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CourseManagementPortalData] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CourseManagementPortalData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CourseManagementPortalData] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CourseManagementPortalData] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CourseManagementPortalData] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CourseManagementPortalData] SET QUERY_STORE = OFF
GO
USE [CourseManagementPortalData]
GO
/****** Object:  Table [dbo].[tableCourse]    Script Date: 2/12/2022 10:14:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tableCourse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Duration] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[CreationTime] [datetime] NULL,
	[ModificationTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tableGroups]    Script Date: 2/12/2022 10:14:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tableGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](max) NULL,
	[TeacherName] [nvarchar](max) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tableGroupsStudents]    Script Date: 2/12/2022 10:14:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tableGroupsStudents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](max) NULL,
	[StudentName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tableLesson]    Script Date: 2/12/2022 10:14:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tableLesson](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](max) NULL,
	[LessonName] [nvarchar](max) NULL,
	[StudentName] [nvarchar](100) NULL,
	[LessonDate] [date] NULL,
	[AtLesson] [bit] NULL,
	[Comment] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tableStudent]    Script Date: 2/12/2022 10:14:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tableStudent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[Surname] [nvarchar](20) NULL,
	[BirthDate] [date] NULL,
	[CreationTime] [datetime] NULL,
	[ModificationTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tableTeacher]    Script Date: 2/12/2022 10:14:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tableTeacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Surname] [nvarchar](30) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Canteach1] [nvarchar](100) NULL,
	[Canteach2] [nvarchar](100) NULL,
	[Canteach3] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tableCourse] ON 

INSERT [dbo].[tableCourse] ([Id], [Name], [Duration], [Price], [CreationTime], [ModificationTime]) VALUES (1, N'C#', 6, 340.0000, CAST(N'2022-01-28T07:21:46.017' AS DateTime), NULL)
INSERT [dbo].[tableCourse] ([Id], [Name], [Duration], [Price], [CreationTime], [ModificationTime]) VALUES (2, N'HTML, CSS', 6, 250.0000, CAST(N'2022-01-28T07:22:03.673' AS DateTime), CAST(N'2022-02-11T14:08:07.243' AS DateTime))
INSERT [dbo].[tableCourse] ([Id], [Name], [Duration], [Price], [CreationTime], [ModificationTime]) VALUES (3, N'UI/UX', 6, 450.0000, CAST(N'2022-01-28T07:22:33.427' AS DateTime), NULL)
INSERT [dbo].[tableCourse] ([Id], [Name], [Duration], [Price], [CreationTime], [ModificationTime]) VALUES (6, N'Asp.net', 3, 300.0000, CAST(N'2022-02-11T14:30:28.253' AS DateTime), NULL)
INSERT [dbo].[tableCourse] ([Id], [Name], [Duration], [Price], [CreationTime], [ModificationTime]) VALUES (7, N'English', 6, 120.0000, CAST(N'2022-02-11T14:30:50.520' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tableCourse] OFF
GO
SET IDENTITY_INSERT [dbo].[tableGroups] ON 

INSERT [dbo].[tableGroups] ([Id], [GroupName], [TeacherName], [StartDate], [EndDate]) VALUES (1, N'Full-stack-1', N'Nurlan Valizada', CAST(N'2022-01-01' AS Date), CAST(N'2022-06-30' AS Date))
INSERT [dbo].[tableGroups] ([Id], [GroupName], [TeacherName], [StartDate], [EndDate]) VALUES (2, N'Front-end-1', N'Gulmira Isgandarova', CAST(N'2022-01-01' AS Date), CAST(N'2022-05-01' AS Date))
INSERT [dbo].[tableGroups] ([Id], [GroupName], [TeacherName], [StartDate], [EndDate]) VALUES (3, N'Front-end-2', N'Rza Huseynov', CAST(N'2022-01-01' AS Date), NULL)
INSERT [dbo].[tableGroups] ([Id], [GroupName], [TeacherName], [StartDate], [EndDate]) VALUES (4, N'English-1', N'Kamran Shikhalizada', CAST(N'2022-01-01' AS Date), CAST(N'2022-06-01' AS Date))
SET IDENTITY_INSERT [dbo].[tableGroups] OFF
GO
SET IDENTITY_INSERT [dbo].[tableGroupsStudents] ON 

INSERT [dbo].[tableGroupsStudents] ([Id], [GroupName], [StudentName]) VALUES (1, N'Full-stack-1', N'Kamran Shikhalizada')
INSERT [dbo].[tableGroupsStudents] ([Id], [GroupName], [StudentName]) VALUES (2, N'Full-stack-1', N'Vasif Badalov')
INSERT [dbo].[tableGroupsStudents] ([Id], [GroupName], [StudentName]) VALUES (3, N'Full-stack-1', N'Ilkin Shahaliyev')
INSERT [dbo].[tableGroupsStudents] ([Id], [GroupName], [StudentName]) VALUES (4, N'Full-stack-1', N'Shahali Shahaliyev')
INSERT [dbo].[tableGroupsStudents] ([Id], [GroupName], [StudentName]) VALUES (5, N'Full-stack-1', N'Camal Karimov')
INSERT [dbo].[tableGroupsStudents] ([Id], [GroupName], [StudentName]) VALUES (6, N'Full-stack-1', N'Seymur Shikhalizada')
INSERT [dbo].[tableGroupsStudents] ([Id], [GroupName], [StudentName]) VALUES (7, N'Full-stack-1', N'Orxan Aliyev')
INSERT [dbo].[tableGroupsStudents] ([Id], [GroupName], [StudentName]) VALUES (8, N'Front-end-1', N'Aytac Mursalzada')
INSERT [dbo].[tableGroupsStudents] ([Id], [GroupName], [StudentName]) VALUES (9, N'Front-end-1', N'Tural Shahzada')
INSERT [dbo].[tableGroupsStudents] ([Id], [GroupName], [StudentName]) VALUES (10, N'Front-end-1', N'Samir Cabrayilov')
INSERT [dbo].[tableGroupsStudents] ([Id], [GroupName], [StudentName]) VALUES (11, N'Front-end-1', N'Ali Isgandarov')
INSERT [dbo].[tableGroupsStudents] ([Id], [GroupName], [StudentName]) VALUES (12, N'Front-end-1', N'Albert Kasimov')
SET IDENTITY_INSERT [dbo].[tableGroupsStudents] OFF
GO
SET IDENTITY_INSERT [dbo].[tableLesson] ON 

INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (1, N'Full-stack-1', N'C# introduction', N'Kamran Shikhalizada', CAST(N'2022-01-01' AS Date), 1, N'good')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (2, N'Full-stack-1', N'C# introduction', N'Vasif Badalov', CAST(N'2022-01-01' AS Date), 1, N'good')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (3, N'Full-stack-1', N'C# introduction', N'Ilkin Shahaliyev', CAST(N'2022-01-01' AS Date), 1, N'good')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (4, N'Full-stack-1', N'C# introduction', N'Shahali Shahaliyev', CAST(N'2022-01-01' AS Date), 1, N'good')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (5, N'Full-stack-1', N'C# introduction', N'Camal Karimov', CAST(N'2022-01-01' AS Date), 0, N'sick')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (6, N'Full-stack-1', N'C# introduction', N'Seymur Shikhalizada', CAST(N'2022-01-01' AS Date), 1, N'good')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (7, N'Full-stack-1', N'C# introduction', N'Orxan Aliyev', CAST(N'2022-01-01' AS Date), 1, N'good')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (8, N'Full-stack-1', N'C# If statement', N'Kamran Shikhalizada', CAST(N'2022-01-05' AS Date), 1, N'not ready')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (9, N'Full-stack-1', N'C# If statement', N'Vasif Badalov', CAST(N'2022-01-05' AS Date), 1, N'very good')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (10, N'Full-stack-1', N'C# If statement', N'Ilkin Shahaliyev', CAST(N'2022-01-05' AS Date), 1, N'100 score')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (11, N'Full-stack-1', N'C# If statement', N'Shahali Shahaliyev', CAST(N'2022-01-05' AS Date), 1, N'not bad')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (12, N'Full-stack-1', N'C# If statement', N'Camal Karimov', CAST(N'2022-01-05' AS Date), 1, N'not bad')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (13, N'Full-stack-1', N'C# If statement', N'Seymur Shikhalizada', CAST(N'2022-01-05' AS Date), 0, N'covid')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (14, N'Full-stack-1', N'C# If statement', N'Orxan Aliyev', CAST(N'2022-01-05' AS Date), 1, N'100 score')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (15, N'Full-stack-1', N'C# loops', N'Orxan Aliyev', CAST(N'2022-01-08' AS Date), 1, N'not good')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (16, N'Full-stack-1', N'C# loops', N'Seymur Shikhalizada', CAST(N'2022-01-08' AS Date), 1, N'excellent')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (17, N'Full-stack-1', N'C# loops', N'Camal Karimov', CAST(N'2022-01-08' AS Date), 1, N'very good')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (18, N'Full-stack-1', N'C# loops', N'Shahali Shahaliyev', CAST(N'2022-01-08' AS Date), 1, N'very well')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (19, N'Full-stack-1', N'C# loops', N'Ilkin Shahaliyev', CAST(N'2022-01-08' AS Date), 1, N'excellent')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (20, N'Full-stack-1', N'C# loops', N'Vasif Badalov', CAST(N'2022-01-08' AS Date), 0, N'sick')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (21, N'Full-stack-1', N'C# loops', N'Kamran Shikhalizada', CAST(N'2022-01-08' AS Date), 0, N'sick')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (22, N'Front-end-1', N'HTML Introduction', N'Aytac Mursalzada', CAST(N'2022-01-01' AS Date), 1, N'ok')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (23, N'Front-end-1', N'HTML Introduction', N'Tural Shahzada', CAST(N'2022-01-01' AS Date), 1, N'not bad')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (24, N'Front-end-1', N'HTML Introduction', N'Samir Cabrayilov', CAST(N'2022-01-01' AS Date), 0, N'said sick')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (25, N'Front-end-1', N'HTML Introduction', N'Ali Isgandarov', CAST(N'2022-01-01' AS Date), 1, N'very well')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (26, N'Front-end-1', N'HTML Introduction', N'Albert Kasimov', CAST(N'2022-01-01' AS Date), 1, N'good')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (28, N'Front-end-1', N'Css tries', N'Aytac Mursalzada', CAST(N'2022-01-05' AS Date), 1, N'good')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (29, N'Front-end-1', N'Css tries', N'Tural Shahzada', CAST(N'2022-01-05' AS Date), 1, N'good')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (30, N'Front-end-1', N'Css tries', N'Samir Cabrayilov', CAST(N'2022-01-05' AS Date), 1, N'good')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (31, N'Front-end-1', N'Css tries', N'Ali Isgandarov', CAST(N'2022-01-05' AS Date), 1, N'good')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (32, N'Front-end-1', N'Css tries', N'Albert Kasimov', CAST(N'2022-01-05' AS Date), 1, N'good')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (33, N'Front-end-1', N'First site', N'Aytac Mursalzada', CAST(N'2022-01-08' AS Date), 1, N'good')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (34, N'Front-end-1', N'First site', N'Tural Shahzada', CAST(N'2022-01-08' AS Date), 1, N'good')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (35, N'Front-end-1', N'First site', N'Samir Cabrayilov', CAST(N'2022-01-08' AS Date), 1, N'not bad')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (36, N'Front-end-1', N'First site', N'Ali Isgandarov', CAST(N'2022-01-08' AS Date), 1, N'good')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (37, N'Front-end-1', N'First site', N'Albert Kasimov', CAST(N'2022-01-08' AS Date), 1, N'good')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (38, N'Front-end-1', N'First tamplate', N'Aytac Mursalzada', CAST(N'2022-01-11' AS Date), 1, N'good')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (39, N'Front-end-1', N'First tamplate', N'Tural Shahzada', CAST(N'2022-01-11' AS Date), 1, N'good')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (40, N'Front-end-1', N'First tamplate', N'Samir Cabrayilov', CAST(N'2022-01-11' AS Date), 1, N'bad')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (41, N'Front-end-1', N'First tamplate', N'Ali Isgandarov', CAST(N'2022-01-11' AS Date), 0, N'sick')
INSERT [dbo].[tableLesson] ([Id], [GroupName], [LessonName], [StudentName], [LessonDate], [AtLesson], [Comment]) VALUES (42, N'Front-end-1', N'First tamplate', N'Albert Kasimov', CAST(N'2022-01-11' AS Date), 1, N'good')
SET IDENTITY_INSERT [dbo].[tableLesson] OFF
GO
SET IDENTITY_INSERT [dbo].[tableStudent] ON 

INSERT [dbo].[tableStudent] ([Id], [Name], [Surname], [BirthDate], [CreationTime], [ModificationTime]) VALUES (1, N'Kamran', N'Shikhalizada', CAST(N'1994-09-14' AS Date), CAST(N'2022-01-25T22:12:35.140' AS DateTime), NULL)
INSERT [dbo].[tableStudent] ([Id], [Name], [Surname], [BirthDate], [CreationTime], [ModificationTime]) VALUES (2, N'Vasif', N'Badalov', CAST(N'1994-09-11' AS Date), CAST(N'2022-01-25T22:13:02.860' AS DateTime), NULL)
INSERT [dbo].[tableStudent] ([Id], [Name], [Surname], [BirthDate], [CreationTime], [ModificationTime]) VALUES (3, N'Ilkin', N'Shahaliyev', CAST(N'2003-10-15' AS Date), CAST(N'2022-01-26T19:43:47.893' AS DateTime), NULL)
INSERT [dbo].[tableStudent] ([Id], [Name], [Surname], [BirthDate], [CreationTime], [ModificationTime]) VALUES (4, N'Shahali', N'Shahaliyev', CAST(N'2004-12-31' AS Date), CAST(N'2022-01-26T19:43:58.310' AS DateTime), CAST(N'2022-02-04T15:15:46.673' AS DateTime))
INSERT [dbo].[tableStudent] ([Id], [Name], [Surname], [BirthDate], [CreationTime], [ModificationTime]) VALUES (5, N'Camal', N'Karimov', CAST(N'2004-01-31' AS Date), CAST(N'2022-01-27T14:25:15.567' AS DateTime), NULL)
INSERT [dbo].[tableStudent] ([Id], [Name], [Surname], [BirthDate], [CreationTime], [ModificationTime]) VALUES (6, N'Seymur', N'Shikhalizada', CAST(N'2004-12-31' AS Date), CAST(N'2022-01-27T14:25:31.197' AS DateTime), NULL)
INSERT [dbo].[tableStudent] ([Id], [Name], [Surname], [BirthDate], [CreationTime], [ModificationTime]) VALUES (7, N'Orxan', N'Hasanov', CAST(N'2004-12-31' AS Date), CAST(N'2022-01-27T14:25:41.753' AS DateTime), CAST(N'2022-02-11T14:19:23.147' AS DateTime))
INSERT [dbo].[tableStudent] ([Id], [Name], [Surname], [BirthDate], [CreationTime], [ModificationTime]) VALUES (8, N'Orxan', N'Aliyev', CAST(N'2004-12-31' AS Date), CAST(N'2022-01-27T14:25:51.590' AS DateTime), NULL)
INSERT [dbo].[tableStudent] ([Id], [Name], [Surname], [BirthDate], [CreationTime], [ModificationTime]) VALUES (9, N'Tural', N'Aliyev', CAST(N'2004-12-31' AS Date), CAST(N'2022-01-27T14:26:00.697' AS DateTime), NULL)
INSERT [dbo].[tableStudent] ([Id], [Name], [Surname], [BirthDate], [CreationTime], [ModificationTime]) VALUES (10, N'Bayaz', N'Shixalizade', CAST(N'1996-11-01' AS Date), CAST(N'2022-01-27T17:32:47.797' AS DateTime), CAST(N'2022-01-27T17:33:02.880' AS DateTime))
INSERT [dbo].[tableStudent] ([Id], [Name], [Surname], [BirthDate], [CreationTime], [ModificationTime]) VALUES (11, N'Aytac', N'Mursalzade', CAST(N'2004-01-31' AS Date), CAST(N'2022-01-28T08:15:29.693' AS DateTime), CAST(N'2022-02-11T15:03:11.217' AS DateTime))
INSERT [dbo].[tableStudent] ([Id], [Name], [Surname], [BirthDate], [CreationTime], [ModificationTime]) VALUES (12, N'Tural', N'Shahzada', CAST(N'2004-12-31' AS Date), CAST(N'2022-01-28T08:15:42.387' AS DateTime), NULL)
INSERT [dbo].[tableStudent] ([Id], [Name], [Surname], [BirthDate], [CreationTime], [ModificationTime]) VALUES (13, N'Muxtar', N'Hasanov', CAST(N'2004-12-31' AS Date), CAST(N'2022-01-28T08:15:58.577' AS DateTime), NULL)
INSERT [dbo].[tableStudent] ([Id], [Name], [Surname], [BirthDate], [CreationTime], [ModificationTime]) VALUES (14, N'Samir', N'Cabrayilov', CAST(N'2004-12-31' AS Date), CAST(N'2022-01-28T08:16:09.440' AS DateTime), NULL)
INSERT [dbo].[tableStudent] ([Id], [Name], [Surname], [BirthDate], [CreationTime], [ModificationTime]) VALUES (15, N'Ali', N'Isgandarov', CAST(N'2004-12-07' AS Date), CAST(N'2022-01-28T08:16:23.320' AS DateTime), CAST(N'2022-01-28T09:10:37.727' AS DateTime))
INSERT [dbo].[tableStudent] ([Id], [Name], [Surname], [BirthDate], [CreationTime], [ModificationTime]) VALUES (16, N'Camil', N'Amilov', CAST(N'2004-01-31' AS Date), CAST(N'2022-02-11T14:29:18.877' AS DateTime), NULL)
INSERT [dbo].[tableStudent] ([Id], [Name], [Surname], [BirthDate], [CreationTime], [ModificationTime]) VALUES (17, N'Albert', N'Kasimov', CAST(N'2004-12-31' AS Date), CAST(N'2022-02-11T14:29:37.003' AS DateTime), NULL)
INSERT [dbo].[tableStudent] ([Id], [Name], [Surname], [BirthDate], [CreationTime], [ModificationTime]) VALUES (18, N'Islam', N'Karimov', CAST(N'2004-12-31' AS Date), CAST(N'2022-02-11T14:29:53.613' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tableStudent] OFF
GO
SET IDENTITY_INSERT [dbo].[tableTeacher] ON 

INSERT [dbo].[tableTeacher] ([Id], [Name], [Surname], [BirthDate], [Canteach1], [Canteach2], [Canteach3]) VALUES (1, N'Nurlan', N'Valizada', CAST(N'1993-06-06' AS Date), N'C#', N'Asp.net', N'HTML, CSS')
INSERT [dbo].[tableTeacher] ([Id], [Name], [Surname], [BirthDate], [Canteach1], [Canteach2], [Canteach3]) VALUES (2, N'Rza', N'Huseynov', CAST(N'1994-12-31' AS Date), N'HTML, CSS', N'UI/UX', NULL)
INSERT [dbo].[tableTeacher] ([Id], [Name], [Surname], [BirthDate], [Canteach1], [Canteach2], [Canteach3]) VALUES (3, N'Kamran', N'Shikhalizada', CAST(N'1994-09-14' AS Date), N'English', NULL, NULL)
INSERT [dbo].[tableTeacher] ([Id], [Name], [Surname], [BirthDate], [Canteach1], [Canteach2], [Canteach3]) VALUES (4, N'Gulmira', N'Isgandarova', CAST(N'1997-07-17' AS Date), N'UI/UX', N'HTML, CSS', NULL)
SET IDENTITY_INSERT [dbo].[tableTeacher] OFF
GO
ALTER TABLE [dbo].[tableCourse] ADD  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [dbo].[tableCourse] ADD  DEFAULT (NULL) FOR [ModificationTime]
GO
ALTER TABLE [dbo].[tableStudent] ADD  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [dbo].[tableStudent] ADD  DEFAULT (NULL) FOR [ModificationTime]
GO
USE [master]
GO
ALTER DATABASE [CourseManagementPortalData] SET  READ_WRITE 
GO
