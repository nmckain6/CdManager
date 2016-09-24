USE nmckain;

DROP TABLE IF EXISTS songs;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS musicians;
DROP TABLE IF EXISTS bands;
DROP TABLE IF EXISTS bandMusicians;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS albumSongs;

CREATE TABLE songs (
  songId     INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
  songTitle VARCHAR(255) NOT NULL,
  CONSTRAINT uniqueSong UNIQUE INDEX(songTitle)
)Engine=InnoDB,COLLATE=latin1_general_cs;

CREATE TABLE musicians (
  musicianId     INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
  firstName VARCHAR(255) NOT NULL,
  lastName VARCHAR(255) NOT NULL
  CONSTRAINT uniqueMusician UNIQUE INDEX(firstName, lastName)
)Engine=InnoDB,COLLATE=latin1_general_cs;

CREATE TABLE bands (
  bandId     INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
  bandName VARCHAR(255) NOT NULL,
  CONSTRAINT uniqueBand UNIQUE INDEX(bandName)
)Engine=InnoDB,COLLATE=latin1_general_cs;

CREATE TABLE bandMusicians (
  bandId INT NOT NULL,
  musicianId INT NOT NULL,
  FOREIGN KEY (bandId) REFERENCES bands(bandId),
  FOREIGN KEY (musicianId) REFERENCES musicians(musicianId),
  CONSTRAINT uniqueBandMusician UNIQUE INDEX(bandId, musicianId)
)Engine=InnoDB,COLLATE=latin1_general_cs;

CREATE TABLE albums (
  albumId     INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
  albumTitle VARCHAR(255) NOT NULL,
  albumYear INT,
  bandId INT NOT NULL,
  FOREIGN KEY (bandId) REFERENCES bands(bandId),
  CONSTRAINT uniqueAlbum UNIQUE INDEX(albumTitle, albumYear)
)Engine=InnoDB,COLLATE=latin1_general_cs;

CREATE TABLE albumSongs (
  albumId INT NOT NULL,
  songId INT NOT NULL,
  trackNumber INT,
  trackLength INT,
  trackPath VARCHAR(255) NOT NULL,
  FOREIGN KEY (albumId) REFERENCES albums(albumId),
  FOREIGN KEY (songId) REFERENCES songs(songId),
  CONSTRAINT uniqueAlbumSong UNIQUE INDEX(albumId, songId)
)Engine=InnoDB,COLLATE=latin1_general_cs;

CREATE TABLE genres (
  albumId INT NOT NULL,
  genreName VARCHAR(255) NOT NULL,
  CONSTRAINT uniqueGenre UNIQUE INDEX(albumId, genreName)
)Engine=InnoDB,COLLATE=latin1_general_cs;

