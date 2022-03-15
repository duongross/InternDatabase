CREATE TABLE Customer(
	CustomerID		VARCHAR(6),
    CustomerName	VARCHAR(50),
    PhoneNumber		VARCHAR(10),
    Address			VARCHAR(200),
    Email			VARCHAR(200),
    
    PRIMARY KEY (CustomerID)
);

CREATE TABLE Individual(
	CustomerID		VARCHAR(6),
    MemberStatus	VARCHAR(50),
    
    PRIMARY KEY (CustomerID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Company(
	CustomerID		VARCHAR(6),
    RepID			VARCHAR(6),
    
    PRIMARY KEY (CustomerID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (RepID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Product(
	ProductID		VARCHAR(6),
    ProductName		VARCHAR(50),
    Description		VARCHAR(200),
    InStock			INT		NOT NULL,
    Price			INT		NOT NULL,
    
    PRIMARY KEY (ProductID)
);

CREATE TABLE Chemical(
	ProductID		VARCHAR(6),
    Type			VARCHAR (50),
    Source			VARCHAR (50),
    
    PRIMARY KEY (ProductID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Paint(
	ProductID		VARCHAR(6),
    RedIndex		TINYINT 	NOT NULL,
    GreenIndex		TINYINT		NOT NULL,
    BlueIndex		TINYINT		NOT NULL,
    Base			VARCHAR(50),
    Fandeck			VARCHAR(50),
    Size			DOUBLE		NOT NULL,
    Note			VARCHAR(200),
    
    PRIMARY KEY (ProductID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Canister(
	ProductID		VARCHAR(6),
    CanisterCode	VARCHAR(2),
    Volume			DOUBLE		NOT NULL,
    
    PRIMARY KEY (ProductID, CanisterCode),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Dispencer(
	ProductID		VARCHAR(6),
	Type			VARCHAR(50),
	Technology		VARCHAR(50),
	Canmaterial		VARCHAR(50),
	Numofcan		INT		NOT NULL, 
	Pumpsize 		DOUBLE 	NOT NULL,
	Accuracy		DOUBLE 	NOT NULL,
	Timer			VARCHAR(50),
	Handling		VARCHAR(50),
	Suckback		VARCHAR(50),
	Netweight		INT		NOT NULL,
	Powersupply		VARCHAR(50),

    PRIMARY KEY (ProductID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Mixer(
	ProductID		VARCHAR(6),
	Maxload			INT 	NOT NULL,
	Cantype			VARCHAR(50),
	Maxheight		DOUBLE 	NOT NULL,
	Minheight		DOUBLE 	NOT NULL, 
	Maxdiameter 	DOUBLE 	NOT NULL,
	MixerType		INT,
	Powersupply		VARCHAR(50),
	Clamping		VARCHAR(50),
	Mixerspeed		INT		NOT NULL,
	Nominalpower	DOUBLE 	NOT NULL,
	Maxnoise		DOUBLE 	NOT NULL,

    PRIMARY KEY (ProductID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Purchase(
	PurchaseID		VARCHAR(6),
    CustomerID		VARCHAR(6),
    OrderDate		DATE,
    Cost			DOUBLE	NOT NULL,
    Discount		DOUBLE	NOT NULL,
    TotalPrice		DOUBLE	NOT NULL,
    
    PRIMARY KEY (PurchaseID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE ListProduct(
	PurchaseID		VARCHAR(6),
    ProductID		VARCHAR(6),
	Amount 			INT		NOT NULL,
    
    PRIMARY KEY (PurchaseID, ProductID),
    FOREIGN KEY (PurchaseID) REFERENCES Purchase(PurchaseID),
	FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);




