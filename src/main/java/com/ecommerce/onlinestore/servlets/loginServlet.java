
package com.ecommerce.onlinestore.servlets;

import com.ecommerce.onlinestore.dao.UserDao;
import com.ecommerce.onlinestore.entities.user;
import com.ecommerce.onlinestore.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class loginServlet extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
            
           String email = request.getParameter("email");
           String password = request.getParameter("password");
          
           
           
           //validation
           
           //authentication user
          UserDao userdao = new UserDao(FactoryProvider.getFactory());
          user user = userdao.getUserByEmailAndPassword(email, password);
//            out.println(user);

            HttpSession httpSession = request.getSession();
            
            if(user==null){
                httpSession.setAttribute("message6","<b>Invalid Details !!  Try Again</b>");
            response.sendRedirect("login.jsp");
                  return;
            }else{
                
                httpSession.setAttribute("current-user", user);
                
                if(user.getUserType().equals("admin")){
                    response.sendRedirect("admin.jsp");
                }else  if(user.getUserType().equals("normal")){
                    response.sendRedirect("User.jsp");
                }else{
                    out.println("<b>We have not identified user type</b>");
                }
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
