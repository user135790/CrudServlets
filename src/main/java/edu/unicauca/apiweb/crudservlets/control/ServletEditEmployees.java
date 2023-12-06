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
public class ServletEditEmployees extends HttpServlet {

    private final static String PU = "edu.unicauca.apiweb_CrudServlets_war_1.0PU";
    
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
        EntityManagerFactory emf = Persistence.createEntityManagerFactory(PU);
        EmployeesJpaController employeeControl = new EmployeesJpaController(emf);
        OfficesJpaController officeControl = new OfficesJpaController(emf);
        
        //Obtener los datos del formulario
        int employeeNumber = Integer.parseInt(req.getParameter("employeeNumber"));
        String lastName = req.getParameter("lastName");
        String firstName = req.getParameter("firstName");
        String extension = req.getParameter("extension");
        String email = req.getParameter("email");
        String jobTitle = req.getParameter("jobTitle");
        
        //Obtener el objeto oficina correspondiente al empleado editado
        int officeCode = Integer.parseInt(req.getParameter("officeCode"));
        Offices office = officeControl.findOffices(String.valueOf(officeCode));
        
        //Obtener empleado completo en base de datos y modificar la representacion de objeto
        Employees editEmployee = employeeControl.findEmployees(employeeNumber);
        editEmployee.setEmail(email);
        editEmployee.setExtension(extension);
        editEmployee.setFirstName(firstName);
        editEmployee.setJobTitle(jobTitle);
        editEmployee.setLastName(lastName);
        editEmployee.setOfficeCode(office);
        
        try {
            employeeControl.edit(editEmployee);
            
            //Modificar cookies con los valores correspondientes
            cookieMessage = new Cookie("message", "ExitoEditando");
            cookieMessageType = new Cookie("message_type", "info");
            cookieMessageType.setMaxAge(1);
            cookieMessage.setMaxAge(1);
            
            //Enviar cookies a la peticion
            resp.addCookie(cookieMessage);
            resp.addCookie(cookieMessageType);
            
            resp.sendRedirect("index.jsp");
        } catch (Exception ex) {
            Logger.getLogger(ServletEmployees.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }

}
