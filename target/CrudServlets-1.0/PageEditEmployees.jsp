<%-- 
    Document   : PageEditEmployees
    Created on : 1/12/2023, 8:50:49 p. m.
    Author     : Santiago
--%>
<jsp:include page="/Header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

                        <form action="edit.php?id=<?php echo $_GET['employeeNumber']; ?>" method = "POST">
                            <div class="form-group">
                                <input class="form-control" type="text" name="nombre" value="<?php echo $nombre; ?>">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="text" name="apellido" value="<?php echo $apellido; ?>">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="text" name="extension" value="<?php echo $extension; ?>">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="text" name="email" value="<?php echo $email; ?>">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="text" name="codeoffice" value="<?php echo $officecode; ?>">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="text" name="jobtitle" value="<?php echo $jobtitle; ?>">
                            </div>
                            <button class="btn btn-success" name="edit">Editar</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<jsp:include page="/Footer.jsp" />