
import dao.FournisseurDao;
import dao.UserDao;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Pc
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            FournisseurDao.insertMouvement("Fournisseur_9");
            // TODO code application logic here
           
        } catch (Exception ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
