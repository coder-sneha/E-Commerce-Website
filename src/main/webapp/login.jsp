

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGN IN</title>
         <style>
              body {
        background-image: url('img/signin.png');
        background-repeat: no-repeat;
        background-size: 1370px 800px;
    }
        </style>
        
          <%@include file = "components/common_css_js.jsp" %>  
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
         <div class="container-fluid">
         <div class="row mt-5">
             <div class="col-md-4 offset-md-4" >
                   <%@include file="components/message.jsp" %>
                 
               <h2 class="text-center " ><u><b>SIGN IN</u></b></h2>
               
               <form action="loginServlet" method="post">
                   <div class="form-group" >
                     <label for="email"> <b>Email</b></label>
                     <input name = "email" type="email" class="form-control" id="email" placeholder="Enter Email" >
                   </div>
                   
                   <div class="form-group" >
                     <label for="password"><b>Password</b></label>
                     <input name = "password" type="password" class="form-control" id="password" placeholder="Enter Password" >
                   </div>
                   
                   <b> If Not Register - <a href="register.jsp" style="color: red"> <U>CLICK HERE</U></a> </b>
                   
                     <div class="container text-center">
                         <button class="btn btn-outline-success mt-3" style="color: white; background: green; width: 7rem;">Sign In</button>
                         <button  type="reset" class="btn btn-outline-warning mt-3 ml-3" style="color: white; background: darkgoldenrod;  width: 7rem;">Reset</button>
                     </div>
                   
               </form>
                 
               
             </div>
         </div>
             
         </div>
       
    </body>
</html>
