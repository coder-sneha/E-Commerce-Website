<%
         user user = (user)session.getAttribute("current-user");
    
    if(user == null){
    session.setAttribute("message", "<b>You Are Not Logged In !! Login First to access checkout page </b>");
    response.sendRedirect("login.jsp");
    return;
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CheckOut Page</title>
        
                <%@include file = "components/common_css_js.jsp" %>
                
                <script src="script.js"></script>
              

    </head>
    <body>
                <%@include file="components/navbar.jsp" %>
                   
                <div class="container">
                    <div class="row mt-5">
                        
                        <div class="col-md-6">
                            
                            <div class="card">
                                <div class="card-body">
                                    <h3 class="text-center mb-5"><u>Items in your cart</u></h3>
                                    
                                    <div class="cart-body">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                              <div class="card">
                                <div class="card-body">
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        
        
         <%@include file ="components/cart_modal.jsp" %>

    </body>
</html>
