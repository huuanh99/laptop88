-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 10, 2020 lúc 09:06 AM
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
(3, 'huuanh', '202cb962ac59075b964b07152d234b70');

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
(9, 'RAZER'),
(10, 'ACER');

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
(9, 'Đức Hùng', '0981434012', '341 Nguyễn Trãi', 87540000, 'UNPAID');

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
(1, 'Laptop Acer Aspire 3 A315-56-59XY - Intel Core i5', 'AcerAspire3.png', 'ACER', '                             	                             	                             	                             	Laptop cao cấp sang trọng giá thành hợp lý\r\n                             \r\n                             \r\n                             \r\n                             ', 20, 11990000, 'SCHOOL OFFICE'),
(2, 'Dell Precision M4800 Intel Core i7 MQ', 'DellPrecisionM4800.png', 'DELL', '                             	Máy trạm cấu hình tốt phù hợp với các đối tượng có nhu cầu sử dụng kỹ thuật đồ họa                             \r\n                             \r\n                             ', 15, 14200000, 'GRAPHICS DESIGN'),
(3, 'Laptop cao cấp HP Folio 9480m - Intel Core i5', 'HPFolio9480m.png', 'HP', '                             	Laptop cấu hình tốt giá cả phải chăng\r\n                             \r\n                             ', 13, 7150000, 'OLD'),
(4, 'Laptop Lenovo Legion 5 15ARH05 82B500FXVN - AMD Ryzen 5', 'LenovoLegion5.png', 'LENOVO', '                             	Màn hình 300 nits, 144Hz, 100% sRGB cấu hình R5-4600H, GTX 1650, 16GB RAM, SSD 512GB NVMe\r\n                             \r\n                             \r\n                             \r\n                             ', 14, 22700000, 'GAMING'),
(5, 'Laptop Dell XPS 9500 - Intel Core i7', 'DellXPS9500.jpg', 'APPLE', '                             	                             	Laptop Dell XPS cấu hình cao, màn 15 inch Chip i7 10750H, card rời RTX 1650Ti 4GB Bảo hành 12 tháng\r\n                             \r\n                             \r\n                             \r\n                             \r\n                             ', 12, 51990000, 'DELUXE'),
(7, 'Asus Vivobook', 'AsusVivobook.png', 'ASUS', 'Thiết kế sang trọng              \r\n                             ', 23, 21390000, 'DELUXE'),
(8, 'Laptop LG Gram 2020 14ZD90N-V.AX55A5 - Hàng chính hãng', 'LG_Gram.png', 'LG', '                             	                             	                             	                             	Bảo hành 12 tháng chính hãng - Xem chính sách\r\n\r\n✅Giá ở trên đã bao gồm 10% VAT\r\n\r\n✅ MIỄN PHÍ GIAO HÀNG TẬN NHÀ\r\n\r\n- Với đơn hàng < 4.000.000 đồng: Miễn phí giao hàng cho đơn hàng < 5km tính từ cửa hàng Laptop88 gần nhất\r\n\r\n- Với đơn hàng > 4.000.000 đồng: Miễn phí giao hàng (khách hàng chịu phí bảo hiểm hàng hóa nếu có)                             	\r\n                             \r\n                             \r\n                             \r\n                             \r\n                             ', 8, 26490000, 'DELUXE'),
(9, 'Dell XPS 13 9370 - Intel Core i7', 'DellXPS9370.png', 'DELL', '                             	                             	                             	                             	Laptop mỏng nhẹ cao cấp nhất của Dell\r\nCấu hình cao, Giá cực tốt\r\nBảo hành 12 tháng   \r\nRAM:8GB\r\nChip:Core I7\r\nCard:NVIDIA GTX1050\r\nỔ cứng:SSD512GB                          	\r\n                             \r\n                             \r\n                             \r\n                             \r\n                             ', 16, 23500000, 'DELUXE');

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
(12, 5, 8, 1);

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
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `product_payment`
--
ALTER TABLE `product_payment`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `type`
--
ALTER TABLE `type`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
