<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Registration</title>
        
        <style>
              body {
        background-image: url('img/sign.jpg');
        background-repeat: no-repeat;
        background-size: 1370px 800px;
    }
        </style>
        
         <%@include file = "components/common_css_js.jsp" %>
    </head>
    <body>
         <%@include file="components/navbar.jsp" %>
         <div class="container-fluid">
         <div class="row ">
             <div class="col-md-4 offset-md-4" >
                 <%@include file="components/message.jsp" %>
                 <h2 class="text-center " ><u><b>SIGN UP</u></b></h2>
                 <form action="RegisterServlet" method="post">
                   <div class="form-group"  >
                     <label for="name"><b>Name</label>
                     <input name = "name"type="text" class="form-control" id="name" placeholder="Enter Name" >
                   </div>
                     
                   <div class="form-group" >
                     <label for="email"> <b>Email</b></label>
                     <input name = "email" type="email" class="form-control" id="email" placeholder="Enter Email" >
                   </div>
                     
                   <div class="form-group" >
                     <label for="password"><b>Password</b></label>
                     <input name = "password" type="password" class="form-control" id="password" placeholder="Enter Password" >
                   </div>
                     
                   <div class="form-group" >
                     <label for="phone"><b>Phone No.</b></label>
                     <input name = "phone" type="phone" class="form-control" id="phone" placeholder="Enter Phone Number" >
                   </div>
                     
                   <div class="form-group" >
                     <label for="address"><b>Address</b></label>
                     <textarea name = "address" class="form-control" id="address" placeholder="Enter Address" ></textarea>
                   </div>
                     
                     <b> If Already Register - <a href="login.jsp" style="color: red"> <U>CLICK HERE</U></a> </b>
                     
                     <div class="container text-center mt-1">
                         <button class="btn btn-outline-success" style="color: white; background: green;">Register</button>
                         <button  type="reset" class="btn btn-outline-warning " style="color: white; background: darkgoldenrod;">Reset</button>
                     </div>
                     
                     
                 </form>
             </div>
         </div>
             
         </div>
    </body>
</html>
