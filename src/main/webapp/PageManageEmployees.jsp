<%-- 
    Document   : PageManageEmployees
    Created on : 1/12/2023, 8:49:54 p. m.
    Author     : Santiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/Header.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container p-4">
            <div class="row">
                <div class="col-md-4">
                        <div class="alert alert-<?= $_SESSION['message_type'] ?> alert-dismissible fade show" role="alert">
                            <strong><?= $_SESSION['message'] ?></strong> 
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    <div class="card card-body">
                        <form action="save.php" method="POST">
                            <div class="form-group">
                                <label for=""></label>
                                <input type="text" name="numemp" class="form-control"
                                placeholder="Numero de empleado" autofocus>
                            </div>
                            <div class="form-group">
                                <label for=""></label>
                                <input type="text" name="lastname" class="form-control"
                                placeholder="Nombre" autofocus>
                            </div>
                            <div class="form-group">
                                <label for=""></label>
                                <input type="text" name="firstname" class="form-control"
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
                                <input type="text" name="codeoffice" class="form-control"
                                placeholder="Codigo de oficina(1-7)" autofocus>
                            </div>
                            <div class="form-group">
                                <label for=""></label>
                                <input type="text" name="jobtitle" class="form-control"
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
                            <?php
                                $query = "SELECT * FROM employees";
                                $result = mysqli_query($con, $query);

                                while($row = mysqli_fetch_array($result)){ ?>
                                    <tr>
                                        <td><?php echo $row['employeeNumber'] ?></td>
                                        <td><?php echo $row['lastName'] ?></td>
                                        <td><?php echo $row['firstName'] ?></td>
                                        <td><?php echo $row['extension'] ?></td>
                                        <td><?php echo $row['email'] ?></td>
                                        <td><?php echo $row['officeCode'] ?></td>
                                        <td><?php echo $row['jobTitle'] ?></td>
                                        <td>
                                            <a href="edit.php?employeeNumber=<?php echo $row['employeeNumber'] ?>">
                                                Editar
                                            </a>
                                            <a href="delete.php?employeeNumber=<?php echo $row['employeeNumber'] ?>">
                                                Eliminar
                                            </a>
                                        </td>
                                    </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
