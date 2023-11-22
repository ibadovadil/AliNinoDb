--CREATE DATABASE AliNinoDB
--USE AliNinoDB

--CREATE TABLE CATEGORIES(
-- Id int identity primary key,
-- Title nvarchar(150) NOT NULL,
-- ParentCategoryId int REFERENCES Categories(Id),
-- IsDeleted bit DEFAULT 0
--)
--CREATE TABLE BOOKS(
-- Id int identity primary key,
-- Title nvarchar(150) NOT NULL,
-- Description nvarchar(250),
-- ActualPrice int NOT NULL CHECK(ActualPrice>0),
-- DiscountPrice int CHECK( DiscountPrice>0),
-- PublishingHouseId int REFERENCES PUBLISHINGHOUSES(Id), --DiscountPrice<ActualPrice  bele bir sey yazdim error verirdi
-- StockCount int ,
-- ArticleCode int,
-- BindingId int,
-- Pages int,
-- CategoryId int REFERENCES CATEGORIES(Id),
-- IsDeleted bit DEFAULT 0
--)

--CREATE TABLE AUTHORS(
--Id int identity primary key,
--Name nvarchar(50) NOT NULL,
--Surname nvarchar(50) NOT NULL,
--IsDeleted bit DEFAULT 0
--)
--CREATE TABLE BOOKSAUTHORS(
--Id int identity primary key ,
--BookId int References BOOKS(Id),
--AuthorId int References AUTHORS(Id)
--)
--CREATE TABLE PUBLISHINGHOUSES(
--Id int identity primary key,
--Title nvarchar(150),
--IsDeleted bit DEFAULT 0
--)
--CREATE TABLE BOOKGENRES(
--Id int identity primary key,
--BookId int References BOOKS(Id),
--GenreId int References GENRES(Id)
--)
--CREATE TABLE GENRES(
--Id int Identity primary key,
--Title nvarchar(50) NOT NULL,
--IsDeleted bit DEFAULT 0
--)
--CREATE TABLE BINDINGS(
--Id int identity primary key,
--Title nvarchar(50) NOT NULL,
--IsDeleted bit DEFAULT 0
--)
--CREATE TABLE LANGUAGES(
--Id int identity primary key,
--Title nvarchar(50) NOT NULL,
--IsDeleted bit DEFAULT 0
--)
--CREATE TABLE BOOKSLANGUAGES(
--Id int identity primary key,
--BookId int References BOOKS(Id),
--LanguageId int References LANGUAGES(Id)
--)
--CREATE TABLE COMMENTS(
-- Id int identity primary key,
-- Description nvarchar(250) NOT NULL,
-- BookId int References BOOKS(Id),
-- Rating tinyint CHECK(Rating between 0 and 5),
-- Name nvarchar(50)NOT NULL,
-- Email nvarchar(max)NOT NULL,
-- ImageUrl nvarchar(max),
-- IsDeleted bit DEFAULT 0
--)



CREATE PROCEDURE InsertAllData
(
	--Categories table
	@Title nvarchar(150),
	@ParentCategoryId int,
	@IsDeleted bit 
	
    --  BOOKS table
    @BookTitle nvarchar(150),
    @Description nvarchar(250),
    @ActualPrice int,
    @DiscountPrice int,
    @PublishingHouseId int,
    @StockCount int,
    @ArticleCode int,
    @BindingId int,
    @Pages int,
    @CategoryId int,
    @IsDeleted bit

    --  AUTHORS table
    @AuthorName nvarchar(50),
    @AuthorSurname nvarchar(50),
    @IsAuthorDeleted bit

	--BookAuthors Table
	@BookId int,
	@AuthorId int
    -- COMMENTS table
    @CommentDescription nvarchar(250),
    @BookId int,
    @Rating tinyint,
    @CommentName nvarchar(50),
    @CommentEmail nvarchar(max),
    @CommentImageUrl nvarchar(max),
    @IsCommentDeleted bit
)
AS
BEGIN
	INSERT INTO BOOKSAUTHORS(
	BookId ,
	AuthorId 
	)
	VALUES(
	@BookId,
	@AuthorId 
	)
	INSERT INTO CATEGORIES(
	TITLE,
	PARENTCATEGORYID
	)
	VALUES(
	@TITLE,
	@PARENTCATEGORYID
	)
    INSERT INTO BOOKS
    (
        Title,
        Description,
        ActualPrice,
        DiscountPrice,
        PublishingHouseId,
        StockCount,
        ArticleCode,
        BindingId,
        Pages,
        CategoryId
    )
    VALUES
    (
        @BookTitle,
        @Description,
        @ActualPrice,
        @DiscountPrice,
        @PublishingHouseId,
        @StockCount,
        @ArticleCode,
        @BindingId,
        @Pages,
        @CategoryId
    );

    INSERT INTO AUTHORS
    (
        Name,
        Surname
    )
    VALUES
    (
        @AuthorName,
        @AuthorSurname
    );


    INSERT INTO COMMENTS
    (
        Description,
        BookId,
        Rating,
        Name,
        Email,
        ImageUrl
    )
    VALUES
    (
        @CommentDescription,
        @BookId,
        @Rating,
        @CommentName,
        @CommentEmail,
        @CommentImageUrl
    );
END


