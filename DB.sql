-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Sam 27 Octobre 2012 à 22:07
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `mydatabase`
--

CREATE DATABASE `mydatabase`;
USE `mydatabase`;

-- --------------------------------------------------------

--
-- Structure de la table `annonces`
--

CREATE TABLE IF NOT EXISTS `annonces` (
  `Id_Annonce` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Categorie` varchar(20) NOT NULL,
  `Nom_Pays` varchar(20) NOT NULL,
  `Nom_Ville` varchar(20) NOT NULL,
  `Login_Membre` varchar(20) NOT NULL,
  `Nom_Auteur` varchar(30) NOT NULL,
  `Prenom_Auteur` varchar(30) NOT NULL,
  `Tel_Auteur` varchar(30) NOT NULL,
  `Email_Auteur` varchar(30) NOT NULL,
  `Publication` date NOT NULL,
  `Titre` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `Prix` int(11) NOT NULL,
  `Pro` tinyint(1) NOT NULL,
  `Checked` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id_Annonce`),
  KEY `Id_Annonce` (`Id_Annonce`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Contenu de la table `annonces`
--

INSERT INTO `annonces` (`Id_Annonce`, `Nom_Categorie`, `Nom_Pays`, `Nom_Ville`, `Login_Membre`, `Nom_Auteur`, `Prenom_Auteur`, `Tel_Auteur`, `Email_Auteur`, `Publication`, `Titre`, `Description`, `Prix`, `Pro`, `Checked`) VALUES
(4, 'Concerts', 'Benin', 'Benin', 'dblezo', 'Kodjo', 'adefem', '00898909898', 'kadefm@faaa.fr', '2012-10-11', 'Concert de tam tam', 'vente des places de concert d''un celebre groupe de tam tam', 70, 1, 0),
(5, 'Achat', 'Congo', 'Congo', 'dblezo', 'paraiso', 'mesmin', '0678787837', 'mesmin@paraiso.fr', '2012-10-11', 'vente maison', 'vend une maison de 200m2\r\n', 100000, 1, 0),
(6, 'Agences', 'Gabon', 'Gabon', 'dblezo', 'Blez', 'Jamal', '0779890089', 'dsfs@fre.fr', '2012-10-13', 'Vente de pierre de migou', 'description de l''annonce', 1222, 1, 1),
(9, 'Achat', 'Cameroun', 'Cameroun', 'xnl', 'dupuy', 'Mathieu', '0678818998', 'mathieu@esiea.fr', '2012-10-16', 'Peugeot 307', 'vend peugeot mauvais état ! a cause de rally paris dakar !', 12000, 1, 1),
(11, 'Electronique', 'Comores', 'Comores', 'jowel', 'saids', 'Jowel', '0632121212', 'jowel@974.fr', '2012-10-16', 'Congelateur nouvelle gen', 'Salam!! je m appel jowel et je vends un congelo nouvelle generation avec wifi !\r\nPrix a débattre', 1000, 1, 1),
(12, 'Electronique', 'Angola', 'Angola', 'marvin', 'balungidi', 'marvin', '0678987989', 'marvin@esiea.fr', '2012-10-17', 'Puces de telephone', 'Certainement pas une arnaque  !!! hi hi hih ', 1300, 1, 1),
(13, 'Sport', 'Burundi', 'Burundi', 'paraiso', 'paraiso', 'Mesmin', '0670834048', 'mesmin@paraiso.com', '2012-10-22', 'Joueur de basket', 'Recherche club de foot et joueur de foot pour partie le dimanche', 13000, 1, 0),
(14, 'Jouet', 'Gabon', 'Gabon', 'dblezo', 'nueri', 'soijqd', '0689890989', 'ndskds@dsds.fr', '2012-10-23', 'sdqsdsqdqs', 'dqsjkdnskjfdsnfdsjklcv,ndf jkvndf', 1000, 1, 0),
(15, 'Jouet', 'Gabon', 'Gabon', 'dblezo', 'nuerikjl', 'soijqd', '0689890989', 'ndskds@dsds.fr', '2012-10-23', 'sdqsdsqdqs', 'dqsjkdnskjfdsnfdsjklcv,ndf jkvndf', 1000, 1, 1),
(20, 'Sante', 'Afrique du Sud', 'Afrique du Sud', 'dblezo', 'fausther', 'Jamal', '0270834545', 'jamal@sfr.fr', '2012-10-24', 'Medecin sans frontière', 'Recherche medecin sans frontière pour mission humanitaire dans les rue de soweto ', 12050, 0, 1),
(21, 'Spectacles', 'Gabon', 'Gabon', 'admin', 'faust', 'faust', '056879888', 'faust@faust.fr', '2012-10-27', 'marionnettes', 'cxjbdhjvbnikjfd vdcddsjkdnvfdj djkcvndf', 120000, 0, 0),
(22, 'Spectacles', 'Gabon', 'Gabon', 'admin', 'faust', 'faust', '056879888', 'faust@faust.fr', '2012-10-27', 'marionnettes', 'cxjbdhjvbnikjfd vdcddsjkdnvfdj djkcvndf', 120000, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `Id_Categorie` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Categorie` varchar(30) NOT NULL,
  PRIMARY KEY (`Id_Categorie`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`Id_Categorie`, `Nom_Categorie`) VALUES
(1, 'Vehicules'),
(2, 'Emploi'),
(3, 'Immobilier'),
(4, 'Bazar'),
(5, 'Loisir');

-- --------------------------------------------------------

--
-- Structure de la table `categoriespec`
--

CREATE TABLE IF NOT EXISTS `categoriespec` (
  `Id_CategorieSpec` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Categorie` varchar(20) NOT NULL,
  `Intitule` varchar(40) NOT NULL,
  PRIMARY KEY (`Id_CategorieSpec`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Contenu de la table `categoriespec`
--

INSERT INTO `categoriespec` (`Id_CategorieSpec`, `Nom_Categorie`, `Intitule`) VALUES
(1, 'Vehicules', 'Achat'),
(2, 'Vehicules', 'Location'),
(3, 'Vehicules', 'Pieces'),
(4, 'Vehicules', 'Reparations'),
(5, 'Emploi', 'Informatiques'),
(6, 'Emploi', 'Petits boulots'),
(7, 'Emploi', 'Batiment'),
(8, 'Emploi', 'Autres'),
(9, 'Emploi', 'Commerce'),
(10, 'Emploi', 'Sante'),
(11, 'Immobilier', 'Achat'),
(12, 'Immobilier', 'Location'),
(13, 'Immobilier', 'Terrain'),
(14, 'Immobilier', 'Agences'),
(15, 'Bazar', 'Jouet'),
(16, 'Bazar', 'Vetements'),
(17, 'Bazar', 'Electronique'),
(18, 'Bazar', 'Multimedia'),
(19, 'Loisir', 'Concerts'),
(20, 'Loisir', 'Spectacles'),
(21, 'Loisir', 'Sport'),
(22, 'Loisir', 'Rencontres'),
(23, 'Immobilier', 'Vente');

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

CREATE TABLE IF NOT EXISTS `membres` (
  `Id_Membre` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Pays` varchar(20) NOT NULL,
  `Nom_Ville` varchar(30) NOT NULL,
  `Nom` varchar(20) NOT NULL,
  `Prenom` varchar(20) NOT NULL,
  `Pseudo` varchar(20) NOT NULL,
  `Birth` date NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Tel` varchar(20) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Type` enum('pro','part') NOT NULL,
  `Autorisation` enum('admin','user') NOT NULL,
  PRIMARY KEY (`Id_Membre`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `membres`
--

INSERT INTO `membres` (`Id_Membre`, `Nom_Pays`, `Nom_Ville`, `Nom`, `Prenom`, `Pseudo`, `Birth`, `Email`, `Tel`, `Password`, `Type`, `Autorisation`) VALUES
(1, 'Gabon', 'Libreville', 'FAUSTHER', 'ulrich', 'dblezo', '1991-08-12', 'ulrich@fausther.fr', '06241722', 'pwd', 'pro', 'user'),
(2, 'Gabon', 'Libreville', 'Bombero', 'John', 'admin', '1952-12-16', 'admin@nerd.com', '06241722', 'admin', 'pro', 'admin'),
(3, 'Benin', 'Cotonou', 'Bombera', 'Aicha', 'abombera', '1954-04-25', 'abombera@nerd.com', '', 'pwdAbombera', 'part', 'user'),
(4, 'Comores', 'Moroni', 'saids', 'Jowel', 'jowel', '1989-10-29', 'j974@nafer.fr', '', 'pwdJowel', 'part', 'user'),
(5, 'Cameroun', 'Yaounde', 'Colombo', 'hyp', 'hyp', '1989-12-12', 'hyp@gwada.fr', '0678854545', 'pwdHyp', 'part', 'user'),
(6, 'Congo', 'Brazza', 'Paraiso', 'Mesmin', 'mesmin', '1967-12-09', 'mesmin@paraiso.fr', '', 'pwdMesmin', 'part', 'user'),
(8, 'Cameroun', 'Douala', 'Dupuy', 'Mathieu', 'xnl', '1980-10-09', 'mathieu@esiea.fr', '', 'toto', 'part', 'user'),
(9, 'Angola', 'Luanda', 'Balungidi', 'Marvin', 'marvin', '1990-10-24', 'marvin@esiea.fr', '', 'pwdMarvin', 'part', 'user'),
(10, 'Gabon', 'Gabon', 'Fausther', 'Jamal', 'jamal241', '1991-08-12', 'jamal@faust.fr', '01700556', 'pwdjamal', 'pro', 'user'),
(11, 'Burundi', 'Burundi', 'paraiso', 'mesmin', 'paraiso', '1999-12-12', 'mesmin@paraiso.fr', '0670834048', 'mesmin', 'part', 'user');

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE IF NOT EXISTS `pays` (
  `Id_Pays` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Pays` varchar(30) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `Devise` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`Id_Pays`),
  UNIQUE KEY `nom_pays` (`Nom_Pays`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=55 ;

--
-- Contenu de la table `pays`
--

INSERT INTO `pays` (`Id_Pays`, `Nom_Pays`, `Devise`) VALUES
(1, 'Afrique du Sud', 'Rand'),
(2, 'Algerie', 'Dinar'),
(3, 'Angola', 'Kwanza'),
(4, 'Benin', 'Franc CFA'),
(5, 'Botswana', 'Pula'),
(6, 'Burkina Faso', 'Franc CFA'),
(7, 'Burundi', 'Franc Burundais'),
(8, 'Cameroun', 'Franc CFA'),
(9, 'Cap Vert', 'Escudo'),
(10, 'Republique centrafricaine', 'Francs'),
(11, 'Comores', 'Franc Comorien'),
(12, 'Congo', 'Franc CFA'),
(13, 'RDC', 'Franc Congolais'),
(14, 'Cote d''Ivoire', 'Franc CFA'),
(15, 'Djibouti', 'Franc Djiboutien'),
(16, 'Egypte', 'Livre Egyptienne'),
(17, 'Erythree', 'Nakfa'),
(18, 'Ethiopie', 'Birr'),
(20, 'Gabon', 'Franc CFA'),
(21, 'Gambie', 'Dalasi'),
(22, 'Ghana', 'Cédi'),
(23, 'Guinee', 'Franc Guinéen'),
(24, 'Guinnee-Bissau', 'Franc CFA'),
(25, 'Guinee Equatorial', 'Franc CFA'),
(26, 'Kenya', 'Shilling Kenyan'),
(27, 'Lesotho', 'Loti'),
(28, 'Liberia', 'Dollar Liberien'),
(29, 'Lybie', 'Dinar Libyen'),
(30, 'Madagascar', 'Ariary'),
(31, 'Malawi', 'Kwacha'),
(32, 'Mali', 'Franc CFA'),
(33, 'Maroc', 'Dirham'),
(34, 'Maurice', 'Roupie'),
(35, 'Mauritanie', 'Ouguiya'),
(36, 'Mozambique', 'Métical'),
(37, 'Namibie', 'Dollar Namibien'),
(38, 'Niger', 'Franc CFA'),
(39, 'Nigeria', 'Naira'),
(40, 'Ouganda', 'Shilling'),
(41, 'Rwanda', 'Franc'),
(42, 'Sao Tome', 'Dobra'),
(43, 'Senegal', 'Franc CFA'),
(44, 'Seychelles', 'Roupie'),
(45, 'Sierra Leone', 'Leone'),
(46, 'Somalie', 'Shilling'),
(47, 'Soudan', 'Dinar'),
(48, 'Swaziland', 'Lilangeni'),
(49, 'Tanzanie', 'Shilling'),
(50, 'Tchad', 'Franc CFA'),
(51, 'Togo', 'Franc CFA'),
(52, 'Tunisie', 'Dinar'),
(53, 'Zambie', 'Kwacha'),
(54, 'Zimbabwe', 'Dollar');

-- --------------------------------------------------------

--
-- Structure de la table `villes`
--

CREATE TABLE IF NOT EXISTS `villes` (
  `Id_Ville` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Ville` varchar(24) NOT NULL,
  `Nom_Pays` varchar(24) NOT NULL,
  PRIMARY KEY (`Id_Ville`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `villes`
--

INSERT INTO `villes` (`Id_Ville`, `Nom_Ville`, `Nom_Pays`) VALUES
(1, 'Libreville', 'Gabon'),
(2, 'Port-Gentil', 'Gabon');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
