
package com.ecommerce.onlinestore.servlets;

import com.ecommerce.onlinestore.entities.user;
import com.ecommerce.onlinestore.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class RegisterServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          try{
              String userName = request.getParameter("name");
              String userEmail = request.getParameter("email");
              String userPassword = request.getParameter("password");
              String userPhone = request.getParameter("phone");
              String userAddress = request.getParameter("address");
              
               HttpSession httpSession = request.getSession();
               
              //validation
              if(userName.isEmpty()){
            httpSession.setAttribute("message1","<b>Please Enter Name !!</b>");
            response.sendRedirect("register.jsp");
                  return;
              }
              
              if(userEmail.isEmpty()){
            httpSession.setAttribute("message2","<b>Please Enter Email !!</b>");
            response.sendRedirect("register.jsp");
                  return;
              }
              
              if(userPassword.isEmpty()){
            httpSession.setAttribute("message3","<b>Please Enter Password !!</b>");
            response.sendRedirect("register.jsp");
                  return;
              }
              
              if(userPhone.isEmpty()){
            httpSession.setAttribute("message4","<b>Please Enter Phone !!</b>");
            response.sendRedirect("register.jsp");
                  return;
              }
              
              if(userAddress.isEmpty()){
            httpSession.setAttribute("message5","<b>Please Enter Address !!</b>");
            response.sendRedirect("register.jsp");
                  return;
              }
              
              //creating user object
            user user =  new user(userName, userEmail,userPassword, userPhone,"default.jpg", userAddress,"normal");
            
            Session s = FactoryProvider.getFactory().openSession();
            Transaction tx = s.beginTransaction();
            
            int userId = (int) s.save(user);
            
            
            tx.commit();
            s.close();
            
           
            httpSession.setAttribute("message","<b>Registration Successful !!</b>");
            response.sendRedirect("register.jsp");
            return;
              
          }catch(Exception e){
              e.printStackTrace();
          }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
