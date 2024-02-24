/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Pc
 * Created: 2 févr. 2024
 */
psql -U postgres
postgresl2

CREATE USER quincaillerie WITH PASSWORD 'quincaillerie';
CREATE DATABASE quincaillerie;
GRANT ALL PRIVILEGES ON DATABASE quicaillerie to quincaillerie;

/*TABLE Utilisateur*/
CREATE TABLE Users(
idUsers VARCHAR(20) PRIMARY KEY,
nom VARCHAR(20) NOT NULL,
prenom VARCHAR(20) NOT NULL,
email VARCHAR(20)  NOT NULL,
password VARCHAR(20) NOT NULL,
status VARCHAR(20) NOT NULL);


/*TABLE CATEGGORIE*/
CREATE TABLE CategorieArticle (
  idCategorie VARCHAR(20) PRIMARY KEY,
  nomCategorie VARCHAR(50) NOT NULL);


/*TABLE Fournisseur*/
CREATE TABLE Fournisseur (
  idFournisseur VARCHAR(20) PRIMARY KEY,
  nomFournisseur VARCHAR(50) NOT NULL,
  contact VARCHAR(20) NOT NULL);

/*TABLE MouvementFournisseur*/
CREATE TABLE MouvementFournisseur(
  idMouvementFourniseur VARCHAR(50) PRIMARY KEY,
  idFournisseur VARCHAR(20) NOT NULL,
  FOREIGN KEY (idFournisseur) REFERENCES Fournisseur(idFournisseur));

/*TABLE ARTICLE*/
CREATE TABLE Article (
  idArticle VARCHAR(40) PRIMARY KEY,
  designation VARCHAR(50) NOT NULL,
  prixFournisseur REAL,
  prixVente REAL
  idCategorie VARCHAR(20) REFERENCES Categorie(idCategorie),
  FOREIGN KEY (idCategorie) REFERENCES Categorie(idCategorie)
);


/*TABLE COMMANDE*/
CREATE TABLE Commande(
idCommande VARCHAR(50) PRIMARY KEY,
idArticle VARCHAR(20),
quantiter INT,
dateCommande DATE,
FOREIGN KEY (idArticle) REFERENCES Article(idArticle)
);

/*mouvement*/

/*TABLE STOCK*/
CREATE TABLE Stock(
idStock VARCHAR(20) PRIMARY KEY,
idArticle VARCHAR(30),
typeOperation VARCHAR(30),  
dateStock DATE,
FOREIGN KEY (idArticle) REFERENCES Article(idArticle));
/*type operation => entrée sortie*/





