/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.Connect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author Pc
 */
public class UserDao {
    
    public static User checkLogin(String email,String password)throws Exception{
        Connection con = null;
        PreparedStatement prdSt = null;
        ResultSet res = null;
        String sql ="SELECT * FROM Users WHERE email=? AND password=?";
        User user = null;
        try{
            con = Connect.dbConnect("postgres");
            prdSt = con.prepareStatement(sql);
            prdSt.setString(1,email);
            prdSt.setString(2,password);
            res = prdSt.executeQuery();
            while(res.next()){
                user = new User(res.getString("idUsers"),res.getString("nom"),res.getString("prenom"),res.getString("email"),res.getString("status"));
            }
        }catch(SQLException e){
           throw e; 
        }finally{
           if(res != null) res.close();
           if (prdSt != null) prdSt.close();
           if (con != null) con.close();
        }
        return user;
    }
    
}
