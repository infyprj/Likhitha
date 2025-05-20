CREATE DATABASE Shop3D;
GO

USE Shop3D;
GO
-- Categories
-- Roles
-- Users
--Products
--Orders
-- order items
-- saved products
-- product images
	
IF OBJECT_ID('Categories') IS NOT NULL
	DROP TABLE Categories
GO

IF OBJECT_ID('Roles') IS NOT NULL
	DROP TABLE Roles
GO

IF OBJECT_ID('Users') IS NOT NULL
	DROP TABLE Users
GO

IF OBJECT_ID('Products') IS NOT NULL
	DROP TABLE Products
GO

IF OBJECT_ID('Orders') IS NOT NULL
	DROP TABLE Orders
GO

IF OBJECT_ID('OrderItems') IS NOT NULL
	DROP TABLE OrderItems
GO

IF OBJECT_ID('SavedProducts') IS NOT NULL
	DROP TABLE SavedProducts
GO

IF OBJECT_ID('ProductImages') IS NOT NULL
	DROP TABLE ProductImages
GO

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
);
GO

INSERT INTO Categories (Name)
VALUES
('Sofa'),
('Table'),
('Bed'),
('Chair');
GO




CREATE TABLE Roles (
    RoleID INT PRIMARY KEY IDENTITY(1,1),
    RoleName NVARCHAR(50) NOT NULL UNIQUE,
);
GO

INSERT INTO Roles (RoleName)
VALUES 
('Guest User'),
('Customer'),
('Admin' );
GO



CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Email NVARCHAR(255) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    PhoneNumber NVARCHAR(20),
    Address NVARCHAR(255),
    City NVARCHAR(100),
    State NVARCHAR(100),
    PostalCode NVARCHAR(20),
    Country NVARCHAR(100),
    RoleID INT NOT NULL FOREIGN KEY REFERENCES Roles(RoleID)
);
GO
    
INSERT INTO Users (Email, PasswordHash, FirstName, LastName, PhoneNumber, Address, City, State, PostalCode, Country, RoleID)
VALUES 
('admin@example.com', 'hashed_pw_1', 'Alice', 'Admin', '1234567890', '123 Admin St', 'New York', 'NY', '10001', 'USA', 2),
('manager@example.com', 'hashed_pw_2', 'Bob', 'Manager', '2345678901', '456 Manager Ave', 'Los Angeles', 'CA', '90001', 'USA', 2),
('editor@example.com', 'hashed_pw_3', 'Charlie', 'Editor', '3456789012', '789 Editor Blvd', 'Chicago', 'IL', '60601', 'USA', 2),
('viewer@example.com', 'hashed_pw_4', 'Diana', 'Viewer', '4567890123', '101 Viewer Rd', 'Houston', 'TX', '77001', 'USA', 2),
('support@example.com', 'hashed_pw_5', 'Ethan', 'Support', '5678901234', '202 Support Ln', 'Phoenix', 'AZ', '85001', 'USA', 2),
('admin@mail.com', 'Admin@123', 'Fiona', 'Admin', '6789012345', '303 HR Pkwy', 'Philadelphia', 'PA', '19101', 'USA', 3);
GO



CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL,
    Description NVARCHAR(MAX),
    Price DECIMAL(18, 2) NOT NULL,
    CategoryID INT NOT NULL FOREIGN KEY REFERENCES Categories(CategoryID),
    ModelURL NVARCHAR(255) NOT NULL, -- URL to 3D model file
    ThumbnailURL NVARCHAR(255),
    Quantity INT DEFAULT 0,
);
GO


