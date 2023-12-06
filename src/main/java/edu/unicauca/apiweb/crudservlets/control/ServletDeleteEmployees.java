/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package edu.unicauca.apiweb.crudservlets.control;

import edu.unicauca.apiweb.crudservlets.persistence.jpa.EmployeesJpaController;
import edu.unicauca.apiweb.crudservlets.persistence.jpa.OfficesJpaController;
import edu.unicauca.apiweb.crudservlets.persistence.jpa.exceptions.NonexistentEntityException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Santiago
 */
public class ServletDeleteEmployees extends HttpServlet {

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
        
        //Crear Cookies
        Cookie cookieMessage;
        Cookie cookieMessageType;
        
        //Crear Entity manager para gestionar tabla Empleados
        EntityManagerFactory emf = Persistence.createEntityManagerFactory(PU);;
        EmployeesJpaController employeeControl = new EmployeesJpaController(emf);
        
        //Obtener numero de empleado a eliminar
        int employeeNumber = Integer.parseInt(request.getParameter("employeeNumber"));

        try {
            employeeControl.destroy(employeeNumber);
            
            //modificar cookies para alert
            cookieMessage = new Cookie("message", "EmpleadoEliminado");
            cookieMessageType = new Cookie("message_type", "danger");
            
            //añadir cookies a la peticion
            response.addCookie(cookieMessage);
            response.addCookie(cookieMessageType);
            
            response.sendRedirect("index.jsp");
            
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ServletDeleteEmployees.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
