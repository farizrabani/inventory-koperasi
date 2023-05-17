-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2023 at 01:56 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `koperasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(30) NOT NULL,
  `level_id` int(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `image` varchar(128) NOT NULL,
  `is_active` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `name`, `email`, `level_id`, `password`, `position`, `image`, `is_active`) VALUES
(59, 'Aji2', 'ajiutomo0008@gmail.com', 2, '25d55ad283aa400af464c76d713c07ad', 'Manager', 'cattt21.jpg', 1),
(66, 'Aji1', 'crispynuts08@gmail.com', 1, '25d55ad283aa400af464c76d713c07ad', 'staff', 'cattt2.jpg', 1),
(67, 'Aji3', 'ajiutomo008@gmail.com', 3, '25d55ad283aa400af464c76d713c07ad', 'kepala koperasi', 'default.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `token` varchar(123) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_token`
--

INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES
(90, 'crispynuts08@gmail.com', 'WcEONB6I3ccnO2kHVJEyf7ov08GLHF7FvV2p3l8385Q=', 0),
(91, 'crispynuts08@gmail.com', 'W866onc5wWlAht5H18wOp+suGY9Fsl4LI7ok7b5yW4o=', 0),
(92, 'crispynuts08@gmail.com', 'yDO23VvO7lWLTC5ALqFqq/34SNExhkiZ5Goe2vNA4r8=', 0),
(93, 'crispynuts08@gmail.com', '1emTyLFrJ8Xh7jpXppNNmAfm6SmVRYv4HZnT6r36PVA=', 0),
(94, 'ajiutomo0008@gmail.com', 'F6csyLung66q7cWjXl7KUxnWElHWAKYXd9rOiiqM02s=', 0),
(95, 'crispynuts08@gmail.com', 'xQaye+JY+GJKpIky5NEKxk87MUtvK/CuElXTSSWLhs0=', 0),
(96, 'ajiutomo0008@gmail.com', 'rBycm+KtQ6pu4Zfm7uTgmij4ZHYp8LBFdmAuXc+jKm0=', 0),
(97, 'ajiutomo0008@gmail.com', '51obowuJeePIcirtrYMQOdfNjJEGSmHSm5pNk6Wt9eo=', 0),
(98, 'ajiutomo0008@gmail.com', 'O8d9gzKSYJk7M+/OLJlcBId9s6R+dDv4r5xSkuXdFVQ=', 0),
(99, 'ajiutomo0008@gmail.com', 'HJ09CertZQFMCiwfsz/DDIpQm9sYUBQ/pdGXwN3ZLeY=', 0),
(100, 'ajiutomo0008@gmail.com', 'rI3tLK6B4lFtXeTOI+AvGFjhYZIU03Vxg5QCKye+BXc=', 0),
(101, 'ajiutomo0008@gmail.com', 'XYdBRqUvOAa8Rc2EIfBv/Gk2HXDsW1/tSR7Og8iRIIE=', 0),
(102, 'ajiutomo0008@gmail.com', 'L5AK8dmDn0r+9AlRfrNL9yPi1lDHWTVLVrys2B0T4Rw=', 0),
(103, 'ajiutomo0008@gmail.com', 's5+Y343kqqnBisnHi8v9wfM82jPOfKgdvCYrqn79L0A=', 0),
(104, 'ajiutomo0008@gmail.com', 'P3dKN4JbjEc/T2N+0wbvWd4GaWCIKKiJMWr84WuIqKA=', 0),
(105, 'ajiutomo0008@gmail.com', 'cSEiiP6bVbmCS3fX3vckM+n3EyzFa29HUxws2I48VN4=', 0),
(106, 'ajiutomo0008@gmail.com', '+iVPOtkycIR1DjaFe0v83ncd9F1gg6HeVdJt/3uJ3fk=', 0),
(107, 'ajiutomo0008@gmail.com', 'M65oNTHK4jpUXOrQ2IKD2VjnTHk+WMEZ3WevQejBOwQ=', 0),
(108, 'ajiutomo0008@gmail.com', '4LmYvwRt9JIsi+XVMai3IDEfU12CEAQelg2vPr7uRwM=', 0),
(109, 'ajiutomo0008@gmail.com', 'aIPfJGZvGX56kZGm0JVz05sXo6lazPafyii/WSIKxgc=', 0),
(110, 'ajiutomo0008@gmail.com', '3pjzW9kALz38M7GUxLJZMeu4kal4pwqEsuM0Bpsu/PA=', 0),
(111, 'ajiutomo0008@gmail.com', 'dIxFxLA4byH/1r9/nE8VmRaXV3L0KnsVkM99g4rdPww=', 0),
(112, 'crispynuts08@gmail.com', 'WtsPCITH0wu6qThJKVILj8/37GMrRYZhKo+4PfuWsn8=', 0),
(113, 'crispynuts08@gmail.com', 'C7niMSHJbcnye2ZjSEv8i0C193eVG/xccUdlzUI6GYE=', 0),
(114, 'crispynuts08@gmail.com', 'YH/z6eCcsaf95OFWrHyt3Vb5PV2dHwCfkIUojNSU8O8=', 0),
(115, 'crispynuts08@gmail.com', 'VmXi3kKtqjK7Aei/lTEd07HjwEbJQ0dh+Uty6itGx9I=', 0),
(116, 'crispynuts08@gmail.com', '6k6vTfrrFhCQU+3kY/TQkzO6BZC560ohMRnAicA1Plk=', 0),
(117, 'crispynuts08@gmail.com', 'jc7u8NjELzY46xkOLbxZ9TMOC37HmO9Ef3Gn/6srjKg=', 0),
(118, 'crispynuts08@gmail.com', '3sXBIp21il0i8yIVa5TCAFVzo1KsUwB55GOmBlXQQBM=', 0),
(119, 'crispynuts08@gmail.com', '/Zi5RT5YOEkr1p2XgugVaQIZCgOOM8szKCbRmNLaeHk=', 0),
(120, 'crispynuts08@gmail.com', 'GPxukIomBFj8zk2Z4xB5KMLdyXhbt4MQCCXL82ss8+M=', 0),
(121, 'ajiutomo0008@gmail.com', 'tW8bLWWcz6ZigGIJCvlojWfXOYrewYVxmV7uaL5KK7g=', 0),
(122, 'ajiutomo0008@gmail.com', 'uOPdhOCOPqBhaUSpKHlQbSYQTBc9fzu7OItOuwlFlEU=', 0),
(123, 'crispynuts08@gmail.com', '1IGmluO/8JWQ2LmA7R9CiEn4n5JZdUhVGGc/lxL0fCk=', 0),
(124, 'crispynuts08@gmail.com', 'yL4P+T79wn99fIyvnp5LpQglkEKG6Uw/VZxy5sBfgkU=', 0),
(125, 'ajiutomo0008@gmail.com', 'gn2dgaAR7hFYHMRFhP3ia+twuIvQf4pQx8QdYAFEKjw=', 0),
(126, 'crispynuts08@gmail.com', 'c+EKTF+ovnxP746w07HK9igDTDdYM50EHIn23rVTt4U=', 0),
(127, 'ajiutomo0008@gmail.com', 'DePrEWstHLH8aWVfZbaoIf28ldKSYQnobMncb2ucrG0=', 0),
(128, 'crispynuts08@gmail.com', 'ufaygd3xfsibyaH2uYSyHpqoJ9Y6LvuAQbxMlUlAYfQ=', 0),
(129, 'crispynuts08@gmail.com', 'JzDIHjSLZ3d2DYZSxRfFM3ggT8hHIkC+kmzYP704NhM=', 0),
(130, 'ajiutomo0008@gmail.com', 'K2UWRBhekjrotOWjfSfbFwZgYAyvaLUY/z2oyM9sWBQ=', 0),
(131, 'ajiutomo0008@gmail.com', 'ug5aTEQiqA7xMDPuDnqcojO/VTiQVfGB6XaPTCdHbeI=', 0),
(132, 'ajiutomo0008@gmail.com', 'h8qBejztzJ054A/DbkUFNirv5HL48Zs2C89sQEc0/Cg=', 0),
(133, 'crispynuts08@gmail.com', '4q4tmyGL9CN3wlW9DtZskC8NEzh8gZVdLS7DVgH/3VI=', 0),
(134, 'crispynuts08@gmail.com', 'qQ4ckP5NqDfdH+ra9VmDGIO7cTzlAU3HXFo7ISca6Ro=', 0),
(135, 'crispynuts08@gmail.com', '28bkrAz8nyBDBFdtFxZ/icFZwkIOvEx3ZNmXA3mKCTw=', 0),
(136, 'crispynuts08@gmail.com', '7bJrarySxyadoiEOjs3hjoh30qvJwKhcm36QngDsews=', 0),
(137, 'crispynuts08@gmail.com', '1QuhcPsq73Ozy5PWAMnZhJVS3olrgHrlReWf5jUrYCc=', 0),
(138, 'ajiutomo0008@gmail.com', 'BGSNBdUy0VVpPcGVex9i0tc5pLS7XvpJjQahJ/vsrEk=', 0),
(139, 'ajiutomo0008@gmail.com', 'J1US1eWVRf+jH7Lk55LioypJheZ0PeO8Xib44fYh01M=', 0),
(140, 'ajiutomo0008@gmail.com', 'eirUQtAGb0yh60JE9XYdwJvizRMe4IzJBrijkrzSFZE=', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