INSERT INTO Products (Name, Description, Price, CategoryID, ModelURL, ThumbnailURL, Quantity)
VALUES 
('Velvet Elegance Two-Seater', 'A luxurious two-seater sofa featuring premium velvet upholstery with a sturdy wooden frame, designed for modern living rooms. The plush cushions and elegant design provide both comfort and style, making it a perfect centerpiece for your home decor. Available in multiple color options upon request.', 15000, 1, 'https://shop3dprojectaccount.blob.core.windows.net/3d-models/Sofa1.glb', 'https://shop3dprojectaccount.blob.core.windows.net/images/Sofa1.png', 20),
('Catalina Office Desk', 'A sleek and functional office desk crafted from high-quality engineered wood with a durable laminate finish. The spacious work surface and minimalist design make it ideal for home offices or professional workspaces. Features cable management and ergonomic design for enhanced productivity.', 6000, 2, 'https://shop3dprojectaccount.blob.core.windows.net/3d-models/Table.glb', 'https://shop3dprojectaccount.blob.core.windows.net/images/Table.png', 35),
('Serenity Platform Bed', 'A modern platform bed with built-in under-bed storage, crafted from premium engineered wood for durability. The sleek design features a low profile with ample storage space, perfect for organizing bedding and accessories. The sturdy slat support ensures comfort and longevity for all mattress types.', 20000, 3, 'https://shop3dprojectaccount.blob.core.windows.net/3d-models/Bed.glb', 'https://shop3dprojectaccount.blob.core.windows.net/images/Bed.png', 20),
('Harmony Rocking Chair', 'Handcrafted from solid wood, this elegant rocking chair is designed for relaxation in gardens or cozy indoor spaces. The ergonomic curved backrest and smooth rocking motion provide exceptional comfort. Finished with a weather-resistant stain for outdoor durability.', 4500, 4, 'https://shop3dprojectaccount.blob.core.windows.net/3d-models/Chair.glb', 'https://shop3dprojectaccount.blob.core.windows.net/images/Chair.png', 50),
('Tokyo Curve Sectional', 'A contemporary five-seater sectional sofa with a gracefully curved design, perfect for spacious living areas. Upholstered in high-resilience foam and premium fabric for lasting comfort. The modular design allows flexible arrangement to suit any room layout.', 18000, 1, 'https://shop3dprojectaccount.blob.core.windows.net/3d-models/Sofa2.glb', 'https://shop3dprojectaccount.blob.core.windows.net/images/Sofa2.png', 10);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL FOREIGN KEY REFERENCES Users(UserID),
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(18, 2) NOT NULL,
    ShippingAddress NVARCHAR(255),
    ShippingCity NVARCHAR(100),
    ShippingState NVARCHAR(100),
    ShippingPostalCode NVARCHAR(20),
    ShippingCountry NVARCHAR(100),

);
GO
    INSERT INTO Orders (UserID, TotalAmount, ShippingAddress, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry)
VALUES 
(1, 150.75, '123 Main St', 'New York', 'NY', '10001', 'USA'),
(2, 299.99, '456 Oak Ave', 'Los Angeles', 'CA', '90001', 'USA'),
(3, 89.50, '789 Pine Rd', 'Chicago', 'IL', '60601', 'USA'),
(4, 420.00, '101 Maple Blvd', 'Houston', 'TX', '77001', 'USA'),
(5, 59.95, '202 Birch Ln', 'Phoenix', 'AZ', '85001', 'USA'),
(1, 230.25, '123 Main St', 'New York', 'NY', '10001', 'USA'),
(2, 199.99, '456 Oak Ave', 'Los Angeles', 'CA', '90001', 'USA'),
(3, 320.10, '789 Pine Rd', 'Chicago', 'IL', '60601', 'USA'),
(4, 150.00, '101 Maple Blvd', 'Houston', 'TX', '77001', 'USA'),
(5, 75.00, '202 Birch Ln', 'Phoenix', 'AZ', '85001', 'USA');

-- Order Items Table
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT NOT NULL FOREIGN KEY REFERENCES Orders(OrderID) ON DELETE CASCADE,
    ProductID INT NOT NULL FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(18, 2) NOT NULL,
    CustomizationDetails NVARCHAR(MAX)
);
GO
    INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice, CustomizationDetails)
VALUES
(1, 2, 1, 49.99, 'Color: Red, Size: M'),
(3, 3, 2, 29.95, NULL),
(2, 5, 1, 99.00, 'Engraving: "Happy B-Day"'),
(2, 1, 3, 19.99, NULL);


	

CREATE TABLE SavedProducts (
    SavedProductID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL FOREIGN KEY REFERENCES Users(UserID) ON DELETE CASCADE,
    ProductID INT NOT NULL FOREIGN KEY REFERENCES Products(ProductID) ON DELETE CASCADE

);
GO

INSERT INTO SavedProducts (UserID, ProductID)
VALUES
(1, 2),
(1, 4),
(2, 1),
(2, 5),
(3, 3);



CREATE TABLE ProductImages (
    ImageID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT NOT NULL FOREIGN KEY REFERENCES Products(ProductID) ON DELETE CASCADE,
    ImageURL NVARCHAR(255) NOT NULL,
);
GO
    
