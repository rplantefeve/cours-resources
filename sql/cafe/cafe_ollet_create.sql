-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 28 Avril 2016 à 16:19
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
CREATE DATABASE IF NOT EXISTS `cafe` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cafe`;

-- --------------------------------------------------------

--
-- Structure de la table `consommation`
--

CREATE TABLE IF NOT EXISTS `consommation` (
  `numCon` int(11) NOT NULL,
  `libelleCon` varchar(30) NOT NULL,
  `prixCon` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE IF NOT EXISTS `employe` (
  `matricule` varchar(6) NOT NULL,
  `numSecu` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `enregistrement`
--

CREATE TABLE IF NOT EXISTS `enregistrement` (
  `numFac` int(11) NOT NULL,
  `numCon` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE IF NOT EXISTS `facture` (
  `numFac` int(11) NOT NULL,
  `dateFac` date NOT NULL,
  `numSer` varchar(6) NOT NULL,
  `numTab` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `serveur`
--

CREATE TABLE IF NOT EXISTS `serveur` (
  `numSer` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `dateEmbauche` date NOT NULL,
  `courriel` varchar(40) DEFAULT NULL,
  `matricule` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tables`
--

CREATE TABLE IF NOT EXISTS `tables` (
  `numTab` int(11) NOT NULL,
  `typeTab` varchar(20) NOT NULL,
  `nbPlaces` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `consommation`
--
ALTER TABLE `consommation`
 ADD PRIMARY KEY (`numCon`);

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
 ADD PRIMARY KEY (`matricule`), ADD UNIQUE KEY `numSecu` (`numSecu`);

--
-- Index pour la table `enregistrement`
--
ALTER TABLE `enregistrement`
 ADD PRIMARY KEY (`numFac`,`numCon`), ADD KEY `fk_contenir_numCon_consommation_numCon` (`numCon`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
 ADD PRIMARY KEY (`numFac`), ADD KEY `numSer` (`numSer`), ADD KEY `numTab` (`numTab`);

--
-- Index pour la table `serveur`
--
ALTER TABLE `serveur`
 ADD PRIMARY KEY (`numSer`), ADD UNIQUE KEY `matricule` (`matricule`);

--
-- Index pour la table `tables`
--
ALTER TABLE `tables`
 ADD PRIMARY KEY (`numTab`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `enregistrement`
--
ALTER TABLE `enregistrement`
ADD CONSTRAINT `fk_contenir_numCon_consommation_numCon` FOREIGN KEY (`numCon`) REFERENCES `consommation` (`numCon`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_contenir_numFac_facture_numFac` FOREIGN KEY (`numFac`) REFERENCES `facture` (`numFac`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
ADD CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`numSer`) REFERENCES `serveur` (`matricule`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_facture_numTab_tables_numTab` FOREIGN KEY (`numTab`) REFERENCES `tables` (`numTab`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `serveur`
--
ALTER TABLE `serveur`
ADD CONSTRAINT `serveur_ibfk_1` FOREIGN KEY (`matricule`) REFERENCES `employe` (`matricule`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
