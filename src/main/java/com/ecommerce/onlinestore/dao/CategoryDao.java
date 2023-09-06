
package com.ecommerce.onlinestore.dao;

import com.ecommerce.onlinestore.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class CategoryDao {
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public int saveCategory(Category cat){
        
        Session s = this.factory.openSession();
        Transaction tx = s.beginTransaction();
        
       int catId = (int) s.save(cat);
        
        tx.commit();
        s.close();
               
        return catId;
    }
    
    public List<Category> getCategories(){
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Category");
        query.list();
        List<Category> list = query.list();
        return list;
    }
    
    public Category getCategoryById(int cId){
        Category cat = null;
        try{
            Session s = this.factory.openSession();
           cat =   s.get(Category.class, cId);
            
            s.close();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return cat;
    } 
}
