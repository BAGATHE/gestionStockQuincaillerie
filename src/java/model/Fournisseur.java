package model;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Pc
 */
public class Fournisseur {
  private String idFournisseur;
  private String nomFournisseur;
  private String contact;

    public String getIdFournisseur() {
        return idFournisseur;
    }

    public void setIdFournisseur(String idFournisseur) {
        this.idFournisseur = idFournisseur;
    }

    public String getNomFournisseur() {
        return nomFournisseur;
    }

    public void setNomFournisseur(String nomFournisseur) {
        this.nomFournisseur = nomFournisseur;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public Fournisseur(String nomFournisseur, String contact) {
        this.nomFournisseur = nomFournisseur;
        this.contact = contact;
    }

    public Fournisseur(String idFournisseur, String nomFournisseur, String contact) {
        this.idFournisseur = idFournisseur;
        this.nomFournisseur = nomFournisseur;
        this.contact = contact;
    }
  
  

}
