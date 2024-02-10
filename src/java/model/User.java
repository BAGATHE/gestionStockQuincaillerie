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
public class User {
private String idUsers; 
private String nom ;
private String prenom; 
private String email ;
private String password;
private String status;

    public String getIdUsers() {
        return idUsers;
    }

    public void setIdUsers(String idUsers) {
        this.idUsers = idUsers;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public User(String idUsers, String nom, String prenom, String email, String status) {
        this.idUsers = idUsers;
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.status = status;
    }

    public User(String idUsers, String nom, String prenom, String email, String password, String status) {
        this.idUsers = idUsers;
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.password = password;
        this.status = status;
    }
    

}
