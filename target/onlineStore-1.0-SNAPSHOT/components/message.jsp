<%
    String message = (String)session.getAttribute("message");
    if(message != null){
    
    out.println(message);
    
    session.removeAttribute("message");
    }
    
String message1 = (String)session.getAttribute("message1");
    if(message1 != null){
    
    out.println(message1);
    
    session.removeAttribute("message1");
    }
    
String message2 = (String)session.getAttribute("message2");
    if(message2 != null){
    
    out.println(message2);
    
    session.removeAttribute("message2");
    }
    
String message3 = (String)session.getAttribute("message3");
    if(message3 != null){
    
    out.println(message3);
    
    session.removeAttribute("message3");
    }
    
String message4 = (String)session.getAttribute("message4");
    if(message4 != null){
    
    out.println(message4);
    
    session.removeAttribute("message4");
    }
    
String message5 = (String)session.getAttribute("message5");
    if(message5 != null){
    
    out.println(message5);
    
    session.removeAttribute("message5");
    }
    
String message6 = (String)session.getAttribute("message6");
    if(message6 != null){
    
    out.println(message6);
    
    session.removeAttribute("message6");
    }
    

    
  
    


    %>
