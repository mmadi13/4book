-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 22 mars 2021 à 11:37
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `forum`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `idArt` int(11) NOT NULL AUTO_INCREMENT,
  `titreArt` varchar(255) NOT NULL,
  `idRub` int(11) NOT NULL,
  `contenuArt` text NOT NULL,
  `idMemb` int(11) NOT NULL,
  `etatArt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idArt`),
  KEY `NoRubrique` (`idRub`),
  KEY `idMemb` (`idMemb`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`idArt`, `titreArt`, `idRub`, `contenuArt`, `idMemb`, `etatArt`) VALUES
(17, 'Les miserables', 1, '<p>recheche edition limite</p>', 18, NULL),
(18, 'Migale', 1, '<p>recherche une édition de mygale</p>', 18, NULL),
(19, 'Le compte des 1001 nuits', 1, '<p>recherche  un exemplaire</p>', 22, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `idCat` int(11) NOT NULL AUTO_INCREMENT,
  `nomCat` varchar(255) NOT NULL,
  PRIMARY KEY (`idCat`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idCat`, `nomCat`) VALUES
(1, 'Genre littéraire'),
(2, 'Sous-Genre littéraire');

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `idCom` int(11) NOT NULL AUTO_INCREMENT,
  `idMemb` int(11) NOT NULL,
  `contenuCom` text NOT NULL,
  `dateCom` date NOT NULL,
  `idArt` int(11) NOT NULL,
  PRIMARY KEY (`idCom`),
  KEY `id` (`idMemb`),
  KEY `NoSujet` (`idArt`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`idCom`, `idMemb`, `contenuCom`, `dateCom`, `idArt`) VALUES
(22, 22, '<p>recherche trouver</p>', '2021-03-22', 19);

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

DROP TABLE IF EXISTS `membre`;
CREATE TABLE IF NOT EXISTS `membre` (
  `idMemb` int(11) NOT NULL AUTO_INCREMENT,
  `nomMemb` varchar(255) NOT NULL,
  `prenomMemb` varchar(255) NOT NULL,
  `pseudoMemb` varchar(255) NOT NULL,
  `statutMemb` int(11) NOT NULL,
  `mdpMemb` varchar(255) NOT NULL,
  `adrMailMemb` varchar(255) NOT NULL,
  `excluMemb` tinyint(1) NOT NULL,
  PRIMARY KEY (`idMemb`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`idMemb`, `nomMemb`, `prenomMemb`, `pseudoMemb`, `statutMemb`, `mdpMemb`, `adrMailMemb`, `excluMemb`) VALUES
(17, 'Line', 'Line', 'Line', 3, '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'line@gmail.com', 0),
(18, 'mehdi', 'mehdi', 'Mehdi', 1, '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'mehdi@mehdi.fr', 0),
(20, 'mehdi@madi.fr', 'mehdi@madi.fr', 'Mehdi@madi.fr', 1, 'b9bad8767773b3ec2dcba2adb620234936d352f7', 'mehdi@madi.fr', 0),
(21, 'mehdi', 'madi', 'Mamama', 3, '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'mehdi@madi1.fr', 0),
(22, 'kebir', 'rh', 'Kh', 3, '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'kebir@kebir.fr', 0),
(25, 'arison', 'sonic', 'Arso', 3, '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'kebirs@kebir.fr', 0),
(26, 'ines', 'ines', 'Inesrahou', 3, '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'inesrahou@kebir.fr', 0),
(29, 'abd', 'abd', 'Abd13', 3, '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'abd@adb13.fr', 0);

-- --------------------------------------------------------

--
-- Structure de la table `messagerie`
--

DROP TABLE IF EXISTS `messagerie`;
CREATE TABLE IF NOT EXISTS `messagerie` (
  `idMsg` int(11) NOT NULL AUTO_INCREMENT,
  `idMembDest` int(11) DEFAULT NULL,
  `idGroupe` int(11) DEFAULT NULL,
  `idMembExp` int(11) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`idMsg`),
  KEY `idMembDest` (`idMembDest`),
  KEY `idMembExp` (`idMembExp`),
  KEY `idGroupe` (`idGroupe`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `messagerie`
--

INSERT INTO `messagerie` (`idMsg`, `idMembDest`, `idGroupe`, `idMembExp`, `msg`) VALUES
(1, 4, NULL, 2, '<p>groirj</p>'),
(2, NULL, 1, 2, '<p>nfmknb</p>'),
(3, 4, NULL, 2, '??'),
(4, 4, NULL, 2, 'khi'),
(5, 4, NULL, 2, 'knmkn'),
(6, 4, NULL, 2, '<p>salut<p>'),
(7, 4, NULL, 2, 'mdrrr'),
(8, 4, NULL, 2, 'efjkze'),
(9, 4, NULL, 2, 'gsreg'),
(10, 4, NULL, 2, 'danger'),
(11, 4, NULL, 2, 'mdrr'),
(12, 3, NULL, 1, 'bfdkjv'),
(13, 5, NULL, 1, 'essai'),
(14, 1, NULL, 2, '<p>essai</p>'),
(15, 3, NULL, 2, '<p>cdcd</p>'),
(16, 2, NULL, 1, '<p>OK</p>'),
(17, 2, NULL, 1, '<p>nvkjdnv</p>'),
(19, 3, NULL, 1, '<p>mdr</p>'),
(20, 5, NULL, 1, '<p>essai2</p>'),
(21, 1, NULL, 1, 'boum'),
(22, 1, NULL, 1, 'trkl'),
(23, 2, NULL, 2, 'boum'),
(24, 2, NULL, 1, 'boum'),
(25, 1, NULL, 15, 'bdibci'),
(26, 16, NULL, 15, 'salut'),
(27, 16, NULL, 15, 'popo'),
(28, 15, NULL, 16, 'gogole'),
(29, 15, NULL, 16, 'nik\r\n'),
(30, 1, NULL, 17, 'salut'),
(31, 1, NULL, 18, 'Salut'),
(32, 1, NULL, 18, 'll'),
(33, 1, NULL, 18, 'k'),
(34, 1, NULL, 18, 'm'),
(35, 1, NULL, 18, 'm'),
(36, 1, NULL, 18, 'm'),
(37, 1, NULL, 18, 'test1\r\n'),
(38, 1, NULL, 18, 'ol'),
(39, 3, NULL, 18, 'm'),
(40, 1, NULL, 18, 'a\r\n'),
(41, 1, NULL, 18, 'a\r\n'),
(42, 2, NULL, 18, 'salut'),
(43, 3, NULL, 18, 'yo'),
(44, 3, NULL, 18, 'a\r\n'),
(45, 2, NULL, 18, 'possède tu un exemplaire des misserable'),
(46, 1, NULL, 22, 'salut\r\n\r\n');

-- --------------------------------------------------------

--
-- Structure de la table `rubrique`
--

DROP TABLE IF EXISTS `rubrique`;
CREATE TABLE IF NOT EXISTS `rubrique` (
  `idRub` int(11) NOT NULL AUTO_INCREMENT,
  `nomRub` varchar(255) NOT NULL,
  `idCat` int(11) DEFAULT NULL,
  `descRub` text NOT NULL,
  PRIMARY KEY (`idRub`),
  KEY `NoCat` (`idCat`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `rubrique`
--

INSERT INTO `rubrique` (`idRub`, `nomRub`, `idCat`, `descRub`) VALUES
(1, 'Roman', 1, 'Concernant la recherche de tout type de roman\r\n'),
(2, 'Oeuvre autobiographique', 1, 'Recherche des œuvres autobiographiques \r\n'),
(3, 'Épopée', 1, 'Concernant tout les types d\'épopées\r\n'),
(4, 'Nouvelle', 1, 'Concernant tout les nouvelles\r\n'),
(5, 'Nanolittérature', 1, 'Concernant tout les Nanolittérature\r\n'),
(6, ' Fragment', 1, 'Concernant les fragments\r\n'),
(7, 'Témoignage', 1, 'Concernant les témoignages\r\n'),
(8, 'Reportage', 2, 'Concernant les reportages narratifes\r\n'),
(9, 'Lettre', 2, 'Concernant les œuvres épistolaires\r\n');

-- --------------------------------------------------------

--
-- Structure de la table `signalement`
--

DROP TABLE IF EXISTS `signalement`;
CREATE TABLE IF NOT EXISTS `signalement` (
  `idSignal` int(11) NOT NULL AUTO_INCREMENT,
  `idMembSignal` int(11) NOT NULL,
  `idComSignal` int(11) NOT NULL,
  `idMembDenonce` int(11) NOT NULL,
  PRIMARY KEY (`idSignal`),
  KEY `idMembSignal` (`idMembSignal`),
  KEY `idComSignal` (`idComSignal`),
  KEY `idMembDenonce` (`idMembDenonce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`idRub`) REFERENCES `rubrique` (`idRub`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`idMemb`) REFERENCES `membre` (`idMemb`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `commentaire_ibfk_1` FOREIGN KEY (`idMemb`) REFERENCES `membre` (`idMemb`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commentaire_ibfk_2` FOREIGN KEY (`idArt`) REFERENCES `article` (`idArt`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
