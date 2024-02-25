
import dao.ArticleDao;
import dao.CategorieArticleDao;
import dao.FournisseurDao;
import dao.UserDao;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CategorieArticle;
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
              List<CategorieArticle> categories = CategorieArticleDao.findAllCategorie();
               List<List<Object>> articles = ArticleDao.findAllArticle();
              System.out.println(categories.size());
              System.out.println(articles.size());
        } catch (Exception ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
