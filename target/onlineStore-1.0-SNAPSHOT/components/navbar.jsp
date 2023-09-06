<%@page import="java.util.List"%>
<%@page import="com.ecommerce.onlinestore.dao.CategoryDao"%>
<%@page import="com.ecommerce.onlinestore.helper.FactoryProvider"%>
<%@page import="com.ecommerce.onlinestore.entities.Category"%>
<%@page import="com.ecommerce.onlinestore.entities.user"%>
<%
 user user1 = (user)session.getAttribute("current-user");
    

%>


<%  CategoryDao dao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> list2 = dao.getCategories(); %>
  
            


<nav class="navbar navbar-expand-lg navbar-light  custom-bg">
    <div class="container">
  <a class="navbar-brand" >OnlineStore</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
             <%  for(Category category:list2){ %>
          <a class="dropdown-item" href="index.jsp?category=<%= category.getCategoryId() %>"><%= category.getCategoryTitle() %></a>
          
           <%  }   %>   
        </div>
      </li>
    </ul>
      
    
      
      <ul class="navbar-nav ml-auto">
          
          <li class="nav-item active">
              <a class="nav-link" href="#" data-toggle="modal" data-target="#cart"> <i class="fa fa-shopping-cart" style="font-size: 20px"></i><span class="cart-items" style="font-size: 15px; margin-left: 2px">(0)</span> </a>


      </li>
            <% 
            if(user1 == null){ %>
            
              <li class="nav-item active">
        <a class="nav-link" href="login.jsp">Login</a>
      </li>
          <li class="nav-item active">
        <a class="nav-link" href="register.jsp">Register </a>
      </li>
      
       <%  }  else{ %>
       
            <li class="nav-item active">
                <a class="nav-link" href="<%= user1.getUserType().equals("admin")?"admin.jsp":"normal.jsp" %>" > <%= user1.getUserName() %></a>
      </li>
          <li class="nav-item active">
        <a class="nav-link" href="LogoutServlet">Logout </a>
      </li>
       <%   }
      %>
        
          
      </ul>
   
  </div>
  
    </div>
</nav>
