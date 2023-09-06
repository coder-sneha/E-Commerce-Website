

<%@page import="com.ecommerce.onlinestore.helper.helper"%>
<%@page import="com.ecommerce.onlinestore.entities.Category"%>
<%@page import="com.ecommerce.onlinestore.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.onlinestore.entities.Product"%>
<%@page import="com.ecommerce.onlinestore.dao.ProductDao"%>
<%@page import="com.ecommerce.onlinestore.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ONLINE STORE</title>
        
        <%@include file = "components/common_css_js.jsp" %>
        
           <script src="script.js"></script>
    
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
             
        <div class="row mt-3 mx-4">
            
            <% 
                       String cat = request.getParameter("category");
                         if (cat == null) {
                                 cat = "all";
                            }
                
                  
                    ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list=null;
                    
                            
                    if( cat.trim().equals("all")){
                     list = pdao.getAllProducts();
                }
                     else{
                           
                        int cid = Integer.parseInt(cat.trim());
                        list = pdao.getAllProductsById(cid);
                    }
                    
                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> list1 = cdao.getCategories();
                    
            %>
            
            
            <!--show category-->
            <div class="col-md-2">
                
                <div class="list-group mt-4">
                    
                     <a href="index.jsp?category=all" class="list-group-item list-group-item-action active" style="background: #C0CA33!important;"> ALL PRODUCTS </a>
                
                <%  for(Category category:list1){ %>
                
                
               <a href="index.jsp?category=<%= category.getCategoryId() %>" class="list-group-item list-group-item-action"><%= category.getCategoryTitle() %></a>
                        
                        
                  <%  }   %>   
                 

                 
                </div>
                
                
            </div>  
                  
          
            <!--show product-->
            <div class="col-md-10">
               
                <div class="row mt-4">
                    
                    <div class="col-md-12">
                        
                        <div class="card-columns" >
                        
     
    
                            <% for(Product product: list){  %>
                            
                            <div class="card">
                                
                                <div class="container text-center"> 
                                
                                <img src="img/products/<%= product.getpPhoto() %>" style="max-height: 250px; max-width: 250px; height:auto; width:auto;" class="card-img-top m-2" alt="...">
                            
                                </div>
                                
                                <div class="card-body">
                                 
                                    <h5 class="card-title"><%= product.getpName() %></h5>
                              
                                  <p class="card-text"><%= helper.get10Words(product.getpDesc()) %></p>
                             
                                   <div class="footer">
                                       <button  class="btn custom-bg text-white"  onclick="add_to_cart(<%= product.getpId() %>, '<%= product.getpName() %>', <%= product.getPriceAfterApplyingDiscount() %>);" > Add To Cart </button> 

                                         &#x20b9; <%= product.getPriceAfterApplyingDiscount() %>/-   <span class="text-secondary discount-label" style="font-size: 12px; font-style: italic; text-decoration: line-through " > &#x20b9;<%= product.getpPrice() %>   <%= product.getpDiscount() %>% off</span>  
                                  </div>
                                  
                                  
                                 </div>
                                              
                            </div>
                        
                            <%  }   
                  
                               if(list.size()==0){
                                    out.print("<h3> No Item In this Category </h3>");
                                  }
                            %>
                           
                      
                            
                        </div>
                        
                    </div>
                    
                </div>
                
            
                
            </div>
            
        </div>
        
                       
 <%@include file ="components/cart_modal.jsp" %>
 
 
    </body>
</html> 
