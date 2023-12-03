<%-- 
    Document   : PageEditEmployees
    Created on : 1/12/2023, 8:50:49 p. m.
    Author     : Santiago
--%>
<%@page import="edu.unicauca.apiweb.crudservlets.persistence.entities.Employees"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="edu.unicauca.apiweb.crudservlets.persistence.jpa.EmployeesJpaController"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<jsp:include page="/Header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String employeeNumber = request.getParameter("employeeNumber");
    
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("edu.unicauca.apiweb_CrudServlets_war_1.0PU");
    EmployeesJpaController employeeControl = new EmployeesJpaController(emf);
    Employees employee = employeeControl.findEmployees(Integer.parseInt(employeeNumber));

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container p-4">
            <div class="row">
                <div class="cold-md-4 mx-auto">
                    <h3>Editar Empleado</h3>
                    <div class="card card-body">

                        <form action="ServletEditEmployees" method = "POST">
                            <input type="hidden" name="employeeNumber" value="<%= employeeNumber %>">
                            <div class="form-group">
                                <input class="form-control" type="text" name="firstName" value="<%= employee.getFirstName() %>">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="text" name="lastName" value="<%= employee.getLastName() %>">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="text" name="extension" value="<%= employee.getExtension() %>">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="text" name="email" value="<%= employee.getEmail() %>">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="text" name="officeCode" value="<%= employee.getOfficeCode().getOfficeCode() %>">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="text" name="jobTitle" value="<%= employee.getJobTitle() %>">
                            </div>
                            <button class="btn btn-success" name="edit">Editar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<jsp:include page="/Footer.jsp" />