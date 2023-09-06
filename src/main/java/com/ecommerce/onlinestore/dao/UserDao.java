
package com.ecommerce.onlinestore.dao;

import com.ecommerce.onlinestore.entities.user;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;


public class UserDao {
    private SessionFactory factory;
    
    public UserDao(SessionFactory factory){
        this.factory = factory;
    }
    
    public user getUserByEmailAndPassword(String email, String password){
        user user = null;
        
        try{
            String query = "from user where userEmail =:e and userPassword = : p";
            Session s = this.factory.openSession();
           Query q =  s.createQuery(query);
           q.setParameter("e", email);
           q.setParameter("p", password);
           
           user = (user)q.uniqueResult();
          
            
            s.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return user;
    }
    
}
