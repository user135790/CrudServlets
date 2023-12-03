/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package edu.unicauca.apiweb.crudservlets.control;

import edu.unicauca.apiweb.crudservlets.persistence.entities.Employees;
import edu.unicauca.apiweb.crudservlets.persistence.entities.Offices;
import edu.unicauca.apiweb.crudservlets.persistence.jpa.EmployeesJpaController;
import edu.unicauca.apiweb.crudservlets.persistence.jpa.OfficesJpaController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Santiago
 */
public class ServletEmployees extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private final static String PU = "edu.unicauca.apiweb_CrudServlets_war_1.0PU";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletEmloyees</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletEmloyees at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        RequestDispatcher rd = request.getRequestDispatcher("PageManageEmployees.jsp");
        rd.forward(request, response);
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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory(PU);;
        EmployeesJpaController employeeControl = new EmployeesJpaController(emf);
        OfficesJpaController officeControl = new OfficesJpaController(emf);
        
        int employeeNumber = Integer.parseInt(req.getParameter("employeeNumber"));
        String lastName = req.getParameter("lastName");
        String firstName = req.getParameter("firstName");
        String extension = req.getParameter("extension");
        String email = req.getParameter("email");
        int officeCode = Integer.parseInt(req.getParameter("officeCode"));

        String jobTitle = req.getParameter("jobTitle");
        Offices office = officeControl.findOffices(String.valueOf(officeCode));
        
        Employees createEmployee = new Employees(employeeNumber, lastName, 
                firstName, extension, email, jobTitle);
        
        createEmployee.setOfficeCode(office);
        
        try {
            employeeControl.create(createEmployee);
            resp.sendRedirect("PageManageEmployees.jsp");
        } catch (Exception ex) {
            Logger.getLogger(ServletEmployees.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

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
