-- ���� ��������
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL
);

-- ���� ������
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    CategoryID INT NOT NULL,
    Description NVARCHAR(MAX),
    Price DECIMAL(18, 2) NOT NULL,
    Image NVARCHAR(MAX),
    StockQuantity INT NOT NULL,
    LastUpdated DATETIME NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- ���� ������
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(15),
    Email NVARCHAR(100),
    BirthDate DATE
);

-- ���� �����
CREATE TABLE Purchases (
    PurchaseID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    PurchaseDate DATETIME NOT NULL DEFAULT GETDATE(),
    Note NVARCHAR(MAX),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
ALTER TABLE Purchases
ADD TotalAmount DECIMAL(18, 2) NOT NULL DEFAULT 0.00;

DBCC CHECKIDENT ('Purchases', RESEED, 984321432);


-- ���� ���� ����
CREATE TABLE PurchaseDetails (
    PurchaseDetailID INT PRIMARY KEY IDENTITY(1,1),
    PurchaseID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (PurchaseID) REFERENCES Purchases(PurchaseID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-----------------------------------
-- ������ ����� ������ �������
-- ����� ���� ��������
INSERT INTO [dbo].[Categories] ([Name]) VALUES ('������');
INSERT INTO [dbo].[Categories] ([Name]) VALUES ('������');
INSERT INTO [dbo].[Categories] ([Name]) VALUES ('����');
INSERT INTO [dbo].[Categories] ([Name]) VALUES ('������');
INSERT INTO [dbo].[Categories] ([Name]) VALUES ('�����');

-- ����� ���� ������ 
---------------------������
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('M�A�CXIMAL SILKY MATTE LIPSTICK', 1, '����� �� ���� ������ ���. ��� ������ ���� ������ �������� ������� ������ ���. ���� �� �-12 ����, ������ �� ������� ������ ����� ����� ���.', 115.00, '������_1.webp', 200, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('M�A�C Locked Kiss 24hr Lipstick', 1, '����� ���� �� 24 ����, ��� ������ ������ ������ ���. ���� �� ������. ���� �����.', 150.00, '������_2.webp', 150, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('M�A�CXIMAL SILKY MATTE VIVA GLAM LIPSTICK', 1, '����� ��� �� ����.100% ������� ������ VIVA GLAM ������ ������ ������ ������ ������ ����� ���� ���', 115.00, '������_3.webp', 100, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Squirt Plumping Gloss Stick', 1, '����� ���� ������ ���� �����. ����� ������ ���� �����.����� ������� ����� ��� ������. ���� ����.', 115.00, '������_4.webp', 50, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Locked Kiss Ink 24HR Lipcolour', 1, '������ ������ ������ �� ������ ������ ������ ���.����� ����� ����� �� �������. ���� �� �-24����, �� ������ �����. ���� �����.', 150.00, '������_5.webp', 20, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Cremesheen Lipstick', 1, '����� ��� ������� ������, ������ �����.����� ������� �� M�A�C ����� ������ ������ ������� ������ ����� ������ ��� ����� 40', 115.00, '������_6.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Powder Kiss Velvet Blur Slim Stick', 1, '����� ����� ����� ������ ��� ������, ����� ����� ������ ���� ������ ������ ���. ���� �� �-12 ����.', 110.00, '������_7.webp', 70, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Lustreglass Lipstick', 1, '����� ������ ������� ����� ��� ������ ����� �������.���� ����� ���. ������� ����� ������ ���� ���� ��� ���� ���.', 120.00, '������_8.webp', 32, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Locked Kiss Ink 24HR Lipcolour', 1, '������ ������ ������ �� ������ ������ ������ ���.����� ����� ����� �� �������. ���� �� �-24����, �� ������ �����. ���� �����.', 150.00, '������_9.webp', 22, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Powder Kiss Liquid Lipcolour', 1, '����� ����� ��� ���� ����� ������ ���� �� �������, ��� ����� ��� �� ����� ����� ������� �� 10 ����.', 120.00, '������_10.webp', 50, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Retro Matte Liquid Lipcolour', 1, '����� ����� ���� ��� ������ �� ������ ��� ������. ����� ���� ����� �������.', 135.00, '������_11.webp', 25, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Retro Matte Liquid Lipcolour Metallics', 1, '����� ����� ����� ������, ������ ����� ��� ������ ��� �����, ����� �����.', 140.00, '������_12.webp', 11, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Lip Pencil', 1, '������ ������, ����� ������ �� �������. ���� ������ ��� �� ������', 110.00, '������_13.webp', 158, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Retro Matte Liquid Lipcolour Metallics', 1, '����� ����� ����� ������, ������ ����� ��� ������ ��� �����, ����� �����.', 135.00, '������_14.webp', 26, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Lipglass with Tint', 1, '���� ������ ��� �� ����� ������ ����� ���� ������ �� ���� ����.', 110.00, '������_15.webp', 100, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Dazzleglass', 1, '����� ������ ���� ���� ������ ������� ������ ������� ���.', 119.00, '������_16.webp', 0, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Cremesheen Glass', 1, '����� ������ ������� ����� ��� ���� ���� �� ������� �� ���� ������ �� ����.', 120.00, '������_17.webp', 1, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('M�A�CXIMAL SILKY MATTE LIPSTICK / MINI M�A�C', 1, '����� �� ���� ������ ���. ��� ������ ���� ������ ����� ��� ������� ������ ���. ���� �� �-12 ����, ������ �� ������� ������ ����� ����� ���.���� ����� ���� ������ ���� ��� ����', 60.00, '������_18.webp', 10, GETDATE());
--------------������
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('M�A�CStack Waterproof Mascara', 2, 'M�A�Cstack ������ ������� ����� ����� ������� ����� ����, �� 24 ����! ����� ����� ���� ��� ����� �� ����. ���������� ����� �������� ���� ����� ������ ������� ������ ������� �� �� ��� ����.', 127.00, '������_1.webp', 30, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('M�A�C Pro Locked Brow Gel', 2,'� ���� ���� ���� �� 12 ����, �� ���� ���� �����.����� ������� ������� ���� ������ ������ ���� �����. ���� ����� �� ������.', 130.00, '������_2.webp', 11, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('M�A�CStack Mascara', 2, '������ ����� ����� ��� ��� ����� ���� ����, ����� ������ ��� �������� �����.����� ���� ������, MEGA ������� ������ ������� �� ������ �-MICRO ������� ������ ������� �� �����.', 127.00, '������_3.webp', 20, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Lash Dry Shampoo Mascara Refresher', 2, '���� ������ ����� ��� ������ ����� ����� ��� ������. �������, ����� ���� ������ ������ ����� ����, ����� ���, ����� ����� ����.', 114.00, '������_4.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('M�A�C Colour Excess Gel Pencil Eye Liner', 2, '������� ������ ������ ����. ���� ������ ������ ������ ��.���� ���� �-24 ���� �� �������� ��� �-12 ���� ��� ����', 120.00, '������_5.webp', 8, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('In Extreme Dimension 3D Black Lash Mascara', 2, '����� ����� ���� ��� ���� ����� ����� ������� ��� ������ ������ �� ������.', 114.00, '������_6.webp.webp', 20, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('In Extreme Dimension Waterproof Mascara', 2, '����� ����� ���� ��� ���� ����� ����� ������� ��� ������ ������ �� ������.', 114.00, '������_7.webp', 8, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Brushstroke 24-Hour Liner', 2, '�������� ��� �� ��� �����, ���� �� 24 ����', 120.00, '������_8.webp', 2, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Prep + Prime Highlighter', 2, '������ ��� �����, ������ ���� ����� ����� �� ���� ���� �����', 155.00, '������_9.webp', 8, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Dazzleshadow Liquid', 2, '������ ��� �����, ������ ���� ����� ����� �� ���� ���� �����', 125.00, '������_10.webp', 12, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Dazzleshadow', 2, '����� ����� ������� ����� ����� ���, ������� ���� ������ ������.', 120.00, '������_11.webp', 80, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Powder Kiss Soft Matte Eye Shadow', 2, '������ ���� ������ ��� ����� ������� ����� ������ ���� ������ �������', 110.00, '������_12.webp', 9, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Extra Dimension Eye Shadow', 2, '����� ���� ������ ���� ���� ���, ������ ����� ���� ��� ����� ���.', 130.00, '������_13.webp', 0, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Eye Shadow', 2, '����� ���� ������ �� ����� ����� ������ �����.', 105.00, '������_14.webp', 1, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Dazzleshadow Extreme', 2, '����� ������ ���� ����� ������ ������ ��� ������� �� 12 ����. ', 120.00, '������_15.webp', 0, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Cream Colour Base', 2, '���� �� ������ ��� ������� ����� ���� �� ��� ������ ���� �����.', 145.00, '������_16.webp', 2, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Chromaline', 2, '������ ��/ ��� ������� ������ ������� �������� �������� �� ����� �� ����.', 150.00, '������_17.webp', 33, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('PRO LONGWEAR PAINT POT', 2, '����� ����� ����� ����� ���, �� 24 ����, ����� �� ������� ������� �� ���� ������, ����� ����� ��� �� ������ �� ������ ������.', 165.00, '������_18.webp', 21, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Connect In Colour Eye Shadow Palette: Hi-Fi Colour', 2, '���� 12 ������ ������ ��� �������� ������� ������ ��� ������ ���, ������� ����� ����� ������ �� ��������� ���.', 299.00, '������_19.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Connect In Colour Eye Shadow Palette: Future Flame', 2, '���� 12 ������ ������ �� ����� ������� ������ ��� ������ ���, ������� ����� ����� ��� ������� ��� �������.', 299.00, '������_20.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Connect In Colour Eye Shadow Palette: Rose Lens', 2, '���� 6 ������ ������ ���� �������� ������� ������ ��� ������ ���, ������� ����� ����� ��� ������� ��� ��������.', 255.00, '������_21webp', 5, GETDATE());
--------------����
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Studio Fix Powder Plus Foundation
', 3, '������ ����� ������ ���� ���� ���� ����� ��� ������
���.
����� �� 12 ���� �� ����� ��� �������, ����� �������
���� ���� ����� ��������.', 200.00, 'face1.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Studio Fix Fluid SPF 15 24HR Matte Foundation + Oil Control
', 3, '������ ���� �� 24 ����, �� ����,  ��� ����� ��� �� �����.
����� �-71 ������ �������� ��� ���� ������ ����.', 210.00, 'face2.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Studio Radiance Serum-Powered� Foundation
', 3, '������ ���� ����� ������ �����. ���� ������ �� ����. ����� ����� ������ �� ��� ����� ������ ������. ���� ������ �� ��� ����� ���� (�-209%), ����� ���� ���� �����.
', 220.00, 'face3.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Studio Fix 24-Hour Smooth Wear Concealer
', 3, '������� ����� �� ����. ����� ����� ������-��� ����� ������ ������ ������ ��� ����. ���� �� �������� ��� ��� ����� ����� ������.
', 130.00, 'face4.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Studio Fix Every-Wear All-Over Face Pen
', 3, '���� ���� �� ������ � �� ������� �������, ������ �� ��
������ ����� ������ ������ �����. ���� �� �-36 ����, ��
���� ��� �������. ����� ����� ������-��� ����� ������ ������.
���� ����� ��� ����.', 180.00, 'face5.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('STUDIO RADIANCE 24HR LUMINOUS LIFT CONCEALER
', 3, '������� �� ���� ������ ���� �����.
����� ����� ������ ����� ������. ���� �� 24 ����.  ����� ���� ������ �� 90%* ������ �� ���� ������� ���� ������� �-18%** ����� ���.', 130.00, 'face6.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('SKINFINISH SUNSTRUCK RADIANT BRONZER
', 3, '������ ������ ���� ����� ������ ������ ����� ���� �����, ����� ������ ������ ������ ���� ������ �� ���.
', 180.00, 'face7.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('SKINFINISH SUNSTRUCK MATTE BRONZER
', 3, '������ ������ ��� �� ������ ������ ����� ���� �����, ����� ������ ������ ������ ���� ������ �� ���.
', 180.00, 'face8.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('GLOW PLAY CUSHIONY BLUSH
', 3, '���� ���� ����� ������ ����� ����� ������ ����. ������� ����� ������ ������ ������� �� ����.
', 180.00, 'face9.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Mineralize Skinfinish
', 3, '���� ������� ����� ����� ����� ������ ����, ���� ���� ������. ������ ���� ����� �������.
', 180.00, 'face10.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Extra Dimension Skinfinish
', 3, '���� ������� ������ ���� ����� ����. ������� ������� ������ ���� ����� ����� "����" �� ����.
', 190.00, 'face11.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Cream Colour Base
', 3, '���� �� ������ ��� ������� ����� ���� �� ��� ������ ���� �����.
', 190.00, 'face12.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Mineralize Skinfinish Natural
', 3, '����� ����� ����� ������. ����� �������� �������� ������ ����� ���� ���-�����. ����� �� ������ �������� �������� �� ��� ������� E.
', 195.00, 'face13.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Studio Fix Pro Set + Blur Weightless Loose Powder
', 3, '����� ����� ������� ������� ������ ������.
������ ���� ��� ����, ����� ���� ���� ������� ������� ���� �������� ������ ����.', 195.00, 'face14.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Blot Powder/Pressed
', 3, '����� ����� ������� �������� ���� ������� ���� ������ ��, ���� ����� ���� ������.
', 195.00, 'face15.webp', 10, GETDATE());

-------------------------------������
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('143S Bronzer Fan Brush
', 4, '����� ����� ������� ����� ������, ����� ������ ����� ������ �� ������.
',210, 'brushes1.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('184S Duo Fibre Fan
', 4, '����� ����� ����� �����. ������ ����� ����� �� ����� ����.
',145, 'brushes2.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('127S Split Fibre Face
', 4, '����� ���� �� �������, ������ ��� ���� �����: ��� ��� ����� ������ ����� ������ ����, ���� ��� ����� �������� ������ ������.
',145, 'brushes3.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('159S Duo Fibre Blush
', 4, '����� ���� ����� ���� ������� �� ������ ������.
',125, 'brushes4.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('195 Synthetic Concealer Brush
', 4, '����� ������� ���� ��� ����� ��� ��������� ������� ������ �� �������� ������� ������� ������ ���.
',145, 'brushes5.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('182S Buffer', 4, '����� ����� ������ ������',165, 'brushes6.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('191 Square Foundation Brush', 4, '����� �����, ����� �������� ������ �������� ������ ������ �� ����-��.
',125, 'brushes7.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('127S Split Fibre Face
', 4, '����� ���� �� �������, ������ ��� ���� �����: ��� ��� ����� ������ ����� ������ ����, ���� ��� ����� �������� ������ ������.
',145, 'brushes8.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('190 Synthetic Foundation Brush
', 4, '����� ����-�� ������ ����� ����� ������ ����� ���� ���� ��� ����� �����.
',205, 'brushes9.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('230S Multipurpose Detailing Brush', 4, '����� ����� �����',105, 'brushes10.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('204 Synthetic Lash Brush
', 4, '����� ������� ����� ������, ����� ��� ������ ������ ���� �� ���� ����.
',125, 'brushes11.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('001 SERUM + MOISTURIZER BRUSH', 4, '����� ������� ������, ������� ������ ������ ���� ���.'
,125, 'brushes12.webp', 5, GETDATE());
------------------------�����
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Prep + Prime Fix+ Matte', 5, '����� ���� ������ ���� ����� ��� ������ �� ���� ���� ���� ���� �� ��� ���� ���������.',
130, 'Cultivation1.webp', 2, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Gently Off Eye and Lip Makeup Remover', 5, '���� ���� ������ �������� �� ����� �� ��� ���� ����� ����� ���� ������ ������ ����.',
120, 'Cultivation2.webp', 7, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Serumizer', 5, '���� ���� ������� ������ ���� ������ ����������, ����� ���� ��������, ���� �� ���� ����
����� �� ����� ����.
����� ������ ���� �����: 12% ����� ���������� ������� ����� ����, 4% ��������� ������ ���� ����,
������� ������ ����� ����, ����� ������ ����� ����� ������ ���� ���� ������ ����.
����� ��� ���� ��� �����.',
145, 'Cultivation3.webp', 25, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Hyper Real Skincanvas Balm
', 5, '��� ���� ������ ������ �� ����� ����. ����� �� ���� ����� ���� ������ ���.����� ����� ����� �����. ���� ���� ����, ��, ���� ������. ���� �� ����� ���� ������ �������.',
100, 'Cultivation4.webp', 7, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Hyper Real Fresh Canvas Cream-To-Foam Cleanser
', 5, '��� ����� ���� �������. ���� ����� ������� �� ���� ��� ����� �� ����� ���� ����� ����� ����. ����� �� ���� ������ ������ �� ���� ����� ���� ����� ���.',
155, 'Cultivation5.webp', 7, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Hyper Real Fresh Canvas Cleansing Oil
', 5, '��� ����� ���� �� �������, ����� ������� ����� ����, ������ ����� ����. ����� �� ���� �� ������ ���� ����� ���� ���. ���� ������ ���� ���� �������� ������. ���� �� ����� ���� ������ �������.',
130, 'Cultivation6.webp', 5, GETDATE());
--����� ���� �� ��� ������ �������� ���� ����� ������ �� ���
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Strobe Dewy Skin Tint', 5, '��� ���� ��� ���� ������ ���� ����, ��� ������� ���������� �������. ����� ������ ����������, ���� ����, ������� �-������ E.',
105, 'Cultivation7.webp', 12, GETDATE());
--��� ������: ����� ������ ������ ��� ����� ������� �� �����.
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Strobe Cream
', 5, '��� ���� ������ ��� ���� ����� ���� ����� �������� ������� ���������.',
100, 'Cultivation8.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Complete Comfort Creme
', 5, '���� ������ �� ���� ������ ������� �������� ������ ����.',
110, 'Cultivation9.webp', 9, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Prep + Prime Essential Oils Grapefruit & Chamomile
', 5, '��� ������� ������ ���� �� ���� �����, ����� �� ����� ���� ������ ������ �� ���� ����.',
150, 'Cultivation10.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Mineralize Timecheck Lotion
', 5, '����� ���� ����� �������� ����� ��� ���� ������ ����� ��������.',
105, 'Cultivation11.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Fix+ Stay Over
', 5, '����� ������ ����� ������� ������� �� �-16 ����.
����� ����, ��� ���� �� ���� ���� ��� ���� ������ ������.
���� �������.',
120, 'Cultivation12.webp', 8, GETDATE());




-- ����� ���� ������
INSERT INTO [dbo].[Customers] ([Name], [Phone], [Email], [BirthDate]) 
VALUES ('��� ���', '055-7872946', 'sara2946@gmail.com', '2000-10-06');
INSERT INTO [dbo].[Customers] ([Name], [Phone], [Email], [BirthDate]) 
VALUES ('���� ���', '058-3252111', 'rivka111@gmail.com', '1995-10-29');
INSERT INTO [dbo].[Customers] ([Name], [Phone], [Email], [BirthDate]) 
VALUES ('�� ��� ��������', '058-3272946', 'b0556772946@gmail.com', '2004-11-12');

-- ���� �����
INSERT INTO [dbo].[Purchases] ([CustomerID], [PurchaseDate], [Note]) 
VALUES (1, GETDATE(), '����� ��� ����');
INSERT INTO [dbo].[Purchases] ([CustomerID], [PurchaseDate], [Note]) 
VALUES (2, GETDATE(), '����� ������');

-- ���� ���� ����
INSERT INTO [dbo].[PurchaseDetails] ([PurchaseID], [ProductID], [Quantity]) 
VALUES (PurchaseID, ProductID, Quantity);

--DELETE FROM Purchases;
DELETE FROM Products;







