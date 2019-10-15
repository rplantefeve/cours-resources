-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 28 Avril 2016 à 16:20
-- Version du serveur :  5.5.47-0+deb8u1
-- Version de PHP :  5.6.19-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `cafe`
--
USE `cafe`;

--
-- Contenu de la table `consommation`
--

INSERT INTO `consommation` (`numCon`, `libelleCon`, `prixCon`) VALUES
(1, 'Coca Cola', 1.5),
(2, 'Coca Cola Light', 1.8),
(3, 'Orangina', 2),
(4, 'Demi-peche', 2.5),
(5, 'Pastis', 3.5),
(10, 'Tomate', 6.5),
(11, 'Momie', 6.5),
(12, 'Perroquet', 4.5);

--
-- Contenu de la table `employe`
--

INSERT INTO `employe` (`matricule`, `numSecu`) VALUES
('m78965', '1800909654987'),
('m32165', '1840407654987'),
('m01235', '1850802654987'),
('m12399', '1870606321564'),
('m98765', '1900201654987');





--
-- Contenu de la table `tables`
--

INSERT INTO `tables` (`numTab`, `typeTab`, `nbPlaces`) VALUES
(1, 'Table en aluminium', 4),
(2, 'Table de jardin', 6),
(3, 'Table de brique', 2),
(4, 'Table en osier', 12);

--
-- Contenu de la table `serveur`
--

INSERT INTO `serveur` (`numSer`, `nom`, `adresse`, `dateEmbauche`, `courriel`, `matricule`) VALUES
(1, 'Arnaud Laporte', '2 rue de la Savoie 73100 Aix-les-bains', '2005-01-01', 'arnaudlaporte@savoie.fr', 'm01235'),
(2, 'Bertrand Cantot', '3 rue de la Haute-Savoie 74140 Bonneville', '2005-02-01', 'bertrandcantot@bonneville.fr', 'm32165'),
(3, 'Luc Alphou', '4 rue de France 75000 Paris', '2006-03-01', 'lucalphou@francia.fr', 'm78965'),
(4, 'Joseph Leliour', '5 rue de France 75000 Paris', '2006-03-01', 'josephleliour@francia.fr', 'm12399'),
(5, 'Guillaume Popaz', '6 rue de France 75000 Paris', '2006-03-01', 'guillaumepopaz@francia.fr', 'm98765');

--
-- Contenu de la table `facture`
--

INSERT INTO `facture` (`numFac`, `dateFac`, `numSer`, `numTab`) VALUES
(1, '2006-11-10', 'm01235', 4),
(2, '2006-11-02', 'm01235', 1),
(3, '2006-11-11', 'm32165', 2),
(4, '2006-08-02', 'm32165', 3),
(5, '2006-08-01', 'm32165', 4),
(6, '2006-11-03', 'm12399', 1),
(7, '2006-11-03', 'm12399', 2);




--
-- Contenu de la table `enregistrement`
--

INSERT INTO `enregistrement` (`numFac`, `numCon`, `quantite`) VALUES
(1, 1, 2),
(1, 2, 3),
(2, 1, 1),
(2, 2, 5),
(3, 1, 4),
(4, 1, 1),
(4, 3, 1),
(5, 1, 2),
(5, 2, 2),
(5, 3, 1),
(6, 1, 1),
(6, 3, 3),
(7, 1, 1),
(7, 4, 5);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
