<%@page import="com.ecommerce.onlinestore.entities.user"%>
<%
    
    user user = (user)session.getAttribute("current-user");
    
    if(user == null){
    session.setAttribute("message", "<b>You Are Not Logged In !! Login First </b>");
    response.sendRedirect("login.jsp");
    return;
    }
    else if(user.getUserType().equals("admin")){
    
    session.setAttribute("message", "<b>You Are Not Admin !! Don't Aceess This Page</b>");
    response.sendRedirect("login.jsp");
       return;
    }

 %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USER LOGIN</title>
        <%@include file = "components/common_css_js.jsp" %>  
    </head>
    <body>
          <%@include file="components/navbar.jsp" %>
        <h1>Hello World!</h1>
    </body>
</html>
