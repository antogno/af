CREATE TABLE `automezzo` (
    `codice` int NOT NULL AUTO_INCREMENT,
    `codice_filiale` int NOT NULL,
    `targa` varchar(7) NOT NULL,
    `marca` varchar(50) NOT NULL,
    `modello` varchar(50) NOT NULL,
    PRIMARY KEY (`codice`),
    CONSTRAINT `fk_filialeautomezzo` FOREIGN KEY (`codice_filiale`)
    REFERENCES `filiale`(`codice`)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
