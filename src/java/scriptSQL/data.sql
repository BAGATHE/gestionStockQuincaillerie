/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Pc
 * Created: 2 févr. 2024
 */
/*TABLE FOURNISSEUR*/
insert into Fournisseur values(concat('Fournisseur_',nextval('seqFournisseur')),'ABC','020 22 499 00');


/*Table Users*/
insert into Users values(concat('User_',nextval('seqUsers')),'Angelo','Emadaly','lolemadaly@gmail.com','vvj91hp4','Admin');

/*TABLE CATEGORIEArticle*/
insert into CategorieArticle values(concat('CategorieArticle_',nextval('seqCategorieArticle')),'Outils a Main');


/*TABLE ARTICLE*/
insert into Article values (concat('Article_',nextval('seqArticle')),'Marteux',25000,35000,'CategorieArticle_1','Fournisseur_2');

/*TABLE COMMANDE */
insert into Commande values (concat('Commande_',nextval('seqCommande')),'Article_1',5,'2022-05-12');