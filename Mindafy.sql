USE [Mindafy]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 23/05/2022 17:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[id_Activity] [int] IDENTITY(1,1) NOT NULL,
	[start_Date_Activity] [date] NULL,
	[end_Date_Activity] [date] NULL,
	[description_Activity] [text] NULL,
	[name_Activity] [nvarchar](100) NULL,
	[state] [bit] NULL,
	[Note] [float] NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[id_Activity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conforms]    Script Date: 23/05/2022 17:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conforms](
	[id_Subject] [int] NULL,
	[id_Activity] [int] NULL,
	[id_Conforms] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Conforms] PRIMARY KEY CLUSTERED 
(
	[id_Conforms] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Establishes]    Script Date: 23/05/2022 17:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Establishes](
	[id_Subject] [int] NULL,
	[id_Student] [int] NULL,
	[id_Establishes] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Establishes] PRIMARY KEY CLUSTERED 
(
	[id_Establishes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[files_Schedule]    Script Date: 23/05/2022 17:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[files_Schedule](
	[name_File_Schedule] [varchar](50) NULL,
	[file_Schedule] [varbinary](max) NULL,
	[extension_File_Schedule] [char](5) NULL,
	[id_file] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_files_Schedule] PRIMARY KEY CLUSTERED 
(
	[id_file] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[insert]    Script Date: 23/05/2022 17:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[insert](
	[id_file] [int] NULL,
	[id_Activity] [int] NULL,
	[id_insert] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_insert] PRIMARY KEY CLUSTERED 
(
	[id_insert] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 23/05/2022 17:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[id_Student] [int] IDENTITY(1,1) NOT NULL,
	[name_Student] [varchar](100) NULL,
	[pass_Student] [varchar](200) NULL,
	[mail_Student] [varchar](100) NULL,
	[phone_Student] [varchar](50) NULL,
	[token_recovery] [varchar](200) NULL,
 CONSTRAINT [PK__Student__0098208F98800639] PRIMARY KEY CLUSTERED 
(
	[id_Student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 23/05/2022 17:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[id_Subject] [int] IDENTITY(1,1) NOT NULL,
	[name_Subject] [nvarchar](100) NULL,
	[description_Subject] [text] NULL,
	[average_Subject] [float] NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[id_Subject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Conforms]  WITH CHECK ADD  CONSTRAINT [FK_Conforms_Schedule] FOREIGN KEY([id_Activity])
REFERENCES [dbo].[Activity] ([id_Activity])
GO
ALTER TABLE [dbo].[Conforms] CHECK CONSTRAINT [FK_Conforms_Schedule]
GO
ALTER TABLE [dbo].[Conforms]  WITH CHECK ADD  CONSTRAINT [FK_Conforms_Subject] FOREIGN KEY([id_Subject])
REFERENCES [dbo].[Subject] ([id_Subject])
GO
ALTER TABLE [dbo].[Conforms] CHECK CONSTRAINT [FK_Conforms_Subject]
GO
ALTER TABLE [dbo].[Establishes]  WITH CHECK ADD  CONSTRAINT [FK_Establishes_Student] FOREIGN KEY([id_Student])
REFERENCES [dbo].[Student] ([id_Student])
GO
ALTER TABLE [dbo].[Establishes] CHECK CONSTRAINT [FK_Establishes_Student]
GO
ALTER TABLE [dbo].[Establishes]  WITH CHECK ADD  CONSTRAINT [FK_Establishes_Subject] FOREIGN KEY([id_Subject])
REFERENCES [dbo].[Subject] ([id_Subject])
GO
ALTER TABLE [dbo].[Establishes] CHECK CONSTRAINT [FK_Establishes_Subject]
GO
ALTER TABLE [dbo].[insert]  WITH CHECK ADD  CONSTRAINT [FK_insert_Activity] FOREIGN KEY([id_Activity])
REFERENCES [dbo].[Activity] ([id_Activity])
GO
ALTER TABLE [dbo].[insert] CHECK CONSTRAINT [FK_insert_Activity]
GO
ALTER TABLE [dbo].[insert]  WITH CHECK ADD  CONSTRAINT [FK_insert_files_Schedule] FOREIGN KEY([id_file])
REFERENCES [dbo].[files_Schedule] ([id_file])
GO
ALTER TABLE [dbo].[insert] CHECK CONSTRAINT [FK_insert_files_Schedule]
GO
