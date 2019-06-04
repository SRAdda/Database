-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2019 at 12:59 AM
-- Server version: 5.5.57-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `retail_business`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE IF NOT EXISTS `addresses` (
  `addressID` int(60) NOT NULL AUTO_INCREMENT,
  `streetAddress` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zipCode` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`addressID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`addressID`, `streetAddress`, `city`, `state`, `zipCode`, `phone`) VALUES
(1, '2423 San Paolo Rd.', 'San Jose', 'CA', '87765', '222-222-2222'),
(2, '1642 17th Avenue', 'New York', 'NY', '10111', '111-111-1111'),
(3, '2520 First Avenue', 'Seattle', 'WA', '98121', '206-441-0304'),
(4, '6554 W Elm Street', 'San Francisco', 'CA', '95444', '408-444-4444'),
(5, '25205 Capital Road', 'Seattle', 'WA', '98121', '206-441-0305'),
(6, '65542 244th Avenue', 'Santa Barbara', 'CA', '95345', '444-455-4466'),
(7, '23334 Apple Lane', 'Cupertino', 'CA', '95014', '408-253-9619');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `customerID` int(11) NOT NULL AUTO_INCREMENT,
  `customerFirstName` varchar(60) NOT NULL,
  `customerLastName` varchar(60) NOT NULL,
  `shipAddress` int(11) NOT NULL,
  `billAddress` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`customerID`),
  KEY `shipAddress` (`shipAddress`),
  KEY `billAddress` (`billAddress`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerID`, `customerFirstName`, `customerLastName`, `shipAddress`, `billAddress`, `email`, `password`) VALUES
(1, 'John', 'Smith', 1, 1, 'smith@anemail.com', 'js'),
(2, 'Mary', 'Jones', 2, 3, 'smithm@anemail.com', 'mj'),
(5, 'Edward', 'Scissorhands', 5, 5, 'escissorhands@acreepyemail.com', 'blades'),
(6, 'Kathy', 'Dean', 4, 3, 'kdean$$@anemail.com', 'kd$'),
(9, 'Georgia', 'Washington', 7, 7, 'gwash@anemail.com', 'GWA'),
(10, 'Isabela', 'Massimi', 6, 6, 'imassimi@anemail.com', 'ISAMASSI');

-- --------------------------------------------------------

--
-- Table structure for table `generalLedgerAccts`
--

CREATE TABLE IF NOT EXISTS `generalLedgerAccts` (
  `accountID` int(11) NOT NULL AUTO_INCREMENT,
  `accountDescription` varchar(255) NOT NULL,
  PRIMARY KEY (`accountID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `generalLedgerAccts`
--

INSERT INTO `generalLedgerAccts` (`accountID`, `accountDescription`) VALUES
(1, 'Assets'),
(2, 'Liabilities'),
(3, 'Operating Revenues'),
(4, 'Operating Expenses'),
(5, 'Non-operating expenses and losses'),
(6, 'Non-operating revenue');

-- --------------------------------------------------------

--
-- Table structure for table `invoiceLineItems`
--

CREATE TABLE IF NOT EXISTS `invoiceLineItems` (
  `accountID` int(20) NOT NULL,
  `invoiceID` int(11) NOT NULL,
  KEY `accountID` (`accountID`),
  KEY `invoiceID` (`invoiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoiceLineItems`
--

INSERT INTO `invoiceLineItems` (`accountID`, `invoiceID`) VALUES
(1, 6),
(4, 2),
(5, 3),
(3, 4),
(2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE IF NOT EXISTS `invoices` (
  `invoiceID` int(11) NOT NULL AUTO_INCREMENT,
  `vendorID` int(11) NOT NULL,
  `invoiceNumber` varchar(255) NOT NULL,
  `invoiceDate` date NOT NULL,
  `invoiceTotal` decimal(10,2) NOT NULL,
  `paymentTotal` decimal(10,2) DEFAULT NULL,
  `creditTotal` decimal(10,2) DEFAULT NULL,
  `invoiceDueDate` date DEFAULT NULL,
  `paymentDate` date DEFAULT NULL,
  `termsID` int(11) NOT NULL,
  PRIMARY KEY (`invoiceID`),
  KEY `termsID` (`termsID`),
  KEY `vendorID` (`vendorID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`invoiceID`, `vendorID`, `invoiceNumber`, `invoiceDate`, `invoiceTotal`, `paymentTotal`, `creditTotal`, `invoiceDueDate`, `paymentDate`, `termsID`) VALUES
(3, 4, 'XCCCV20190001', '2019-01-12', '1245.95', '1245.95', '0.00', '2019-03-12', '2019-03-06', 4),
(4, 2, '20190101DD5', '2019-01-01', '1075.96', '1075.96', '0.00', '2019-02-01', '2019-01-30', 1),
(5, 3, 'T2405', '2019-04-24', '2698.00', '2698.00', NULL, '2019-07-24', NULL, 5),
(6, 3, 'T2406', '2019-04-24', '698.00', '698.00', '0.00', '2019-05-01', '2019-04-26', 6),
(7, 1, '7DD2019504', '2019-05-30', '1075.96', '1075.96', NULL, '2019-06-09', NULL, 9);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(60) NOT NULL,
  `prodDescription` varchar(255) DEFAULT NULL,
  `unitCost` decimal(10,2) NOT NULL,
  `salesPrice` decimal(10,2) NOT NULL,
  `vendorID` int(11) NOT NULL,
  PRIMARY KEY (`productID`),
  KEY `vendorID` (`vendorID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productID`, `productName`, `prodDescription`, `unitCost`, `salesPrice`, `vendorID`) VALUES
(1, 'Tutu child', 'Child''s tutu - miscellaneous colors', '4.97', '14.10', 3),
(2, 'Gamba Toe Shoes', 'This item is on backorder', '49.99', '99.99', 2),
(3, 'Tap Shoe - Adult Size 7', 'This item is on backorder', '34.97', '74.99', 1),
(4, 'Tights 4556', 'Seamed adult tights "Ballet Pink", miscellaneous sizes', '4.97', '11.99', 2),
(5, 'Miss Kitty Dance Bag', 'Dance Bag - childrens - "Miss Kitty"', '12.97', '25.99', 4),
(6, 'Tutu adult', 'Adult tutu - miscellaneous colors', '8.97', '24.10', 3),
(7, 'Gamba Optima Toe Shoes', 'This item is on backorder', '59.99', '109.99', 2),
(8, 'Tap Shoe - Adult Size 8', 'This item is on backorder', '34.97', '74.99', 1),
(9, 'Tights 4999', 'Seamless adult tights "Ballet Pink", miscellaneous sizes', '4.97', '11.99', 5),
(10, 'Swan Lake Dance Bag', 'Dance Bag - childrens - "Swan Lake"', '12.97', '25.99', 4);

-- --------------------------------------------------------

--
-- Table structure for table `saleDetail`
--

CREATE TABLE IF NOT EXISTS `saleDetail` (
  `SaleDetailID` int(20) NOT NULL AUTO_INCREMENT,
  `saleID` int(20) NOT NULL,
  `productID` int(20) NOT NULL,
  `quantity` int(20) NOT NULL,
  `dateSold` date NOT NULL,
  PRIMARY KEY (`SaleDetailID`),
  KEY `saleID` (`saleID`,`productID`),
  KEY `productID` (`productID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `saleDetail`
--

INSERT INTO `saleDetail` (`SaleDetailID`, `saleID`, `productID`, `quantity`, `dateSold`) VALUES
(1, 2, 3, 5, '2019-02-10'),
(2, 4, 6, 1, '2019-03-09'),
(3, 1, 3, 1, '2019-01-08'),
(4, 3, 8, 2, '2019-02-27'),
(5, 5, 9, 1, '2019-05-26'),
(6, 5, 3, 1, '2019-05-26');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
  `saleID` int(20) NOT NULL AUTO_INCREMENT,
  `customerID` int(11) NOT NULL,
  PRIMARY KEY (`saleID`),
  KEY `customerID` (`customerID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`saleID`, `customerID`) VALUES
(5, 1),
(6, 2),
(3, 5),
(4, 6),
(2, 9),
(1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE IF NOT EXISTS `terms` (
  `termsID` int(11) NOT NULL AUTO_INCREMENT,
  `termsDescription` varchar(255) NOT NULL,
  PRIMARY KEY (`termsID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`termsID`, `termsDescription`) VALUES
(1, '30 Days'),
(2, '45 Days'),
(4, '60 Days'),
(5, '90 Days'),
(6, 'Payable Upon Receipt'),
(9, '10 Days');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE IF NOT EXISTS `vendors` (
  `vendorID` int(20) NOT NULL AUTO_INCREMENT,
  `vendorName` varchar(60) NOT NULL,
  `vendorStrAddress` varchar(255) NOT NULL,
  `vendorCity` varchar(60) NOT NULL,
  `vendorState` varchar(60) NOT NULL,
  `vendorZipCode` varchar(60) NOT NULL,
  `vendorPhone` varchar(60) NOT NULL,
  `vendorRepName` varchar(255) NOT NULL,
  `termsID` int(20) NOT NULL,
  `accountID` int(20) NOT NULL,
  PRIMARY KEY (`vendorID`),
  KEY `termsID` (`termsID`,`accountID`),
  KEY `accountID` (`accountID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`vendorID`, `vendorName`, `vendorStrAddress`, `vendorCity`, `vendorState`, `vendorZipCode`, `vendorPhone`, `vendorRepName`, `termsID`, `accountID`) VALUES
(1, 'Capezio', '4556 56th Avenue', 'Los Angeles', 'WA', '95121', '310-456-7899', 'Candy Apple', 1, 4),
(2, 'Broadview Supplies', '777 7th Avenue', 'Phoenix', 'AZ', '85243', '480-111-1111', 'Jamie Surla', 2, 4),
(3, 'CanCan Suppliers', '34556 156th Avenue', 'Portland', 'OR', '87776', '405-888-8888', 'Sandra George', 1, 4),
(4, 'Harlow, Inc.', '22777 Main Street', 'Preoria', 'AZ', '85665', '480-222-1111', 'Samantha Fargo', 2, 4),
(5, 'Danskin', '55555 Garden Lane', 'Vancouver', 'WA', '56899', '222-333-4444', 'Dave Tombola', 4, 4);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`shipAddress`) REFERENCES `addresses` (`addressID`),
  ADD CONSTRAINT `customers_ibfk_2` FOREIGN KEY (`billAddress`) REFERENCES `addresses` (`addressID`);

--
-- Constraints for table `invoiceLineItems`
--
ALTER TABLE `invoiceLineItems`
  ADD CONSTRAINT `invoiceLineItems_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `generalLedgerAccts` (`accountID`) ON DELETE NO ACTION;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`termsID`) REFERENCES `terms` (`termsID`),
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`vendorID`) REFERENCES `vendors` (`vendorID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`vendorID`) REFERENCES `vendors` (`vendorID`);

--
-- Constraints for table `saleDetail`
--
ALTER TABLE `saleDetail`
  ADD CONSTRAINT `saleDetail_ibfk_2` FOREIGN KEY (`saleID`) REFERENCES `sales` (`saleID`) ON DELETE NO ACTION,
  ADD CONSTRAINT `saleDetail_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE NO ACTION;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customers` (`customerID`);

--
-- Constraints for table `vendors`
--
ALTER TABLE `vendors`
  ADD CONSTRAINT `vendors_ibfk_2` FOREIGN KEY (`termsID`) REFERENCES `terms` (`termsID`) ON DELETE NO ACTION,
  ADD CONSTRAINT `vendors_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `generalLedgerAccts` (`accountID`) ON DELETE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
