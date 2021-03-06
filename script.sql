USE [master]
GO
/****** Object:  Database [MISA-MSK]    Script Date: 04/05/2020 17:18:55 ******/
CREATE DATABASE [MISA-MSK]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MISA-MSK', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MISA-MSK.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MISA-MSK_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MISA-MSK_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MISA-MSK] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MISA-MSK].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MISA-MSK] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MISA-MSK] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MISA-MSK] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MISA-MSK] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MISA-MSK] SET ARITHABORT OFF 
GO
ALTER DATABASE [MISA-MSK] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MISA-MSK] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MISA-MSK] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MISA-MSK] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MISA-MSK] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MISA-MSK] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MISA-MSK] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MISA-MSK] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MISA-MSK] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MISA-MSK] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MISA-MSK] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MISA-MSK] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MISA-MSK] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MISA-MSK] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MISA-MSK] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MISA-MSK] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MISA-MSK] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MISA-MSK] SET RECOVERY FULL 
GO
ALTER DATABASE [MISA-MSK] SET  MULTI_USER 
GO
ALTER DATABASE [MISA-MSK] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MISA-MSK] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MISA-MSK] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MISA-MSK] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MISA-MSK] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MISA-MSK', N'ON'
GO
ALTER DATABASE [MISA-MSK] SET QUERY_STORE = OFF
GO
USE [MISA-MSK]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 04/05/2020 17:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [uniqueidentifier] NOT NULL,
	[CustomerCode] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](225) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Birthday] [date] NULL,
	[CompanyName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreateBy] [nvarchar](250) NULL,
	[ModifiedDate] [datetime] NULL,
	[CustomerGroupID] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerGroup]    Script Date: 04/05/2020 17:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerGroup](
	[CustomerGroupID] [int] NOT NULL,
	[CustomerGroupName] [nchar](225) NOT NULL,
	[ParentID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreateBy] [nvarchar](250) NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_CustomerGroup] PRIMARY KEY CLUSTERED 
(
	[CustomerGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Customer_CustomerCode_CustomerName_Email_Phone]    Script Date: 04/05/2020 17:18:56 ******/
CREATE NONCLUSTERED INDEX [IX_Customer_CustomerCode_CustomerName_Email_Phone] ON [dbo].[Customer]
(
	[CustomerCode] ASC,
	[FullName] ASC,
	[Email] ASC,
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CustomerGroup_CustomerGroupName]    Script Date: 04/05/2020 17:18:56 ******/
CREATE NONCLUSTERED INDEX [IX_CustomerGroup_CustomerGroupName] ON [dbo].[CustomerGroup]
(
	[CustomerGroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomerID]  DEFAULT (newid()) FOR [CustomerID]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CustomerGroup] FOREIGN KEY([CustomerGroupID])
REFERENCES [dbo].[CustomerGroup] ([CustomerGroupID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CustomerGroup]
GO
/****** Object:  StoredProcedure [dbo].[Proc_DeleteCustomer]    Script Date: 04/05/2020 17:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Proc_DeleteCustomer]

	@CustomerID UNIQUEIDENTIFIER

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

	DELETE FROM dbo.Customer 
	WHERE CustomerID=@CustomerID;
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetCustomerById]    Script Date: 04/05/2020 17:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Proc_GetCustomerById] 
	-- Add the parameters for the stored procedure here
	@CustomerID UNIQUEIDENTIFIER

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;
	SELECT * FROM [MISA-MSK].dbo.Customer 
	WHERE CustomerID=@CustomerID;
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetCustomers]    Script Date: 04/05/2020 17:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Proc_GetCustomers]

AS
BEGIN

	SET NOCOUNT ON;
	SELECT TOP 50 * FROM [MISA-MSK].dbo.Customer AS C
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_InsertCustomer]    Script Date: 04/05/2020 17:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Proc_InsertCustomer]
	@CustomerID UNIQUEIDENTIFIER,
	@CustomerCode NCHAR(50),
	@FullName NCHAR(225),
	@Phone NCHAR(50),
	@Birthday DATE,
	@CompanyName NCHAR(50),
	@Email NCHAR(50),
	@Address NCHAR(50),
	@Description NCHAR(50),
	@CreatedDate DATETIME,
	@CreatedBy NCHAR(250),
	@ModifiedDate DATETIME,
	@CustomerGroupID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;
	INSERT INTO dbo.Customer
	(
	    CustomerID,
	    CustomerCode,
		FullName,
	    Phone,
	    Birthday,
	    CompanyName,
	    Email,
	    Address,
	    Description,
	    CreatedDate,
	    CreateBy,
	    ModifiedDate,
	    CustomerGroupID
	)
	VALUES
	(  
		@CustomerID,
	    @FullName,
	    @CustomerCode,
	    @Phone,
	    @Birthday,
	    @CompanyName,
	    @Email,
	    @Address,
	    @Description,
	    @CreatedDate,
	    @CreatedBy,
	    @ModifiedDate,
	    @CustomerGroupID
	    )
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_InsertCustomerGroup]    Script Date: 04/05/2020 17:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Proc_InsertCustomerGroup]
	    @CustomerGroupID int,
	    @CustomerGroupName NCHAR(225), 
	    @ParentID INT,
	    @CreatedDate DATETIME,
	    @CreateBy NVARCHAR(250),
	    @ModifiedDate DATETIME
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;
	INSERT INTO dbo.CustomerGroup
	(
	    CustomerGroupID,
	    CustomerGroupName,
	    ParentID,
	    CreatedDate,
	    CreateBy,
	    ModifiedDate
	)
	VALUES
	(   
		@CustomerGroupID,         -- CustomerGroupID - int
	    @CustomerGroupName,       -- CustomerGroupName - nchar(225)
	    @ParentID,         -- ParentID - int
	    @CreatedDate, -- CreatedDate - datetime
	    @CreateBy,       -- CreateBy - nvarchar(250)
	    @ModifiedDate  -- ModifiedDate - datetime   
	)
	END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ten khach hang' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'FullName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'so dt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nay sinh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Birthday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ten cong ty' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'CompanyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dia chi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ghi chu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ngay tao' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nguoi tao' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'CreateBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ngay sua cuoi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'khoa ngoai' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'CustomerGroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'bang du lieu thong tin khach hang' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'quan he 1-n giua bang nhom khach hang va bang khach hang' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'CONSTRAINT',@level2name=N'FK_Customer_CustomerGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'khoa chinh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerGroup', @level2type=N'COLUMN',@level2name=N'CustomerGroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ten nhom khach hang' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerGroup', @level2type=N'COLUMN',@level2name=N'CustomerGroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID cha' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerGroup', @level2type=N'COLUMN',@level2name=N'ParentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'index cho ten nhom khach hang' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerGroup', @level2type=N'INDEX',@level2name=N'IX_CustomerGroup_CustomerGroupName'
GO
USE [master]
GO
ALTER DATABASE [MISA-MSK] SET  READ_WRITE 
GO
