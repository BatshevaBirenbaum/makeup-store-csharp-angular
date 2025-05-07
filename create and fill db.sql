-- טבלת קטגוריות
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL
);

-- טבלת מוצרים
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

-- טבלת לקוחות
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(15),
    Email NVARCHAR(100),
    BirthDate DATE
);

-- טבלת קניות
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


-- טבלת פרטי קניה
CREATE TABLE PurchaseDetails (
    PurchaseDetailID INT PRIMARY KEY IDENTITY(1,1),
    PurchaseID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (PurchaseID) REFERENCES Purchases(PurchaseID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-----------------------------------
-- תבניות הכנסת נתונים לטבלאות
-- מילוי טבלת קטגוריות
INSERT INTO [dbo].[Categories] ([Name]) VALUES ('שפתיים');
INSERT INTO [dbo].[Categories] ([Name]) VALUES ('עיניים');
INSERT INTO [dbo].[Categories] ([Name]) VALUES ('פנים');
INSERT INTO [dbo].[Categories] ([Name]) VALUES ('מברשות');
INSERT INTO [dbo].[Categories] ([Name]) VALUES ('טיפוח');

-- מילוי טבלת מוצרים 
---------------------שפתיים
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('M·A·CXIMAL SILKY MATTE LIPSTICK', 1, 'שפתון רך כמשי בגימור מאט. בעל פיגמנט עשיר המעניק שטיפתצבע עוצמתית במריחה אחת. עמיד עד ל-12 שעות, ומותיר את השפתיים נעימות ורכות לאורך זמן.', 115.00, 'שפתיים_1.webp', 200, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('M·A·C Locked Kiss 24hr Lipstick', 1, 'שפתון עמיד עד 24 שעות, בעל פיגמנט עוצמתי בגימור מאט. עמיד גם בנשיקה. אינו מכתים.', 150.00, 'שפתיים_2.webp', 150, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('M·A·CXIMAL SILKY MATTE VIVA GLAM LIPSTICK', 1, 'שפתון מאט רך כמשי.100% מהכנסות שפתוני VIVA GLAM עוברות לתרומה לקידום שיווין זכויות ועתיד בריא לכל', 115.00, 'שפתיים_3.webp', 100, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Squirt Plumping Gloss Stick', 1, 'שפתון לחות בגימור גלוס מבריק. מועשר ברכיבי לחות והזנה.מעניק לשפתייך נגיעת צבע שקפקפה. אינו דביק.', 115.00, 'שפתיים_4.webp', 50, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Locked Kiss Ink 24HR Lipcolour', 1, 'השפתון הנוזלי שיעניק לך פיגמנט עוצמתי בגימור מאט.מותיר תחושה נעימה על השפתיים. עמיד עד ל-24שעות, גם בנשיקה ובמים. אינו מכתים.', 150.00, 'שפתיים_5.webp', 20, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Cremesheen Lipstick', 1, 'שפתון בעל פורמולה באלמית, בגימור גלוסי.בגוון אייקוני של M·A·C שחוזר באריזה מיוחדת במהדורה מוגבלת לכבוד חגיגות יום הולדת 40', 115.00, 'שפתיים_6.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Powder Kiss Velvet Blur Slim Stick', 1, 'שפתון מועשר בלחות המעניק צבע עוצמתי, הרגשה נעימה וקלילה ומגע קטיפתי במריחה אחת. עמיד עד ל-12 שעות.', 110.00, 'שפתיים_7.webp', 70, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Lustreglass Lipstick', 1, 'שפתון המעניק לשפתיים שטיפת צבע בגימור מבריק ויוקרתי.עמיד לאורך זמן. פורמולה קלילה מועשרת בשמן זרעי פטל ושמן זית.', 120.00, 'שפתיים_8.webp', 32, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Locked Kiss Ink 24HR Lipcolour', 1, 'השפתון הנוזלי שיעניק לך פיגמנט עוצמתי בגימור מאט.מותיר תחושה נעימה על השפתיים. עמיד עד ל-24שעות, גם בנשיקה ובמים. אינו מכתים.', 150.00, 'שפתיים_9.webp', 22, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Powder Kiss Liquid Lipcolour', 1, 'שפתון נוזלי בעל מרקם מוקצף המעניק מראה רך ומטושטש, בעל גימור מאט אך הרגשה נעימה ולחותית עד 10 שעות.', 120.00, 'שפתיים_10.webp', 50, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Retro Matte Liquid Lipcolour', 1, 'שפתון נוזלי עמיד בעל פיגמנט עז בגימור מאט עוצמתי. מעניק מראה מודגש לשפתיים.', 135.00, 'שפתיים_11.webp', 25, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Retro Matte Liquid Lipcolour Metallics', 1, 'שפתון במרקם נוזלי קטיפתי, המעניק נגיעת צבע בגימור מאט מטאלי, שנשאר ונשאר.', 140.00, 'שפתיים_12.webp', 11, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Lip Pencil', 1, 'עיפרון לתיחום, הגדרה ומילוי של השפתיים. מוצע במגוון רחב של גוונים', 110.00, 'שפתיים_13.webp', 158, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Retro Matte Liquid Lipcolour Metallics', 1, 'שפתון במרקם נוזלי קטיפתי, המעניק נגיעת צבע בגימור מאט מטאלי, שנשאר ונשאר.', 135.00, 'שפתיים_14.webp', 26, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Lipglass with Tint', 1, 'גלוס במגוון רחב של צבעים המעניק גימור דמוי זכוכית או בוהק עדין.', 110.00, 'שפתיים_15.webp', 100, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Dazzleglass', 1, 'שפתון המנצנץ באור בוהק ומעניק מימדיות מיוחדת לשפתיים שלך.', 119.00, 'שפתיים_16.webp', 0, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Cremesheen Glass', 1, 'גימור ייחודי לשפתיים המשלב בין מרקם קרמי של ליפסטיק עם הברק המוגבר של גלוס.', 120.00, 'שפתיים_17.webp', 1, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('M·A·CXIMAL SILKY MATTE LIPSTICK / MINI M·A·C', 1, 'שפתון רך כמשי בגימור מאט. בעל פיגמנט עשיר המעניק שטיפת צבע עוצמתית במריחה אחת. עמיד עד ל-12 שעות, ומותיר את השפתיים נעימות ורכות לאורך זמן.מגיע בגודל מיני שתוכלי לקחת לכל מקום', 60.00, 'שפתיים_18.webp', 10, GETDATE());
--------------עיניים
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('M·A·CStack Waterproof Mascara', 2, 'M·A·Cstack לבניית אינספור שכבות עכשיו פורמולה עמידה במים, עד 24 שעות! למראה ריסים מלאי נפח לאורך כל היום. טכנולוגיית ההגנה הייחודית דוחה חדירת נוזלים ומבטיחה עמידות עוצמתית על כל ריס וריס.', 127.00, 'עיניים_1.webp', 30, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('M·A·C Pro Locked Brow Gel', 2,'ל גבות שקוף עמיד עד 12 שעות, גם בפני זיעה ולחות.מברשת ייחודית המאפשרת דיוק ושליטה בעיצוב שיער הגבות. אינו מתקשה או מתפורר.', 130.00, 'עיניים_2.webp', 11, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('M·A·CStack Mascara', 2, 'המסקרה למראה ריסים מלא נפח ואורך יוצא דופן, ניתנת לבנייה ללא היווצרות גושים.מגיעה בשתי גרסאות, MEGA המתאימה לריסים עליונים או ארוכים ו-MICRO המתאימה לריסים תחתונים או קצרים.', 127.00, 'עיניים_3.webp', 20, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Lash Dry Shampoo Mascara Refresher', 2, 'מוצר מהפכני להנחה מעל המסקרה המשמש כשמפו יבש לריסים. לריענון, עיצוב מחדש והעצמת הריסים במהלך היום, מעניק נפח, הפרדה ואפקט מידי.', 114.00, 'עיניים_4.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('M·A·C Colour Excess Gel Pencil Eye Liner', 2, 'עפרונות עיניים עמידים במים. בעלי פיגמנט עוצמתי במירקם גל.עמיד יותר מ-24 שעות על העפעפיים ועד ל-12 שעות בקו המים', 120.00, 'עיניים_5.webp', 8, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('In Extreme Dimension 3D Black Lash Mascara', 2, 'מסקרה בגוון שחור פחם בעלת מברשת גדולה המעניקה נפח עוצמתי ומעגלת את הריסים.', 114.00, 'עיניים_6.webp.webp', 20, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('In Extreme Dimension Waterproof Mascara', 2, 'מסקרה בגוון שחור פחם בעלת מברשת גדולה המעניקה נפח עוצמתי ומעגלת את הריסים.', 114.00, 'עיניים_7.webp', 8, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Brushstroke 24-Hour Liner', 2, 'אייליינר טוש עם קצה מחודד, עמיד עד 24 שעות', 120.00, 'עיניים_8.webp', 2, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Prep + Prime Highlighter', 2, 'פריימר טוש להארה, המעניק לעור נגיעה מוארת של גוון עדין וקליל', 155.00, 'עיניים_9.webp', 8, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Dazzleshadow Liquid', 2, 'פריימר טוש להארה, המעניק לעור נגיעה מוארת של גוון עדין וקליל', 125.00, 'עיניים_10.webp', 12, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Dazzleshadow', 2, 'צללית עשירה בפיגמנט שנשאר לאורך זמן, המעניקה מראה יפייפה ומנצנץ.', 120.00, 'עיניים_11.webp', 80, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Powder Kiss Soft Matte Eye Shadow', 2, 'צלליות רכות בגימור מאט בעלות טקסטורה קרמית ליצירת מראה יפייפה ומטושטש', 110.00, 'עיניים_12.webp', 9, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Extra Dimension Eye Shadow', 2, 'צללית אבקה המשלבת מרקם קרמי חלק, מטשטשת בקלות כמעט כמו צללית קרם.', 130.00, 'עיניים_13.webp', 0, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Eye Shadow', 2, 'צללית בעלת פיגמנט רב להנחה אחידה וטשטוש מעולה.', 105.00, 'עיניים_14.webp', 1, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Dazzleshadow Extreme', 2, 'צללית ליצירת מראה מטאלי עוצמתי במריחה אחת ועמידות עד 12 שעות. ', 120.00, 'עיניים_15.webp', 0, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Cream Colour Base', 2, 'מוצר רב שימושי בעל פורמולה קרמית ורכה עם צבע וגימור שקוף וזוהר.', 145.00, 'עיניים_16.webp', 2, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Chromaline', 2, 'איילנר גל/ קרם אידיאלי ליצירת עיצובים מדוייקים ומורכבים על הפנים או הגוף.', 150.00, 'עיניים_17.webp', 33, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('PRO LONGWEAR PAINT POT', 2, 'צללית קרמית עמידה לאורך זמן, עד 24 שעות, משמשת גם כפריימר ומתמזגת עם העור בשלמות, שניתן ללבוש לבד או בשילוב עם מוצרים נוספים.', 165.00, 'עיניים_18.webp', 21, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Connect In Colour Eye Shadow Palette: Hi-Fi Colour', 2, 'פלטת 12 צלליות בגווני קשת צבעוניים המעניקה פיגמנט מלא במריחה אחת, לאינסוף מראות איפור שיציתו את היצירתיות שלך.', 299.00, 'עיניים_19.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Connect In Colour Eye Shadow Palette: Future Flame', 2, 'פלטת 12 צלליות בגווני אש ואדמה המעניקה פיגמנט מלא במריחה אחת, לאינסוף מראות איפור החל מעדינים ועד דרמטיים.', 299.00, 'עיניים_20.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Connect In Colour Eye Shadow Palette: Rose Lens', 2, 'פלטת 6 צלליות בגווני ורוד רומנטיים המעניקה פיגמנט מלא במריחה אחת, לאינסוף מראות איפור החל מעדינים ועד עוצמתיים.', 255.00, 'עיניים_21webp', 5, GETDATE());
--------------פנים
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Studio Fix Powder Plus Foundation
', 3, 'מייקאפ פודרה המעניק מראה אחיד לעור הפנים כבר בנגיעה
אחת.
מעניק עד 12 שעות של גימור מאט לחלוטין, מנטרל שומניות
וברק מבלי לאטום נקבוביות.', 200.00, 'face1.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Studio Fix Fluid SPF 15 24HR Matte Foundation + Oil Control
', 3, 'מייקאפ עמיד עד 24 שעות, קל משקל,  בעל גימור מאט רך וטבעי.
עכשיו ב-71 גוונים המיועדים לכל גוני ומרקמי העור.', 210.00, 'face2.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Studio Radiance Serum-Powered™ Foundation
', 3, 'מייקאפ סרום מועשר ברכיבי טיפוח. מרכך ומחליק את העור. מעניק כיסוי בינוני עד מלא הניתן לבנייה בשכבות. משפר מיידית את רמת הלחות בעור (ב-209%), ויוצר מראה קורן וזוהר.
', 220.00, 'face3.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Studio Fix 24-Hour Smooth Wear Concealer
', 3, 'קונסילר נוזלי קל משקל. מאפשר כיסוי בינוני-מלא הניתן לבנייה בשכבות בגימור מאט טבעי. מגיע עם אפליקטור בעל קצה ספוגי להנחה מדויקת.
', 130.00, 'face4.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Studio Fix Every-Wear All-Over Face Pen
', 3, 'מוצר פנים דו שימושי – עט קונסילר ומייקאפ, המעניק לך את
השליטה המלאה ליצירת הכיסוי הרצוי. עמיד עד ל-36 שעות, גם
בפני מים ומריחות. מעניק כיסוי בינוני-מלא הניתן לבנייה בשכבות.
מציע גימור מאט טבעי.', 180.00, 'face5.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('STUDIO RADIANCE 24HR LUMINOUS LIFT CONCEALER
', 3, 'קונסילר קל משקל בגימור זוהר וטבעי.
מעניק כיסוי בינוני הניתן לבנייה. עמיד עד 24 שעות.  מוסיף לחות מיידית של 90%* ומפחית את מראה הכהויות מתחת לעיניים ב-18%** לאורך זמן.', 130.00, 'face6.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('SKINFINISH SUNSTRUCK RADIANT BRONZER
', 3, 'ברונזר בגימור קורן וזוהר המעניק חמימות והארה לעור הפנים, במבחר גוונים הנוצרו בשיתוף אמני האיפור של מאק.
', 180.00, 'face7.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('SKINFINISH SUNSTRUCK MATTE BRONZER
', 3, 'ברונזר בגימור מאט רך המעניק חמימות ועומק לעור הפנים, במבחר גוונים הנוצרו בשיתוף אמני האיפור של מאק.
', 180.00, 'face8.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('GLOW PLAY CUSHIONY BLUSH
', 3, 'סומק קרמי וגמיש המעניק הסמקה טבעית בגימור זוהר. פורמולה קלילה המכילה רכיבים שמטפחים את העור.
', 180.00, 'face9.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Mineralize Skinfinish
', 3, 'שימר הילייטר בצורת פודרה אפויה בתהליך איטי, בעלת מרקם יוקרתי. להענקת זוהר מטאלי ועוצמתי.
', 180.00, 'face10.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Extra Dimension Skinfinish
', 3, 'שימר הילייטר להענקת זוהר מושלם לעור. פורמולה היברדית היוצרת מראה מבריק וכמעט "רטוב" על העור.
', 190.00, 'face11.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Cream Colour Base
', 3, 'מוצר רב שימושי בעל פורמולה קרמית ורכה עם צבע וגימור שקוף וזוהר.
', 190.00, 'face12.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Mineralize Skinfinish Natural
', 3, 'פודרה אפויה במרקם יוקרתי. מכילה פיגמנטים פנינתיים ליצירת גימור טבעי ורב-מימדי. מכילה את תרכובת המינרלים הייחודית של מאק וויטמין E.
', 195.00, 'face13.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Studio Fix Pro Set + Blur Weightless Loose Powder
', 3, 'פודרה שקופה בתפזורת המסייעת בקיבוע האיפור.
מעניקה מראה מאט טבעי, סופחת שומן וברק ביעילות ומטשטשת מראה נקבוביות ופגמים בעור.', 195.00, 'face14.webp', 10, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Blot Powder/Pressed
', 3, 'פודרה דחוסה המנטרלת שמנוניות וברק המוסיפה גוון וכיסוי קל, בעלת גימור קליל במיוחד.
', 195.00, 'face15.webp', 10, GETDATE());

-------------------------------מברשות
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('143S Bronzer Fan Brush
', 4, 'מברשת מניפה סינטטית בגודל בינוני, עוצבה במיוחד להנחה וטשטוש של ברונזר.
',210, 'brushes1.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('184S Duo Fibre Fan
', 4, 'מברשת שטוחה בצורת מניפה. מתאימה להנחה עדינה של מוצרי אבקה.
',145, 'brushes2.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('127S Split Fibre Face
', 4, 'מברשת פנים רב שימושית, המשלבת שני סוגי סיבים: בצד אחד סיבים צפופים להנחה ומריחת חומר, ובצד שני סיבים מאווררים לטשטוש ומיזוג.
',145, 'brushes3.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('159S Duo Fibre Blush
', 4, 'מברשת סומק להנחה חלקה ומעודנת של פודרות וקרמים.
',125, 'brushes4.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('195 Synthetic Concealer Brush
', 4, 'מברשת סינתטית בעלת קצה מחודד מעט לאפליקציה מדוייקת וטשטוש של פורמולות קונסילר ומוצרים מבוססי קרם.
',145, 'brushes5.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('182S Buffer', 4, 'מברשת קבוקי לטשטוש פודרות',165, 'brushes6.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('191 Square Foundation Brush', 4, 'מברשת גדולה, שטוחה וריבועית מסיבים סינתטיים למריחה וטשטוש של מייק-אפ.
',125, 'brushes7.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('127S Split Fibre Face
', 4, 'מברשת פנים רב שימושית, המשלבת שני סוגי סיבים: בצד אחד סיבים צפופים להנחה ומריחת חומר, ובצד שני סיבים מאווררים לטשטוש ומיזוג.
',145, 'brushes8.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('190 Synthetic Foundation Brush
', 4, 'מברשת מייק-אפ מעוצבת בצורה שטוחה ליצירת גימור אחיד ועור חלק במראה מושלם.
',205, 'brushes9.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('230S Multipurpose Detailing Brush', 4, 'מברשת דקיקה לדיוק',105, 'brushes10.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('204 Synthetic Lash Brush
', 4, 'מברשת ספירלית להנחת מסקרות, הפרדה בין הריסים וסירוק גבות או שיער פנים.
',125, 'brushes11.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('001 SERUM + MOISTURIZER BRUSH', 4, 'מברשת ייעודית לטיפוח, סינתטית ונוצרה בשיתוף אמני מאק.'
,125, 'brushes12.webp', 5, GETDATE());
------------------------טיפוח
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Prep + Prime Fix+ Matte', 5, 'תרסיס קליל המעניק לעור גימור מאט ומרענן את העור בזמן שהוא מאזן את רמת הברק והשומניות.',
130, 'Cultivation1.webp', 2, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Gently Off Eye and Lip Makeup Remover', 5, 'מסיר אפור המורכב מפורמולה דו שלבית של שמן ומים להסרת איפור כולל מוצרים עמידים במים.',
120, 'Cultivation2.webp', 7, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Serumizer', 5, 'סרום לחות היברידי המטשטש מראה כהויות ופיגמנטציה, מצמצם מראה נקבוביות, משפר את מרקם העור
ומחזק את מחסום העור.
מועשר ברכיבי לחות והזנה: 12% חומצה היאלורונית ללכידות הלחות בעור, 4% ניאצינמיד לשיפור מרקם העור,
סרמידים לחיזוק מחסום העור, תמצית פיאוני יפנית נדירה לאיחוד גוון העור והענקת זוהר.
למראה עור פנים חלק וקורן.',
145, 'Cultivation3.webp', 25, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Hyper Real Skincanvas Balm
', 5, 'קרם לחות לחיזוק ושמירה על מחסום העור. מחליק את העור באופן מידי ולאורך זמן.מרגיע ומונע סימני גירוי. העור נראה בריא, רך, זוהר וחיוני. קיים גם בגודל מיני המתאים לנסיעות.',
100, 'Cultivation4.webp', 7, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Hyper Real Fresh Canvas Cream-To-Foam Cleanser
', 5, 'קרם ניקוי עדין ויוקרתי. מנקה ומטהר ביעילות את העור תוך שמירה על איזון ברמת הלחות והזנת העור. מחליק את העור מיידית ומעניק לו מראה חיוני זוהר לאורך זמן.',
155, 'Cultivation5.webp', 7, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Hyper Real Fresh Canvas Cleansing Oil
', 5, 'שמן ניקוי עדין אך אפקטיבי, המסיר ביעילות איפור עיקש, חלקיקי לכלוך ואבק. מותיר את העור רך ומעניק מראה חיוני ומלא ברק. בטוח לשימוש לעור רגיש ולעיניים רגישות. קיים גם בגודל מיני המתאים לנסיעות.',
130, 'Cultivation6.webp', 5, GETDATE());
--אפרסק שזוף עם תתי גוונים ניטרליים לעור בגוון ביניים עד כהה
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Strobe Dewy Skin Tint', 5, 'קרם לחות בעל גוון המעניק מראה זוהר, בעל חלקיקים רפלקטיביים ומאירים. מועשר בחומצה היאלורונית, חמאת שיאה, סקוואלן ו-ויטמין E.',
105, 'Cultivation7.webp', 12, GETDATE());
--זהב פנינתי: מתאים במיוחד לגווני עור בהכות בינונית או עמוקה.
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Strobe Cream
', 5, 'קרם לחות המעורר עור עייף ומאיר אותו הודות לחלקיקים היוצרים השתקפויות.',
100, 'Cultivation8.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Complete Comfort Creme
', 5, 'לחות שמזינה את העור מיידית ומפחיתה אדמומיות וגירוי בעור.',
110, 'Cultivation9.webp', 9, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Prep + Prime Essential Oils Grapefruit & Chamomile
', 5, 'שמן הארומטי לטיפוח מזין את העור ברכות, מעניק לו תחושה מלאת אנרגיה ונמרצת עם זוהר בריא.',
150, 'Cultivation10.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Mineralize Timecheck Lotion
', 5, 'תחליב פנים מועשר במרכיבים הפועל נגד הזמן ומצמצם קמטים וקמטוטים.',
105, 'Cultivation11.webp', 5, GETDATE());
INSERT INTO [dbo].[Products] ([Name], [CategoryID], [Description], [Price], [Image], [StockQuantity], [LastUpdated]) 
VALUES ('Fix+ Stay Over
', 5, 'תרסיס לקיבוע איפור ולהארכת עמידותו עד ל-16 שעות.
מעניק לחות, תוך הגנה על העור מפני אור כחול וזיהום סביבתי.
נטול אלכוהול.',
120, 'Cultivation12.webp', 8, GETDATE());




-- מילוי טבלת לקוחות
INSERT INTO [dbo].[Customers] ([Name], [Phone], [Email], [BirthDate]) 
VALUES ('שרה כהן', '055-7872946', 'sara2946@gmail.com', '2000-10-06');
INSERT INTO [dbo].[Customers] ([Name], [Phone], [Email], [BirthDate]) 
VALUES ('רבקה לוי', '058-3252111', 'rivka111@gmail.com', '1995-10-29');
INSERT INTO [dbo].[Customers] ([Name], [Phone], [Email], [BirthDate]) 
VALUES ('בת שבע בירנבאום', '058-3272946', 'b0556772946@gmail.com', '2004-11-12');

-- טבלת קניות
INSERT INTO [dbo].[Purchases] ([CustomerID], [PurchaseDate], [Note]) 
VALUES (1, GETDATE(), 'להניח ליד הדלת');
INSERT INTO [dbo].[Purchases] ([CustomerID], [PurchaseDate], [Note]) 
VALUES (2, GETDATE(), 'כניסה שלישית');

-- טבלת פרטי קניה
INSERT INTO [dbo].[PurchaseDetails] ([PurchaseID], [ProductID], [Quantity]) 
VALUES (PurchaseID, ProductID, Quantity);

--DELETE FROM Purchases;
DELETE FROM Products;