INSERT INTO ProductImages (ProductID, ImageURL)
VALUES
(1, 'https://example.com/images/product1_img1.jpg'),
(1, 'https://example.com/images/product1_img2.jpg'),
(2, 'https://example.com/images/product2_img1.jpg'),
(2, 'https://example.com/images/product2_img2.jpg'),
(3, 'https://example.com/images/product3_img1.jpg'),
(3, 'https://example.com/images/product3_img2.jpg'),
(4, 'https://example.com/images/product4_img1.jpg'),
(4, 'https://example.com/images/product4_img2.jpg'),
(5, 'https://example.com/images/product5_img1.jpg'),
(5, 'https://example.com/images/product5_img2.jpg');
GO



CREATE OR ALTER PROCEDURE sp_SearchProducts
    @SearchTerm NVARCHAR(255)
AS
BEGIN
    SELECT p.*, c.Name AS CategoryName
    FROM Products p
    JOIN Categories c ON p.CategoryID = c.CategoryID
    WHERE p.Name LIKE '%' + @SearchTerm + '%' 
       OR p.Description LIKE '%' + @SearchTerm + '%'
       OR c.Name LIKE '%' + @SearchTerm + '%';
END
GO


CREATE PROCEDURE sp_RegisterUser
    @Email NVARCHAR(255),
    @PasswordHash NVARCHAR(255),
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @PhoneNumber NVARCHAR(20),
    @Address NVARCHAR(255),
    @City NVARCHAR(100),
    @State NVARCHAR(100),
    @PostalCode NVARCHAR(20),
    @Country NVARCHAR(100),
    @RoleID INT
AS
BEGIN
    -- Check if email already exists
    IF EXISTS (SELECT 1 FROM Users WHERE Email = @Email)
    BEGIN
        RETURN -1; -- Email already exists
    END
    -- Insert new user
    INSERT INTO Users (Email, PasswordHash, FirstName, LastName, PhoneNumber, Address, City, State, PostalCode, Country, RoleID)
    VALUES (@Email, @PasswordHash, @FirstName, @LastName, @PhoneNumber, @Address, @City, @State, @PostalCode, @Country, @RoleID);
    
    DECLARE @UserID INT = SCOPE_IDENTITY();

    INSERT INTO Carts(UserID) values (@UserID);

    RETURN 1;
END;
GO


CREATE PROCEDURE sp_RemoveSavedProduct
    @UserID INT,
    @ProductID INT
AS
BEGIN
    DELETE FROM SavedProducts 
    WHERE UserID = @UserID AND ProductID = @ProductID;
    
    RETURN @@RowCount; -- Returns number of rows affected
END;
GO

CREATE PROCEDURE sp_AddProduct
    @Name NVARCHAR(255),
    @Description NVARCHAR(MAX),
    @Price DECIMAL(18, 2),
    @CategoryID INT,
    @ModelURL NVARCHAR(255),
    @ThumbnailURL NVARCHAR(255) = NULL,
    @Quantity INT
AS
BEGIN
    INSERT INTO Products (
        Name, Description, Price, CategoryID, 
        ModelURL, ThumbnailURL, Quantity
    )
    VALUES (
        @Name, @Description, @Price, @CategoryID,
        @ModelURL, @ThumbnailURL, @Quantity
    );
    
    RETURN 1;
END;
GO



CREATE PROCEDURE sp_SaveProduct
    @UserID INT,
    @ProductID INT
AS
BEGIN
    -- Check if already saved
    IF NOT EXISTS (SELECT 1 FROM SavedProducts WHERE UserID = @UserID AND ProductID = @ProductID)
    BEGIN
        INSERT INTO SavedProducts (UserID, ProductID)
        VALUES (@UserID, @ProductID);
        RETURN 1; -- Success
    END
    ELSE
    BEGIN
        RETURN 0; -- Already saved
    END
END;
GO



CREATE OR ALTER PROCEDURE sp_AuthenticateUser
    @Email NVARCHAR(255),
    @PasswordHash NVARCHAR(255)
AS
BEGIN
    SELECT *
    FROM Users 
    WHERE Email = @Email AND PasswordHash = @PasswordHash;
END
GO


CREATE OR ALTER PROCEDURE sp_UpdateUserDetails
    @UserID INT,
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @PhoneNumber NVARCHAR(20),
    @Address NVARCHAR(255),
    @City NVARCHAR(100),
    @State NVARCHAR(100),
    @PostalCode NVARCHAR(20),
    @Country NVARCHAR(100)
AS
BEGIN
    UPDATE Users
    SET FirstName = @FirstName,
        LastName = @LastName,
        PhoneNumber = @PhoneNumber,
        Address = @Address,
        City = @City,
        State = @State,
        PostalCode = @PostalCode,
        Country = @Country
    WHERE UserID = @UserID;
    
    SELECT @@ROWCOUNT AS RecordsUpdated;
