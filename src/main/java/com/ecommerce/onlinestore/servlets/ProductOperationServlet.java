
package com.ecommerce.onlinestore.servlets;

import com.ecommerce.onlinestore.dao.CategoryDao;
import com.ecommerce.onlinestore.dao.ProductDao;
import com.ecommerce.onlinestore.entities.Category;
import com.ecommerce.onlinestore.entities.Product;
import com.ecommerce.onlinestore.helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String op = request.getParameter("operation");
            
        if(op.trim().equals("addcategory")){
             String title = request.getParameter("title");
             String description = request.getParameter("description");
             
             Category category = new Category();
             category.setCategoryTitle(title);
             category.setCategoryDescription(description);
             
             CategoryDao categorydao = new CategoryDao(FactoryProvider.getFactory());
             int catId = categorydao.saveCategory(category);
             
             HttpSession httpsession = request.getSession();
             httpsession.setAttribute("message", "<b>Catergory Added Sucessfully !!</b> ");
             response.sendRedirect("admin.jsp");
             return;
             
        } else if(op.trim().equals("addproduct")){
             String pName = request.getParameter("pName");
             String pDesc = request.getParameter("pDesc");
             int pPrice = Integer.parseInt(request.getParameter("pPrice"));
             int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
             int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
             int catId = Integer.parseInt(request.getParameter("catId"));
             
             Part part = request.getPart("pPic");

             
            Product p = new Product();
            p.setpName(pName);
            p.setpDesc(pDesc);
            p.setpPrice(pPrice);
            p.setpQuantity(pQuantity);
            p.setpDiscount(pDiscount);
            p.setpPhoto(part.getSubmittedFileName());
            
            
             CategoryDao categorydao = new CategoryDao(FactoryProvider.getFactory());
             Category cat = categorydao.getCategoryById(catId);
         
             p.setCategory(cat);
  
             
             ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
             pdao.saveProduct(p);

            //pic upload --- find out the path to upload photo
            String path = request.getRealPath("img")+File.separator + "products"+File.separator + part.getSubmittedFileName() ;
            System.out.println(path);

            try{
            ////uploading code
            FileOutputStream fos = new FileOutputStream(path);
            
           InputStream is = part.getInputStream();
           
            //reading data
            
          byte[] data = new byte[(int) is.available()];
          
          is.read(data);
          
//          writing the data
            fos.write(data);
            fos.close();
            }catch(Exception e){
                e.printStackTrace();
            }
            
            
            HttpSession httpsession = request.getSession();
             httpsession.setAttribute("message", "<b>Product Added Sucessfully !!</b> ");
             response.sendRedirect("admin.jsp");
             return;
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
