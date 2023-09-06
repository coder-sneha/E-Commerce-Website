
package com.ecommerce.onlinestore.helper;

import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;


public class helper {
    public static String get10Words(String desc){
        
        String[] strs = desc.split(" ");
        
        if(strs.length >10){
            String res="";
            for(int i=0; i<10; i++){
                res += strs[i] +" "; 
            }
            
            return (res +"...");
        }else{
            return (desc+"...");
        }
    }
    
    public static Map<String,Long> getCount(SessionFactory factory){
        Session s = factory.openSession();
        
        String q1 = "select count(*) from user";
        String q2 = "select count(*) from Product";
        
       Query query1 = s.createQuery(q1);
       Query query2 = s.createQuery(q2);
       
       Long userCount = (long)query1.list().get(0);
       Long productCount = (long)query2.list().get(0);
       
       Map<String,Long> map = new HashMap<>();
       map.put("userCount", userCount);
       map.put("productCount", productCount);
        
        s.close();
        
        return map;
    }
}
