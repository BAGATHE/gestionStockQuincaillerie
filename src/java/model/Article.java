/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Pc
 */
public class Article {
    private String idArticle;
    private String designation;
    private double prixFournisseur;
    private double prixVente;
    private String idCategorie;
    private String idFournisseur;

  
    public Article(String designation, double prixFournisseur, double prixVente, String idCategorie, String idFournisseur) {
        this.designation = designation;
        this.prixFournisseur = prixFournisseur;
        this.prixVente = prixVente;
        this.idCategorie = idCategorie;
        this.idFournisseur = idFournisseur;
    }


    public Article(String idArticle, String designation, double prixFournisseur, double prixVente, String idCategorie, String idFournisseur) {
        this.idArticle = idArticle;
        this.designation = designation;
        this.prixFournisseur = prixFournisseur;
        this.prixVente = prixVente;
        this.idCategorie = idCategorie;
        this.idFournisseur = idFournisseur;
    }

    // Getters and Setters
    public String getIdArticle() {
        return idArticle;
    }

    public void setIdArticle(String idArticle) {
        this.idArticle = idArticle;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public double getPrixFournisseur() {
        return prixFournisseur;
    }

    public void setPrixFournisseur(double prixFournisseur) {
        this.prixFournisseur = prixFournisseur;
    }

    public double getPrixVente() {
        return prixVente;
    }

    public void setPrixVente(double prixVente) {
        this.prixVente = prixVente;
    }

    public String getIdCategorie() {
        return idCategorie;
    }

    public void setIdCategorie(String idCategorie) {
        this.idCategorie = idCategorie;
    }

    public String getIdFournisseur() {
        return idFournisseur;
    }

    public void setIdFournisseur(String idFournisseur) {
        this.idFournisseur = idFournisseur;
    }
}
