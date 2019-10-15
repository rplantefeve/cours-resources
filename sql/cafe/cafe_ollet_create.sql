-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Jeu 05 Février 2015 à 17:04
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `cafe`
--
CREATE DATABASE IF NOT EXISTS `cafe` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cafe`;

-- --------------------------------------------------------

--
-- Structure de la table `consommation`
--

DROP TABLE IF EXISTS `consommation`;
CREATE TABLE IF NOT EXISTS `consommation` (
  `numCon` int(11) NOT NULL,
  `libelleCon` varchar(30) NOT NULL,
  `prixCon` float NOT NULL,
  PRIMARY KEY (`numCon`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `numFac` int(11) NOT NULL,
  `dateFac` date NOT NULL,
  `numSer` int(11) NOT NULL,
  `numTab` int(11) NOT NULL,
  PRIMARY KEY (`numFac`),
  KEY `numSer` (`numSer`),
  KEY `numTab` (`numTab`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `mentionne`
--

DROP TABLE IF EXISTS `mentionne`;
CREATE TABLE IF NOT EXISTS `mentionne` (
  `numFac` int(11) NOT NULL,
  `numCon` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  PRIMARY KEY (`numFac`,`numCon`),
  KEY `fk_contenir_numCon_consommation_numCon` (`numCon`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `serveur`
--

DROP TABLE IF EXISTS `serveur`;
CREATE TABLE IF NOT EXISTS `serveur` (
  `numSer` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `dateEmbauche` date NOT NULL,
  `courriel` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`numSer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tables`
--

DROP TABLE IF EXISTS `tables`;
CREATE TABLE IF NOT EXISTS `tables` (
  `numTab` int(11) NOT NULL,
  `typeTab` varchar(20) NOT NULL,
  `nbPlaces` int(11) NOT NULL,
  PRIMARY KEY (`numTab`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `fk_facture_numTab_tables_numTab` FOREIGN KEY (`numTab`) REFERENCES `tables` (`numTab`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_facture_numSer_serveur_numSer` FOREIGN KEY (`numSer`) REFERENCES `serveur` (`numSer`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `mentionne`
--
ALTER TABLE `mentionne`
  ADD CONSTRAINT `fk_contenir_numCon_consommation_numCon` FOREIGN KEY (`numCon`) REFERENCES `consommation` (`numCon`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_contenir_numFac_facture_numFac` FOREIGN KEY (`numFac`) REFERENCES `facture` (`numFac`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