/*
CREATE TABLE product (
  productId     INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
  productCode VARCHAR(255) NOT NULL,
  productName VARCHAR(255) NOT NULL,
  productDescription VARCHAR(255),
  perUnitPrice DOUBLE NOT NULL,
  categoryId INT NOT NULL,
  FOREIGN KEY (categoryId) REFERENCES category(categoryId),
  CONSTRAINT uniqueProduct UNIQUE INDEX(productCode)
)Engine=InnoDB,COLLATE=latin1_general_cs;

CREATE TABLE orderProduct (
  orderProductId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
  productId INT NOT NULL,
  orderId INT NOT NULL,
  quantity INT NOT NULL,
  FOREIGN KEY (productId) REFERENCES product(productId),
  FOREIGN KEY (orderId) REFERENCES `order`(orderId),
  CONSTRAINT uniqueLineItem UNIQUE INDEX(productId, orderId)
)Engine=InnoDB,COLLATE=latin1_general_cs;

#Insert countries
INSERT INTO country (countryName) VALUES ('USA');

#Insert states
INSERT INTO state (stateName) VALUES ('NE');
INSERT INTO state (stateName) VALUES ('MA');
INSERT INTO state (stateName) VALUES ('IA');

#INSERT INTO state (stateName, countryId) VALUES ('NE', (SELECT countryId FROM country WHERE countryName = 'USA'));
#INSERT INTO state (stateName, countryId) VALUES ('MA', (SELECT countryId FROM country WHERE countryName = 'USA'));
#INSERT INTO state (stateName, countryId) VALUES ('IA', (SELECT countryId FROM country WHERE countryName = 'USA'));

#Insert cities
INSERT INTO city (cityName) VALUES ('York');
INSERT INTO city (cityName) VALUES ('Henderson');
INSERT INTO city (cityName) VALUES ('Grand Island');
INSERT INTO city (cityName) VALUES ('Cambridge');
INSERT INTO city (cityName) VALUES ('Council Bluffs');

#INSERT INTO city (cityName, stateId) VALUES ('York', (SELECT stateId FROM state WHERE stateName = 'NE'));
#INSERT INTO city (cityName, stateId) VALUES ('Henderson', (SELECT stateId FROM state WHERE stateName = 'NE'));
#INSERT INTO city (cityName, stateId) VALUES ('Grand Island', (SELECT stateId FROM state WHERE stateName = 'NE'));
#INSERT INTO city (cityName, stateId) VALUES ('Cambridge', (SELECT stateId FROM state WHERE stateName = 'MA'));
#INSERT INTO city (cityName, stateId) VALUES ('Council Bluffs', (SELECT stateId FROM state WHERE stateName = 'IA'));

#Insert cusomers
#INSERT INTO customer (customerName, customerCode, customerType, street, zip) VALUES ('Anderson, Alex', '231a','P', '798 West 58th Street', '68378');
#INSERT INTO customer (customerName, customerCode, customerType, street, zip) VALUES ('Harvard University', 'ee23', 'A', '1350 Massachusetts Ave', '02138');
#INSERT INTO customer (customerName, customerCode, customerType, street, zip) VALUES ('Walmart', '876a', 'C', '289 Lincoln Ave', '68808');
#INSERT INTO customer (customerName, customerCode, customerType, street, zip) VALUES ('Thompson, Richard', 'fee9', 'P', '328 Rich Lane', '52789');
#INSERT INTO customer (customerName, customerCode, customerType, street, zip) VALUES ('Mainstay Communications', '3872', 'C', '1092 Main Street', '68371');

INSERT INTO customer (customerName, customerCode, customerType, street, zip, cityId, stateId, countryId) 
	VALUES ('Anderson, Alex', '231a','P', '798 West 58th Street', '68378',
	(SELECT cityId FROM city WHERE cityName = 'York'),
	(SELECT stateId FROM state WHERE stateName = 'NE'),
	(SELECT countryId FROM country WHERE countryName = 'USA'));
INSERT INTO customer (customerName, customerCode, customerType, street, zip, cityId, stateId, countryId) 
	VALUES ('Harvard University', 'ee23', 'A', '1350 Massachusetts Ave', '02138',
	(SELECT cityId FROM city WHERE cityName = 'Cambridge'),
	(SELECT stateId FROM state WHERE stateName = 'MA'),
	(SELECT countryId FROM country WHERE countryName = 'USA'));
INSERT INTO customer (customerName, customerCode, customerType, street, zip, cityId, stateId, countryId) 
	VALUES ('Walmart', '876a', 'C', '289 Lincoln Ave', '68808',
	(SELECT cityId FROM city WHERE cityName = 'Grand Island'),
	(SELECT stateId FROM state WHERE stateName = 'NE'),
	(SELECT countryId FROM country WHERE countryName = 'USA'));
INSERT INTO customer (customerName, customerCode, customerType, street, zip, cityId, stateId, countryId) 
	VALUES ('Thompson, Richard', 'fee9', 'P', '328 Rich Lane', '52789',
	(SELECT cityId FROM city WHERE cityName = 'Council Bluffs'),
	(SELECT stateId FROM state WHERE stateName = 'IA'),
	(SELECT countryId FROM country WHERE countryName = 'USA'));
INSERT INTO customer (customerName, customerCode, customerType, street, zip, cityId, stateId, countryId) 
	VALUES ('Mainstay Communications', '3872', 'C', '1092 Main Street', '68371',
	(SELECT cityId FROM city WHERE cityName = 'Henderson'),
	(SELECT stateId FROM state WHERE stateName = 'NE'),
	(SELECT countryId FROM country WHERE countryName = 'USA'));

#Insert emails
INSERT INTO email (address, customerId) VALUES ('aanderson@lichtis.com', (SELECT customerId FROM customer WHERE customerName='Anderson, Alex'));
INSERT INTO email (address, customerId) VALUES ('contactharvard@harvard.edu', (SELECT customerId FROM customer WHERE customerName='Harvard University'));
INSERT INTO email (address, customerId) VALUES ('visit@harvard.edu', (SELECT customerId FROM customer WHERE customerName='Harvard University'));
INSERT INTO email (address, customerId) VALUES ('admissions@harvard.edu', (SELECT customerId FROM customer WHERE customerName='Harvard University'));
INSERT INTO email (address, customerId) VALUES ('bookstore@harvard.edu', (SELECT customerId FROM customer WHERE customerName='Harvard University'));
INSERT INTO email (address, customerId) VALUES ('support@harvard.edu', (SELECT customerId FROM customer WHERE customerName='Harvard University'));
INSERT INTO email (address, customerId) VALUES ('compsci@harvard.edu', (SELECT customerId FROM customer WHERE customerName='Harvard University'));
INSERT INTO email (address, customerId) VALUES ('harvard@harvard.edu', (SELECT customerId FROM customer WHERE customerName='Harvard University'));
INSERT INTO email (address, customerId) VALUES ('greek@harvard.edu', (SELECT customerId FROM customer WHERE customerName='Harvard University'));
INSERT INTO email (address, customerId) VALUES ('housing@harvard.edu', (SELECT customerId FROM customer WHERE customerName='Harvard University'));
INSERT INTO email (address, customerId) VALUES ('cbourke@harvard.edu', (SELECT customerId FROM customer WHERE customerName='Harvard University'));
INSERT INTO email (address, customerId) VALUES ('purchasing@harvard.edu', (SELECT customerId FROM customer WHERE customerName='Harvard University'));
INSERT INTO email (address, customerId) VALUES ('skain@harvard.edu', (SELECT customerId FROM customer WHERE customerName='Harvard University'));
INSERT INTO email (address, customerId) VALUES ('education@harvard.edu', (SELECT customerId FROM customer WHERE customerName='Harvard University'));
INSERT INTO email (address, customerId) VALUES ('lawschool@harvard.edu', (SELECT customerId FROM customer WHERE customerName='Harvard University'));
INSERT INTO email (address, customerId) VALUES ('alumni@harvard.edu', (SELECT customerId FROM customer WHERE customerName='Harvard University'));
INSERT INTO email (address, customerId) VALUES ('walmartgi@walmart.com', (SELECT customerId FROM customer WHERE customerName='Walmart'));
INSERT INTO email (address, customerID) VALUES ('mainstay@mainstaycomm.net',  (SELECT customerId FROM customer WHERE customerName='Mainstay Communications'));

#Insert Orders
INSERT INTO `order` (orderDate, orderCode, customerId) VALUES ('2012/12/13', '583b', (SELECT customerId FROM customer WHERE customerName = 'Anderson, Alex'));
INSERT INTO `order` (orderDate, orderCode, customerId) VALUES ('2013/01/31', '88eb', (SELECT customerId FROM customer WHERE customerName='Harvard University'));
INSERT INTO `order` (orderDate, orderCode, customerId) VALUES ('2013/02/01', '59be', (SELECT customerId FROM customer WHERE customerName='Walmart'));
INSERT INTO `order` (orderDate, orderCode, customerId) VALUES ('2012/12/31', '99ac', (SELECT customerId FROM customer WHERE customerName='Walmart'));
INSERT INTO `order` (orderDate, orderCode, customerId) VALUES ('2011/11/11', '990a', (SELECT customerId FROM customer WHERE customerName='Mainstay Communications'));
#Test duplicate
#INSERT INTO `order` (orderDate, customerId) VALUES ('2013/02/01', (SELECT customerId FROM customer WHERE customerName='Walmart'));

#Insert Product Categories
INSERT INTO category (categoryName, categoryCode) VALUE ('Fruit', '111a');
INSERT INTO category (categoryName, categoryCode) VALUE ('Vegetable', '2878');
INSERT INTO category (categoryName, categoryCode) VALUE ('Laundry Detergent', '3980');
INSERT INTO category (categoryName, categoryCode) VALUE ('Meat', '428f');
INSERT INTO category (categoryName, categoryCode) VALUE ('Bread', '598f');
INSERT INTO category (categoryName, categoryCode) VALUE ('Cereal', '67fe');
INSERT INTO category (categoryName, categoryCode) VALUE ('Candy', '778f');
INSERT INTO category (categoryName, categoryCode) VALUE ('Soup', '811a');
INSERT INTO category (categoryName, categoryCode) VALUE ('Pet Food', '9890');
INSERT INTO category (categoryName, categoryCode) VALUE ('Cleaning Supplies', 'a867');
INSERT INTO category (categoryName, categoryCode) VALUE ('Milk', 'b279');
INSERT INTO category (categoryName, categoryCode) VALUE ('Sports Drink', 'c1c2');

#Insert Products
INSERT INTO product (productName, productCode, productDescription, perUnitPrice, categoryId) VALUES ('Apple', 'ffff', 'Fruit from tree', 1.23, (SELECT categoryId FROM category WHERE categoryName = 'Fruit'));
INSERT INTO product (productName, productCode, productDescription, perUnitPrice, categoryId) VALUES ('Fruit Punch Gatorade', '38fa', 'Drink for athletes', 1.99, (SELECT categoryId FROM category WHERE categoryName = 'Sports Drink'));
INSERT INTO product (productName, productCode, productDescription, perUnitPrice, categoryId) VALUES ('Apricot', '788a', 'Small sweet fruit', 0.76, (SELECT categoryId FROM category WHERE categoryName = 'Fruit'));
INSERT INTO product (productName, productCode, productDescription, perUnitPrice, categoryId) VALUES ('Iams', '6780',  'Dog Food', 10.28, (SELECT categoryId FROM category WHERE categoryName = 'Pet Food'));
INSERT INTO product (productName, productCode, productDescription, perUnitPrice, categoryId) VALUES ('Windex', '1234',  'Window cleaner', 4.78, (SELECT categoryId FROM category WHERE categoryName = 'Cleaning Supplies'));
INSERT INTO product (productName, productCode, productDescription, perUnitPrice, categoryId) VALUES ('Lucky Charms', '478b',  'Cereal with colorful marshmallows', 5.89, (SELECT categoryId FROM category WHERE categoryName = 'Cereal'));
INSERT INTO product (productName, productCode, productDescription, perUnitPrice, categoryId) VALUES ('Snickers', '6453', 'Chocolate candy with peanuts and caramel', 0.89, (SELECT categoryId FROM category WHERE categoryName = 'Candy'));
INSERT INTO product (productName, productCode, productDescription, perUnitPrice, categoryId) VALUES ('Blue Powerade', '9425',  'Coke''s sports drink', 1.59, (SELECT categoryId FROM category WHERE categoryName = 'Sports Drink'));
INSERT INTO product (productName, productCode, productDescription, perUnitPrice, categoryId) VALUES ('2% Milk', '66ff',  '2% fat reduced milk from cows', 4.69, (SELECT categoryId FROM category WHERE categoryName = 'Milk'));
INSERT INTO product (productName, productCode, productDescription, perUnitPrice, categoryId) VALUES ('Texas Toast', '32b4', 'Thickly sliced bread', 4.89, (SELECT categoryId FROM category WHERE categoryName = 'Bread'));
INSERT INTO product (productName, productCode, productDescription, perUnitPrice, categoryId) VALUES ('Era', '765c',  'Laundry detergent for cleaning clothes', 9.99, (SELECT categoryId FROM category WHERE categoryName = 'Laundry Detergent'));
INSERT INTO product (productName, productCode, productDescription, perUnitPrice, categoryId) VALUES ('Canned Corn', '1238', 'Corn kernels in a can',2.78, (SELECT categoryId FROM category WHERE categoryName = 'Vegetable'));
INSERT INTO product (productName, productCode, productDescription, perUnitPrice, categoryId) VALUES ('Bacon', '5f4a', 'Bacon sliced from pigs', 7.32, (SELECT categoryId FROM category WHERE categoryName = 'Meat'));
INSERT INTO product (productName, productCode, productDescription, perUnitPrice, categoryId) VALUES ('Sucker', 'eee3', 'Sweet candy on a stick',0.10, (SELECT categoryId FROM category WHERE categoryName = 'Candy'));

#Insert orderProduct
#--Checked orders on three fields since a company could have two orders on the same day, and two orders from the same 
#--company or date can have the same order total--# 
INSERT INTO orderProduct (orderId, productId, quantity) VALUES ((SELECT orderId FROM `order` WHERE orderCode = '583b'),
			(SELECT productId FROM product WHERE productName = 'Apple'), 3);
INSERT INTO orderProduct (orderId, productId, quantity) VALUES ((SELECT orderId FROM `order` WHERE orderCode = '583b'), 
			(SELECT productId FROM product WHERE productName = 'Fruit Punch Gatorade'), 1);
INSERT INTO orderProduct (orderId, productId, quantity) VALUES ((SELECT orderId FROM `order` WHERE orderCode ='88eb' ),
			(SELECT productId FROM product WHERE productName = 'Blue Powerade'), 2);
INSERT INTO orderProduct (orderId, productId, quantity) VALUES ((SELECT orderId FROM `order` WHERE orderCode = '88eb'),
			(SELECT productId FROM product WHERE productName = 'Bacon'), 20);
INSERT INTO orderProduct (orderId, productId, quantity) VALUES ((SELECT orderId FROM `order` WHERE orderCode = '59be'),
			(SELECT productId FROM product WHERE productName = '2% Milk'), 2);
INSERT INTO orderProduct (orderId, productId, quantity) VALUES ((SELECT orderId FROM `order` WHERE orderCode = '59be'),
			(SELECT productId FROM product WHERE productName = 'Sucker'), 2);
INSERT INTO orderProduct (orderId, productId, quantity) VALUES ((SELECT orderId FROM `order` WHERE orderCode = '99ac'),
			(SELECT productId FROM product WHERE productName = 'Sucker'), 1);
INSERT INTO orderProduct (orderId, productId, quantity) VALUES ((SELECT orderId FROM `order` WHERE orderCode = '990a'),
			(SELECT productId FROM product WHERE productName = 'Apple'), 192);
INSERT INTO orderProduct (orderId, productId, quantity) VALUES ((SELECT orderId FROM `order` WHERE orderCode = '990a'),
			(SELECT productId FROM product WHERE productName = 'Fruit Punch Gatorade'), 190);
INSERT INTO orderProduct (orderId, productId, quantity) VALUES ((SELECT orderId FROM `order` WHERE orderCode = '990a'),
			(SELECT productId FROM product WHERE productName = 'Apricot'), 1009);
INSERT INTO orderProduct (orderId, productId, quantity) VALUES ((SELECT orderId FROM `order` WHERE orderCode = '990a'),
			(SELECT productId FROM product WHERE productName = 'Iams'), 9098);
INSERT INTO orderProduct (orderId, productId, quantity) VALUES ((SELECT orderId FROM `order` WHERE orderCode = '990a'),
			(SELECT productId FROM product WHERE productName = 'Windex'), 77);
INSERT INTO orderProduct (orderId, productId, quantity) VALUES ((SELECT orderId FROM `order` WHERE orderCode = '990a'),
			(SELECT productId FROM product WHERE productName = 'Lucky Charms'), 22);
INSERT INTO orderProduct (orderId, productId, quantity) VALUES ((SELECT orderId FROM `order` WHERE orderCode = '990a'),
			(SELECT productId FROM product WHERE productName = 'Snickers'), 10999);
INSERT INTO orderProduct (orderId, productId, quantity) VALUES ((SELECT orderId FROM `order` WHERE orderCode = '990a'),
			(SELECT productId FROM product WHERE productName = 'Blue Powerade'), 787);
*/