/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Pc
 * Created: 2 févr. 2024
 */

v_stock_entree

v_stock_sortie

CREATE OR REPLACE VIEW FournisseurActif AS
SELECT p.idPoketra, p.nom , p.types , p.look , p.taille,p.prix,mp.idmpremiere
FROM InfoPoketra p
JOIN PoketraMP mp ON p.idPoketra = mp.idPoketra;