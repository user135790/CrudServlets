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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Santiago
 */
public class ServletEmployees extends HttpServlet {

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
        response.sendRedirect("index.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param req servlet request
     * @param resp servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        //Crear cookies para despliegue de alert
        Cookie cookieMessage;
        Cookie cookieMessageType;
        
        //Crear entity manager para gestionar tablas Empleados y Oficinas
        EntityManagerFactory emf = Persistence.createEntityManagerFactory(PU);;
        EmployeesJpaController employeeControl = new EmployeesJpaController(emf);
        OfficesJpaController officeControl = new OfficesJpaController(emf);
        
        //Obtener los datos del formulario
        int employeeNumber = Integer.parseInt(req.getParameter("employeeNumber"));
        String lastName = req.getParameter("lastName");
        String firstName = req.getParameter("firstName");
        String extension = req.getParameter("extension");
        String email = req.getParameter("email");
        String jobTitle = req.getParameter("jobTitle");
        
        //Obtener el objeto oficina correspondiente del 
        //identificador de oficina especificado
        int officeCode = Integer.parseInt(req.getParameter("officeCode"));
        Offices office = officeControl.findOffices(String.valueOf(officeCode));
        
        //Crear nuevo objeto empleado para guardarlo
        Employees createEmployee = new Employees(employeeNumber, lastName, 
                firstName, extension, email, jobTitle);
        
        //Crear la oficina en que se encuentra el empleado
        createEmployee.setOfficeCode(office);

        try {
            employeeControl.create(createEmployee);
            
            //Modificar cookies con los valores correspondientes
            cookieMessage = new Cookie("message", "EmpleadoGuardado");
            cookieMessageType = new Cookie("message_type", "success");
            
            //Enviar cookies a la peticion
            resp.addCookie(cookieMessage);
            resp.addCookie(cookieMessageType);
            
            resp.sendRedirect("index.jsp");
        } catch (Exception ex) {
            Logger.getLogger(ServletEmployees.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
