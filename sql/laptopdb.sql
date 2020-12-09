-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 09, 2020 lúc 04:39 PM
-- Phiên bản máy phục vụ: 10.4.6-MariaDB
-- Phiên bản PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `laptopdb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(3) NOT NULL,
  `username` varchar(30) COLLATE utf8_bin NOT NULL,
  `password` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(4, 'quang', '065d64f121f60917a6ed9a72184d6954'),
(5, 'huuanh', '5625215db2bbf8fa28f3f32eb2a85d9a');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` int(3) NOT NULL,
  `brand` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `brand`) VALUES
(1, 'DELL'),
(2, 'ASUS'),
(3, 'APPLE'),
(4, 'LENOVO'),
(5, 'LG'),
(6, 'HP'),
(7, 'ASUS'),
(8, 'MSI'),
(9, 'BKAV'),
(10, 'ACER'),
(13, 'SAMSUNG');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment`
--

CREATE TABLE `payment` (
  `id` int(3) NOT NULL,
  `name` varchar(30) COLLATE utf8_bin NOT NULL,
  `phone` varchar(30) COLLATE utf8_bin NOT NULL,
  `address` varchar(300) COLLATE utf8_bin NOT NULL,
  `total` int(12) NOT NULL,
  `status` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `payment`
--

INSERT INTO `payment` (`id`, `name`, `phone`, `address`, `total`, `status`) VALUES
(7, 'trần hữu anh', '0945586004', '6lk4b khu đô thị mỗ lao', 64970000, 'UNPAID'),
(8, 'Đức Hùng', '0981434012', '341 Nguyễn Trãi', 87540000, 'UNPAID'),
(9, 'Đức Hùng', '0981434012', '341 Nguyễn Trãi', 87540000, 'UNPAID'),
(10, 'trần hữu anh', '0945586004', '6lk4b khu đô thị mỗ lao', 12400000, 'UNPAID');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(3) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `image` varchar(500) COLLATE utf8_bin NOT NULL,
  `brand` varchar(30) COLLATE utf8_bin NOT NULL,
  `description` varchar(1000) COLLATE utf8_bin NOT NULL,
  `quantity` int(3) NOT NULL,
  `price` int(10) NOT NULL,
  `type` varchar(30) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `brand`, `description`, `quantity`, `price`, `type`) VALUES
(20, 'Acer Aspire 3', 'AcerAspire3.png', 'ACER', '                             	Mẫu laptop hiện đại                       	\r\n                             \r\n                             \r\n                             ', 23, 12300000, 'SCHOOL OFFICE'),
(21, 'Asus Pro 1440 FA', 'AsusProP1440FA.png', 'ASUS', ' Laptop chính hãng chất lượng cao                    	\r\n                             \r\n                             ', 5, 18000000, 'GRAPHICS DESIGN'),
(22, 'Asus Vivobook', 'AsusVivobook.png', 'ASUS', ' Laptop cao cấp sang trọng                        	\r\n                             \r\n                             ', 3, 27500000, 'DELUXE'),
(23, 'Dell Precision M4800', 'DellPrecisionM4800.png', 'DELL', '                             	    Laptop gaming cấu hình cao                         	\r\n                             \r\n                             ', 12, 17600000, 'GAMING'),
(24, 'HP Folio9480n', 'HPFolio9480m.png', 'HP', '                             	    Laptop dành cho dân văn phòng                         	\r\n                             \r\n                             ', 21, 11000000, 'SCHOOL OFFICE'),
(25, 'Lenovo IdeapadGaming3', 'LenovoIdeapadGaming3.png', 'LENOVO', '                             	    Laptop rẻ mới nhập                         	\r\n                             \r\n                             ', 14, 9500000, 'SCHOOL OFFICE'),
(28, 'Dell XPS 9500', 'DellXPS9500.jpg', 'DELL', '                             	Máy bền đẹp chất lượng cao                             	\r\n                             \r\n                             ', 11, 7300000, 'OLD');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_payment`
--

CREATE TABLE `product_payment` (
  `id` int(3) NOT NULL,
  `productId` int(3) NOT NULL,
  `paymentId` int(3) NOT NULL,
  `quantity` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `product_payment`
--

INSERT INTO `product_payment` (`id`, `productId`, `paymentId`, `quantity`) VALUES
(8, 1, 7, 1),
(9, 8, 7, 2),
(10, 3, 8, 1),
(11, 2, 8, 2),
(12, 5, 8, 1),
(13, 20, 10, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type`
--

CREATE TABLE `type` (
  `id` int(6) NOT NULL,
  `type` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `type`
--

INSERT INTO `type` (`id`, `type`) VALUES
(1, 'OLD'),
(2, 'SCHOOL OFFICE'),
(3, 'GRAPHICS DESIGN'),
(4, 'GAMING'),
(5, 'DELUXE');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(6) NOT NULL,
  `username` varchar(25) COLLATE utf8_bin NOT NULL,
  `password` varchar(100) COLLATE utf8_bin NOT NULL,
  `fullname` varchar(25) COLLATE utf8_bin NOT NULL,
  `address` varchar(25) COLLATE utf8_bin NOT NULL,
  `phone` varchar(10) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `fullname`, `address`, `phone`) VALUES
(32, 'huyen', 'dba2b86b489924ba4503a523bac2dcbe', 'Trần Thu Huyền', '6lk4b khu đô thị mỗ lao', '0945586003'),
(33, 'huong', '3f414d9749c322ff0c81e8306449da04', 'Thu Hương', '6lk4b khu đô thị mỗ lao', '0914124342'),
(36, 'huuanh', '5625215db2bbf8fa28f3f32eb2a85d9a', 'Nguyễn Hữu Anh', '423 Trần Phú', '0932423843');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_payment`
--
ALTER TABLE `product_payment`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `product_payment`
--
ALTER TABLE `product_payment`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `type`
--
ALTER TABLE `type`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
