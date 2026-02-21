-- Users
CREATE TABLE IF NOT EXISTS `Users`(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	
	`fullName` VARCHAR(255),
	`email` VARCHAR(255),
	`password` VARCHAR(255),
	
	`deleteBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Food types
CREATE TABLE IF NOT EXISTS `FoodTypes`(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	
	`typeName` VARCHAR(255),
	
	`deleteBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Foods
CREATE TABLE IF NOT EXISTS `Foods`(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	
	`foodName` VARCHAR(255),
	`image` VARCHAR(255),
	`price` FLOAT,
	`desc` VARCHAR(255),
	`typeId` INT,
	FOREIGN KEY (`typeId`) REFERENCES `FoodTypes`(`id`),
	
	`deleteBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Sub foods
CREATE TABLE IF NOT EXISTS `SubFoods`(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	
	`subName` VARCHAR(255),
	`subPrice` FLOAT,
	`foodId` INT,
	FOREIGN KEY (`foodId`) REFERENCES `Foods`(`id`),
	
	`deleteBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Orders
CREATE TABLE IF NOT EXISTS `Orders`(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	
	`userId` INT,
	`foodId` INT,
	`amount` INT,
	`code` VARCHAR(255),
	`arrSubId` VARCHAR(255),
	FOREIGN KEY (`userId`) REFERENCES `Users`(`id`),
	FOREIGN KEY (`foodId`) REFERENCES `Foods`(`id`),
	
	`deleteBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Restaurants
CREATE TABLE IF NOT EXISTS `Restaurants`(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	
	`resName` VARCHAR(255),
	`image` VARCHAR(255),
	`desc` VARCHAR(255),
	
	`deleteBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Like restaurants
CREATE TABLE IF NOT EXISTS `LikeRes`(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	
	`userId` INT,
	`resId` INT,
	`dateLike` DATETIME,
	FOREIGN KEY (`userId`) REFERENCES `Users`(`id`),
	FOREIGN KEY (`resId`) REFERENCES `Restaurants`(`id`),
	
	`deleteBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Rate restaurants
CREATE TABLE IF NOT EXISTS `RateRes`(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	
	`userId` INT,
	`resId` INT,
	`amount` INT,
	`dateRate` DATETIME,
	FOREIGN KEY (`userId`) REFERENCES `Users`(`id`),
	FOREIGN KEY (`resId`) REFERENCES `Restaurants`(`id`),
	
	`deleteBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- =========================
-- SAMPLE DATA
-- =========================

-- Users
INSERT INTO `Users` (`fullName`, `email`, `password`) VALUES
('Nguyen Van An', 'an.nguyen@example.com', '123456'),
('Tran Thi Binh', 'binh.tran@example.com', '123456'),
('Le Quoc Cuong', 'cuong.le@example.com', '123456'),
('Pham Minh Dung', 'dung.pham@example.com', '123456'),
('Vo Thu Ha', 'ha.vo@example.com', '123456');

-- Food types
INSERT INTO `FoodTypes` (`typeName`) VALUES
('Fast Food'),
('Vietnamese'),
('Drinks'),
('Dessert');

-- Foods
INSERT INTO `Foods` (`foodName`, `image`, `price`, `desc`, `typeId`) VALUES
('Classic Burger', 'burger.jpg', 55000, 'Beef burger with cheese', 1),
('Fried Chicken', 'fried-chicken.jpg', 65000, 'Crispy fried chicken combo', 1),
('Pho Bo', 'pho-bo.jpg', 50000, 'Vietnamese beef noodle soup', 2),
('Bun Cha', 'bun-cha.jpg', 48000, 'Grilled pork with vermicelli', 2),
('Tra Sua Tran Chau', 'milk-tea.jpg', 35000, 'Milk tea with pearls', 3),
('Ca Phe Sua Da', 'iced-coffee.jpg', 28000, 'Vietnamese iced coffee with milk', 3),
('Tiramisu', 'tiramisu.jpg', 45000, 'Italian layered dessert', 4),
('Che Thai', 'che-thai.jpg', 30000, 'Mixed fruit sweet soup', 4);

-- Sub foods
INSERT INTO `SubFoods` (`subName`, `subPrice`, `foodId`) VALUES
('Extra Cheese', 10000, 1),
('Double Patty', 20000, 1),
('Spicy Sauce', 5000, 2),
('Extra Noodles', 8000, 3),
('Extra Beef', 15000, 3),
('Fried Spring Roll', 12000, 4),
('Less Sugar', 0, 5),
('Extra Pearl', 7000, 5),
('Whipped Cream', 8000, 6),
('Ice Cream Scoop', 10000, 7);

-- Restaurants
INSERT INTO `Restaurants` (`resName`, `image`, `desc`) VALUES
('Sunrise Bistro', 'sunrise-bistro.jpg', 'Family style restaurant'),
('Pho House', 'pho-house.jpg', 'Traditional Vietnamese cuisine'),
('Burger Zone', 'burger-zone.jpg', 'Best burgers in town'),
('Sweet Corner', 'sweet-corner.jpg', 'Desserts and sweet drinks'),
('Coffee Hub', 'coffee-hub.jpg', 'Modern cafe and workspace');

-- Like restaurants
INSERT INTO `LikeRes` (`userId`, `resId`, `dateLike`) VALUES
(1, 1, '2026-02-10 10:30:00'),
(1, 3, '2026-02-10 11:00:00'),
(2, 2, '2026-02-11 09:15:00'),
(2, 5, '2026-02-11 09:45:00'),
(3, 2, '2026-02-12 18:20:00'),
(4, 4, '2026-02-13 20:10:00'),
(5, 1, '2026-02-14 08:05:00');

-- Rate restaurants
INSERT INTO `RateRes` (`userId`, `resId`, `amount`, `dateRate`) VALUES
(1, 1, 5, '2026-02-10 12:00:00'),
(1, 3, 4, '2026-02-10 12:30:00'),
(2, 2, 5, '2026-02-11 10:00:00'),
(3, 2, 4, '2026-02-12 19:00:00'),
(4, 4, 3, '2026-02-13 21:00:00'),
(5, 5, 5, '2026-02-14 09:00:00');

-- Orders
INSERT INTO `Orders` (`userId`, `foodId`, `amount`, `code`, `arrSubId`) VALUES
(1, 1, 2, 'OD001', '1,2'),
(2, 3, 1, 'OD002', '4,5'),
(3, 5, 3, 'OD003', '7,8'),
(4, 2, 1, 'OD004', '3'),
(5, 7, 2, 'OD005', '10'),
(1, 6, 1, 'OD006', '9');

-- TÌM 5 NGƯỜI ĐÃ LIKE NHÀ HÀNG NHIỀU NHẤT
SELECT `Users`.`id`, `Users`.`fullName`, COUNT(`userId`) AS "Số lượng like"
FROM `LikeRes`
INNER JOIN `Users` ON `LikeRes`.`userID` = `Users`.`id`
GROUP BY `userId`
ORDER BY `Số lượng like` DESC 
LIMIT 5;

-- TÌM 2 NHÀ HÀNG CÓ LƯỢT LIKE NHIỀU NHẤT
SELECT `Restaurants`.`id`, `Restaurants`.`resName`, COUNT(`resId`) AS "Số lượng like"
FROM `LikeRes`
INNER JOIN `Restaurants` ON `LikeRes`.`resId` = `Restaurants`.`id`
GROUP BY `resId`
ORDER BY "Số lượng like" DESC
LIMIT 2;

-- Tìm người đã đặt hàng nhiều nhất
SELECT `Users`.`id`, `Users`.`fullName`, COUNT(`userId`) AS "Số lượng đặt hàng"
FROM `Orders`
INNER JOIN `Users` ON `Orders`.`userId` = `Users`.`id`
GROUP BY `userId`
ORDER BY "Số lượng đặt hàng" DESC
LIMIT 1;


INSERT INTO `Users` (`fullName`, `email`, `password`) VALUES
('Do Hong Nhat', 'hongnhatat@gmail.com', '123456');

-- TÌM NGƯỜI KHÔNG HOẠT ĐỘNG TRONG HỆ THỐNG (KHÔNG ĐẶT HÀNG, KHÔNG LIKE, KHÔNG ĐÁNH GIÁ NHÀ HÀNG)
SELECT `Users`.`id`, `fullName` AS "Họ và tên"
FROM `Users`
LEFT JOIN `Orders` ON `Orders`.`userId` = `Users`.`id`
LEFT JOIN `LikeRes` ON `LikeRes`.`userId` = `Users`.`id`
LEFT JOIN `RateRes` ON `RateRes`.`userId` = `Users`.`id`
WHERE `Orders`.`userId` IS NULL AND `LikeRes`.`userId` IS NULL AND `RateRes`.`userId` IS NULL;
