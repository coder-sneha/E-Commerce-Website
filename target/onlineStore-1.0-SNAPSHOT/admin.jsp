
<%@page import="com.ecommerce.onlinestore.helper.helper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.onlinestore.entities.Category"%>
<%@page import="com.ecommerce.onlinestore.dao.CategoryDao"%>
<%@page import="com.ecommerce.onlinestore.helper.FactoryProvider"%>
<%@page import="com.ecommerce.onlinestore.entities.user"%>
<%
    
    user user = (user)session.getAttribute("current-user");
    
    if(user == null){
    session.setAttribute("message", "<b>You Are Not Logged In !! Login First </b>");
    response.sendRedirect("login.jsp");
    return;
    }
    else if(user.getUserType().equals("normal")){
    
    session.setAttribute("message", "<b>You Are Not Admin !! Don't Aceess This Page</b>");
    response.sendRedirect("login.jsp");
       return;
    }

 %>
 
 <!--for list fetching-->
 
  <% 
            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
             List<Category> list = cdao.getCategories();
             

             //getting count
             
        Map<String,Long> m = helper.getCount(FactoryProvider.getFactory());

   %>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN LOGIN</title>
        <%@include file = "components/common_css_js.jsp" %>  
        
        <style>
              body {
        background-image: url('img/admin1.jpg');
        background-repeat: no-repeat;
        background-size: 1370px 800px;
    }
        </style>
        
        <script src="script.js"></script>
    </head>
    <body>
          <%@include file="components/navbar.jsp" %>
          
          <div class="container admin">
              
              <div class="container-fluid">
                   <%@include file="components/message.jsp" %>
              </div>
              
              <div class="row mt-4 ml-5">
                  <div class="col-md-3 ml-5">
                      
                      <div class="card text-center" style="background-color: transparent;">
                          <div class="card-body">
                              
                              <div class="container">
                                  <img src="img/user.png" alt="user_icon">
                              </div>
                              
                              
                     <h3 style="color: white"> <%= m.get("userCount") %> </h3>
 
                              
                              <h1 style="color: chartreuse">Users</h1>
                          </div>
                      </div>
                      
                  </div>
                  
                  <!--second col-->
                  
                   <div class="col-md-3 ">
                       
                       <div class="card text-center" style="background-color: transparent;">
                          <div class="card-body">
                              
                              <div class="container">
                                  <img  src="img/category.png" alt="user_icon">
                              </div>
                              
                              
                              <h3 style="color: white"> <%= list.size() %> </h3>
                              <h1 style="color: chartreuse">Categories</h1>
                          </div>
                      </div>
                      
                  </div>
                  
                   <div class="col-md-3 ">
                       
                      <div class="card text-center" style="background-color: transparent;">
                          <div class="card-body">
                              
                              <div class="container">
                                  <img src="img/product.png" alt="user_icon">
                              </div>
                              
                              
                              <h3 style="color: white"> <%= m.get("productCount") %> </h3>
                              <h1  style="color: chartreuse">Products</h1>
                          </div>
                      </div>
                       
                  </div>           
              </div>
              
              <!--second row-->
              
              
              <div class="row mt-5 ml-5">
                  <div class="col-md-4 " style="margin-left: 6rem">
                      
                      <div class="card text-center" style="background-color: transparent;"  data-toggle="modal" data-target="#add-category">
                          <div class="card-body">
                              
                              <div class="container">
                                  <img src="img/add.png" alt="user_icon">
                              </div>

                              <h1 style="color: chartreuse">Add Category</h1>
                              
                          </div>
                      </div>
                      
                  </div>
                  
                   <div class="col-md-4">
                       
                      <div class="card text-center" style="background-color: transparent;" data-toggle="modal" data-target="#add-product">
                          <div class="card-body">
                              
                              <div class="container">
                                  <img src="img/add.png" alt="user_icon">
                              </div>
                
                              <h1 style="color: chartreuse">Add Products</h1>
                              
                          </div>
                          
                      </div>
                       
                  </div>           
              </div>
              
          </div>
          
          <!--add category modal-->
         
           
<!-- Modal -->
<div class="modal fade" id="add-category" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white  ">
          <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       
          <form action="ProductOperationServlet" method="post">
              
              <input type="hidden" name="operation" value="addcategory">
              
           
              
              <div class="form-group">
                  <input type="text" class="form-control" name="title" placeholder="Enter Category Title" required />
                  
              </div>
              
                <div class="form-group">
                  <textarea placeholder="Enter Category Description" name="description" style="width: 29rem; height: 5rem" required></textarea>
                  
              </div>
              
             
              
              <div class="container text-center">
        <button type="submit" class="btn btn-outline-success" >Add Category</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
              
          </form>
          
      </div>
    </div>
  </div>
</div>                 
          <!--end category modal-->
          
          <!--add product modal-->

          
<!-- Modal -->
<div class="modal fade" id="add-product" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white ">
        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          
          <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
              
              <input type="hidden" name="operation" value="addproduct">
              
           
              
              <div class="form-group">
                  <input type="text" class="form-control" name="pName" placeholder="Enter Product Title" required />
                  
              </div>
              
              
              <div class="form-group">
                 <input type="number" class="form-control" name="pPrice" placeholder="Enter Product Price" required />
                  
              </div>
              
              
              <div class="form-group">
                  <input type="number" class="form-control" name="pDiscount" placeholder="Enter Product Discount" required />
                  
              </div>
              
              
              <div class="form-group">
                  <input type="number" class="form-control" name="pQuantity" placeholder="Enter Product Quantity" required />
                  
              </div>
              
          
       <div class="form-group">
    <select name="catId" class="form-control">
        <% for(Category c : list) { %>
        <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
        <% } %>
    </select>
           </div>

                       
              <div class="form-group">
                  <input type="file" name="pPic" required />
              </div>
              
                <div class="form-group">
                  <textarea placeholder="Enter Product Description" name="pDesc" style="width: 29rem; height: 5rem" required></textarea>
                  
              </div>
   
          
           <div class="container text-center">
        <button type="submit" class="btn btn-outline-success" >Add Product</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
          
          </form>
      </div>      
    </div>
  </div>
</div>
          
          
          <!--end product modal-->
          
          
                   <%@include file ="components/cart_modal.jsp" %>

    </body>
</html>
   