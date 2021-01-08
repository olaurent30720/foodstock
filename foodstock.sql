-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 08 jan. 2021 à 14:41
-- Version du serveur :  8.0.22-0ubuntu0.20.04.3
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `foodstock`
--

-- --------------------------------------------------------

--
-- Structure de la table `aliment`
--

CREATE TABLE `aliment` (
  `id-aliment` int NOT NULL,
  `nom` varchar(100) NOT NULL,
  `quantite` int NOT NULL,
  `date` date NOT NULL,
  `prix` int NOT NULL,
  `id-categorie` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `aliment`
--

INSERT INTO `aliment` (`id-aliment`, `nom`, `quantite`, `date`, `prix`, `id-categorie`) VALUES
(1, 'jambon', 3, '2021-01-08', 3, 1),
(2, 'carottes', 1, '2020-12-08', 2, 4),
(3, 'cerises', 1, '2021-01-06', 5, 4),
(4, 'farine', 4, '2020-12-06', 2, 5),
(5, 'yaourt', 10, '2020-12-24', 3, 2),
(6, 'beurre', 2, '2021-01-12', 1, 3),
(7, 'confiture', 3, '2020-11-03', 4, 6),
(8, 'coca', 3, '2021-01-11', 2, 7),
(9, 'jambom1', 1, '2021-01-07', 3, 1),
(10, 'mangues', 3, '2021-01-08', 8, 4);

-- --------------------------------------------------------

--
-- Structure de la table `asso-saison-aliment`
--

CREATE TABLE `asso-saison-aliment` (
  `id-asso` int NOT NULL,
  `id-aliment` int NOT NULL,
  `id-saison` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `asso-saison-aliment`
--

INSERT INTO `asso-saison-aliment` (`id-asso`, `id-aliment`, `id-saison`) VALUES
(1, 6, 1),
(2, 6, 2),
(3, 6, 3),
(4, 6, 4),
(5, 2, 4),
(6, 3, 2),
(7, 8, 1),
(8, 8, 2),
(9, 8, 3),
(10, 8, 4),
(11, 7, 1),
(12, 7, 2),
(13, 1, 1),
(14, 1, 2),
(15, 1, 3),
(16, 1, 4),
(17, 4, 1),
(18, 4, 2),
(19, 4, 3),
(20, 4, 4),
(21, 5, 1),
(22, 5, 2),
(23, 5, 3),
(24, 5, 4),
(25, 10, 2);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id-categorie` int NOT NULL,
  `nom-cat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id-categorie`, `nom-cat`) VALUES
(1, 'viandes-poissons-oeufs'),
(2, 'produits laitiers'),
(3, 'matières grasses'),
(4, 'légumes et fruits'),
(5, 'céréales-legumineuses'),
(6, 'produits sucrés'),
(7, 'boissons');

-- --------------------------------------------------------

--
-- Structure de la table `saison`
--

CREATE TABLE `saison` (
  `id-saison` int NOT NULL,
  `non-saison` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `saison`
--

INSERT INTO `saison` (`id-saison`, `non-saison`) VALUES
(1, 'printemps'),
(2, 'été'),
(3, 'automne'),
(4, 'hiver');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `aliment`
--
ALTER TABLE `aliment`
  ADD PRIMARY KEY (`id-aliment`),
  ADD KEY `id-categorie` (`id-categorie`);

--
-- Index pour la table `asso-saison-aliment`
--
ALTER TABLE `asso-saison-aliment`
  ADD PRIMARY KEY (`id-asso`),
  ADD KEY `asso-saison-aliment_ibfk_1` (`id-aliment`),
  ADD KEY `id-saison` (`id-saison`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id-categorie`);

--
-- Index pour la table `saison`
--
ALTER TABLE `saison`
  ADD PRIMARY KEY (`id-saison`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `aliment`
--
ALTER TABLE `aliment`
  MODIFY `id-aliment` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `asso-saison-aliment`
--
ALTER TABLE `asso-saison-aliment`
  MODIFY `id-asso` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id-categorie` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `saison`
--
ALTER TABLE `saison`
  MODIFY `id-saison` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `aliment`
--
ALTER TABLE `aliment`
  ADD CONSTRAINT `aliment_ibfk_1` FOREIGN KEY (`id-categorie`) REFERENCES `categorie` (`id-categorie`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `asso-saison-aliment`
--
ALTER TABLE `asso-saison-aliment`
  ADD CONSTRAINT `asso-saison-aliment_ibfk_1` FOREIGN KEY (`id-aliment`) REFERENCES `aliment` (`id-aliment`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `asso-saison-aliment_ibfk_2` FOREIGN KEY (`id-saison`) REFERENCES `saison` (`id-saison`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
