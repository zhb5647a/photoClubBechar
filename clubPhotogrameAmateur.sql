CREATE DATABASE clubPhotographeAmateur;
USE clubPhotographeAmateur;

CREATE TABLE region(
   Id_region INT auto_increment,
   name_region VARCHAR(50),
   PRIMARY KEY(Id_region)
);

CREATE TABLE droit(
   Id_droit INT auto_increment,
   name_droit VARCHAR(50),
   PRIMARY KEY(Id_droit)
);

CREATE TABLE category(
   Id_cat INT auto_increment,
   name_cat VARCHAR(50),
   PRIMARY KEY(Id_cat)
);

CREATE TABLE utilisateurs(
   Id_util INT auto_increment,
   name_util VARCHAR(50),
   firstname_util VARCHAR(50),
   mail_util VARCHAR(50) NOT NULL,
   password_util VARCHAR(50) NOT NULL,
   Id_droit INT,
   PRIMARY KEY(Id_util),
   FOREIGN KEY(Id_droit) REFERENCES droit(Id_droit)
);

CREATE TABLE photo(
   Id_photo INT auto_increment,
   name_photo VARCHAR(50),
   type_photo VARCHAR(250),
   createdAt DATETIME NOT NULL,
   updateAt DATETIME,
   url_photo VARCHAR(250),
   Id_region INT,
   PRIMARY KEY(Id_photo),
   FOREIGN KEY(Id_region) REFERENCES region(Id_region)
);

CREATE TABLE event(
   Id_event INT auto_increment,
   name_event VARCHAR(50),
   desc_event VARCHAR(250),
   createdAt_event DATETIME NOT NULL,
   updateAt DATETIME,
   Id_cat INT,
   Id_util INT,
   PRIMARY KEY(Id_event),
   FOREIGN KEY(Id_cat) REFERENCES category(Id_cat),
   FOREIGN KEY(Id_util) REFERENCES utilisateurs(Id_util)
);

CREATE TABLE commentaire(
   Id_com INT,
   contenu_com VARCHAR(250),
   createdAt_com DATETIME,
   Id_photo INT,
   Id_util INT,
   PRIMARY KEY(Id_com),
   FOREIGN KEY(Id_photo) REFERENCES photo(Id_photo),
   FOREIGN KEY(Id_util) REFERENCES utilisateurs(Id_util)
);

-- Ajout des droits
INSERT INTO droit(name_droit) VALUES 
("Admin"),
("Membre"),
("Utilisateur");


