/*use clinicavet*/
-- Estrutura da tabela `animals`
--
CREATE TABLE `animals` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `escape_attempts` int(11) DEFAULT NULL,
  `neutered` bit(1) DEFAULT NULL,
  `weight_kg` decimal(10,0) DEFAULT NULL,
  `species_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
--
-- Estrutura da tabela `owners`
--
CREATE TABLE `owners` (
  `ID` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
--
-- Estrutura da tabela `specializations`
--
CREATE TABLE `specializations` (
  `vets_id` int(11) NOT NULL,
  `species_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
--
-- Estrutura da tabela `species`
--
CREATE TABLE `species` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
--
-- Estrutura da tabela `vets`
--
CREATE TABLE `vets` (
  `ID` int(11) NOT NULL,
  `name` varchar(300) DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
--
-- Estrutura da tabela `visits`
--
CREATE TABLE `visits` (
  `vets_id` int(11) NOT NULL,
  `animals_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

Indexes for table `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_species` (`species_id`),
  ADD KEY `fk_owners` (`owner_id`);
--
-- Indexes for table `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`ID`);
--
-- Indexes for table `specializations`
--
ALTER TABLE `specializations`
  ADD KEY `vets_id` (`vets_id`),
  ADD KEY `species_id` (`species_id`);
--
-- Indexes for table `species`
--
ALTER TABLE `species`
  ADD PRIMARY KEY (`ID`);
--
-- Indexes for table `vets`
--
ALTER TABLE `vets`
  ADD PRIMARY KEY (`ID`);
--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD KEY `animals_id_asc` (`animals_id`),
  ADD KEY `vet_id_asc` (`vets_id`);
--
-- AUTO_INCREMENT for table `animals`
--
ALTER TABLE `animals`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `owners`
--
ALTER TABLE `owners`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `species`
--
ALTER TABLE `species`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vets`
--
ALTER TABLE `vets`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
  
-- Limitadores para a tabela `animals`
--
ALTER TABLE `animals`
  ADD CONSTRAINT `fk_owners` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`ID`),
  ADD CONSTRAINT `fk_species` FOREIGN KEY (`species_id`) REFERENCES `species` (`ID`);
--
-- Limitadores para a tabela `specializations`
--
ALTER TABLE `specializations`
  ADD CONSTRAINT `specializations_ibfk_1` FOREIGN KEY (`vets_id`) REFERENCES `vets` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `specializations_ibfk_2` FOREIGN KEY (`species_id`) REFERENCES `species` (`ID`) ON UPDATE CASCADE;
--
-- Limitadores para a tabela `visits`
--
ALTER TABLE `visits`
  ADD CONSTRAINT `visits_ibfk_1` FOREIGN KEY (`vets_id`) REFERENCES `vets` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `visits_ibfk_2` FOREIGN KEY (`animals_id`) REFERENCES `animals` (`ID`) ON UPDATE CASCADE;
COMMIT;

Extraindo dados da tabela `animals`

INSERT INTO `animals` (`ID`, `name`, `escape_attempts`, `neutered`, `weight_kg`, `species_id`, `owner_id`) VALUES
(1, 'Agumon', 0, b'1', '10', 2, 1),
(2, 'Gabumon', 2, b'1', '8', 2, 2),
(3, 'Pikachu', 1, b'0', '15', 1, 2),
(4, 'Devimon', 5, b'1', '11', 2, 3),
(5, 'Charmander', 0, b'0', '11', 1, 4),
(6, 'Plantmon', 2, b'1', '6', 2, 3),
(7, 'Squirtle', 3, b'0', '12', 1, 4),
(8, 'Angemon', 1, b'1', '45', 2, 5),
(9, 'Boarmon', 7, b'1', '20', 2, 5),
(10, 'Blossom', 3, b'1', '17', 1, 4);
--
-- Extraindo dados da tabela `owners`
--
INSERT INTO `owners` (`ID`, `full_name`, `age`) VALUES
(1, 'Sam Smith', 34),
(2, 'Jennifer Orwell', 19),
(3, 'Bob', 45),
(4, 'Melody Pond', 77),
(5, 'Dean Winchester', 14),
(6, 'Jodie Whittaker', 38);
--
-- Extraindo dados da tabela `specializations`
--
INSERT INTO `specializations` (`vets_id`, `species_id`) VALUES
(1, 1),
(3, 1),
(3, 2),
(4, 2),
(1, 1),
(3, 1),
(3, 2),
(4, 2);
--
-- Extraindo dados da tabela `species`
--
INSERT INTO `species` (`ID`, `name`) VALUES
(1, 'Pokemon'),
(2, 'Digimon');
--
-- Extraindo dados da tabela `vets`
--
INSERT INTO `vets` (`ID`, `name`, `age`) VALUES
(1, 'William Tatcher', 45),
(2, 'Maisy Smith', 26),
(3, 'Stephanie Mendez', 64),
(4, 'Jack Harkness', 38),
(5, 'William Tatcher', 45),
(6, 'Maisy Smith', 26),
(7, 'Stephanie Mendez', 64),
(8, 'Jack Harkness', 38);
--
-- Extraindo dados da tabela `visits`
--
INSERT INTO `visits` (`vets_id`, `animals_id`) VALUES
(1, 1),
(3, 1),
(4, 2),
(3, 2),
(3, 2),
(3, 2),
(3, 4),
(4, 5),
(2, 6),
(1, 6),
(2, 6),
(3, 7),
(4, 8),
(4, 8),
(1, 1),
(3, 1),
(4, 2),
(3, 2),
(3, 2),
(3, 2),
(3, 4),
(4, 5),
(2, 6),
(1, 6),
(2, 6),
(3, 7),
(4, 8),
(4, 8),
(2, 9),
(2, 9),
(2, 9),
(2, 9),
(3, 10),
(1, 10);
COMMIT;