END
GO

-- Create Carts table
IF OBJECT_ID('CartItems') IS NOT NULL
    DROP TABLE CartItems
GO

IF OBJECT_ID('Carts') IS NOT NULL
    DROP TABLE Carts
GO

CREATE TABLE Carts (
    CartID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL FOREIGN KEY REFERENCES Users(UserID) ON DELETE CASCADE
);
GO

-- Create CartItems table
CREATE TABLE CartItems (
    CartItemID INT PRIMARY KEY IDENTITY(1,1),
    CartID INT NOT NULL FOREIGN KEY REFERENCES Carts(CartID) ON DELETE CASCADE,
    ProductID INT NOT NULL FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT NOT NULL DEFAULT 1
);
GO

-- Insert sample data
INSERT INTO Carts (UserID)
VALUES 
(1),
(2),
(3);
GO

INSERT INTO CartItems (CartID, ProductID, Quantity)
VALUES 
(1, 1, 2),
(1, 3, 1),
(2, 2, 3),
(3, 4, 1);
GO

-- Stored Procedure to create a cart for a user
CREATE PROCEDURE sp_CreateCart
    @UserID INT
AS
BEGIN
    -- Check if user already has a cart
    IF EXISTS (SELECT 1 FROM Carts WHERE UserID = @UserID)
    BEGIN
        RETURN -1; -- User already has a cart
    END
    
    -- Create new cart
    INSERT INTO Carts (UserID)
    VALUES (@UserID);
    
    -- Return the new cart ID
    SELECT SCOPE_IDENTITY() AS CartID;
    RETURN 1;
END;
GO

-- Stored Procedure to get a user's cart
CREATE PROCEDURE sp_GetCartByUserID
    @UserID INT
AS
BEGIN
    SELECT c.CartID, c.UserID
    FROM Carts c
    WHERE c.UserID = @UserID;
END;
GO

-- Stored Procedure to add item to cart
CREATE PROCEDURE sp_AddToCart
    @UserID INT,
    @ProductID INT,
    @Quantity INT
AS
BEGIN
    DECLARE @CartID INT;
    
    -- Get the user's cart ID
    SELECT @CartID = CartID FROM Carts WHERE UserID = @UserID;
    
    -- If user doesn't have a cart, create one
    IF @CartID IS NULL
    BEGIN
        INSERT INTO Carts (UserID)
        VALUES (@UserID);
        
        SET @CartID = SCOPE_IDENTITY();
    END
    
    -- Check if product already exists in cart
    IF EXISTS (SELECT 1 FROM CartItems WHERE CartID = @CartID AND ProductID = @ProductID)
    BEGIN
        RETURN -1; -- Product already in cart
    END
    
    -- Add product to cart
    INSERT INTO CartItems (CartID, ProductID, Quantity)
    VALUES (@CartID, @ProductID, @Quantity);
    
    RETURN 1; -- Success
END;
GO

-- Stored Procedure to update cart item quantity
CREATE PROCEDURE sp_UpdateCartItemQuantity
    @CartItemID INT,
    @Quantity INT
AS
BEGIN
    UPDATE CartItems
    SET Quantity = @Quantity
    WHERE CartItemID = @CartItemID;
    
    RETURN @@ROWCOUNT; -- Returns number of rows affected
END;
GO

-- Stored Procedure to remove item from cart
CREATE PROCEDURE sp_RemoveFromCart
    @CartItemID INT
AS
BEGIN
    DELETE FROM CartItems 
    WHERE CartItemID = @CartItemID;
    
    RETURN @@ROWCOUNT; -- Returns number of rows affected
END;
GO

-- Stored Procedure to clear cart
CREATE PROCEDURE sp_ClearCart
    @CartID INT
AS
BEGIN
    DELETE FROM CartItems 
    WHERE CartID = @CartID;
    
    RETURN @@ROWCOUNT; -- Returns number of rows affected
END;
GO

-- Stored Procedure to get cart items with product details
CREATE PROCEDURE sp_GetCartItems
    @UserID INT
AS
BEGIN
    SELECT ci.CartItemID, ci.CartID, ci.ProductID, ci.Quantity,
           p.Name, p.Description, p.Price, p.ThumbnailURL,
           (p.Price * ci.Quantity) AS SubTotal
    FROM Carts c
    JOIN CartItems ci ON c.CartID = ci.CartID
    JOIN Products p ON ci.ProductID = p.ProductID
    WHERE c.UserID = @UserID;
END;
GO
