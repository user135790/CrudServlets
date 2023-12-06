<%-- 
    Document   : PageManageEmployees
    Created on : 1/12/2023, 8:49:54 p. m.
    Author     : Santiago
--%>

<%@page import="java.util.List"%>
<%@page import="edu.unicauca.apiweb.crudservlets.persistence.entities.Employees"%>
<%@page import="edu.unicauca.apiweb.crudservlets.persistence.jpa.EmployeesJpaController"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/Header.jsp" />

<%
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("edu.unicauca.apiweb_CrudServlets_war_1.0PU");
    EmployeesJpaController employeeControl = new EmployeesJpaController(emf);
    String messageType = "";
    String message = "";
    
    List<Employees> employees = employeeControl.findEmployeesEntities();
   
    if(request.getCookies() != null){
        for(int i = 0; i < request.getCookies().length; i++){
            String cookieName = request.getCookies()[i].getName();
            if(cookieName.equals("message")){
                 message = request.getCookies()[i].getValue();
            }
            if(cookieName.equals("message_type")){
                messageType = request.getCookies()[i].getValue();
            }
        }
    }

%>
<!DOCTYPE html>
<html>
    <body>
        <div class="container p-4">
            <div class="row">
                <div class="col-md-4">
                    
                    <% if(request.getCookies() != null) {%>
                        <div class="alert alert-<%= messageType %> alert-dismissible fade show" role="alert">
                            <strong><%= message %></strong> 
                        </div>
                    <% } %>
                    <div class="card card-body">
                        <form action="ServletEmployees" method="POST">
                            <div class="form-group">
                                <label for=""></label>
                                <input type="text" name="employeeNumber" class="form-control"
                                placeholder="Numero de empleado" autofocus>
                            </div>
                            <div class="form-group">
                                <label for=""></label>
                                <input type="text" name="firstName" class="form-control"
                                placeholder="Nombre" autofocus>
                            </div>
                            <div class="form-group">
                                <label for=""></label>
                                <input type="text" name="lastName" class="form-control"
                                placeholder="Apellido" autofocus>
                            </div>
                            <div class="form-group">
                                <label for=""></label>
                                <input type="text" name="extension" class="form-control"
                                placeholder="Extencion" autofocus>
                            </div>
                            <div class="form-group">
                                <label for=""></label>
                                <input type="text" name="email" class="form-control"
                                placeholder="Email" autofocus>
                            </div>
                            <div class="form-group">
                                <label for=""></label>
                                <input type="text" name="officeCode" class="form-control"
                                placeholder="Codigo de oficina(1-7)" autofocus>
                            </div>
                            <div class="form-group">
                                <label for=""></label>
                                <input type="text" name="jobTitle" class="form-control"
                                placeholder="Tipo de trabajo" autofocus>
                            </div>
                            <div class="form-group">
                                <label for=""></label>
                                <input type="submit" class="btn btn-success btn-block form-control"
                                name="save_empleado" value="Guardar Empleado">
                            </div> 
                        </form>
                    </div>
                </div>
                <div class="col-md-8">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Extension</th>
                                <th>Email</th>
                                <th>Codigo Oficina</th>
                                <th>Trabajo</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Employees emp :employees){
                            %>
                                    <tr>
                                        <td><%= emp.getEmployeeNumber() %></td>
                                        <td><%= emp.getLastName() %></td>
                                        <td><%= emp.getFirstName() %></td>
                                        <td><%= emp.getExtension() %></td>
                                        <td><%= emp.getEmail() %></td>
                                        <td><%= emp.getOfficeCode().getOfficeCode() %></td>
                                        <td><%= emp.getJobTitle() %></td>
                                        <td>
                                            <a href="PageEditEmployees.jsp?employeeNumber=<%= emp.getEmployeeNumber() %>">
                                                Editar
                                            </a>
                                            <a href="ServletDeleteEmployees?employeeNumber=<%= emp.getEmployeeNumber() %>">
                                                Eliminar
                                            </a>
                                        </td>
                                    </tr>
                                    <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
