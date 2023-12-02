<%-- 
    Document   : PageQueries
    Created on : 1/12/2023, 8:48:26 p. m.
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
        <div class="container-lg">
            <br>
            <br>
                <h2 style="text-align: center" >
                Consultas
                </h2>
                <br>
                <br>
                <h2 style="text-align: center; color: #3380FF">
                    Las lineas de productos priorizadas por mayor cantidad de ventas en el mes actual
                </h2>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Linea de productos</th>
                            <th scope="col">Descripcion</th>
                            <th scope="col">Mes actual</th>
                            <th scope="col">Cantidad vendida</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row"><?php echo $i?></th>
                            <td><?php echo $fila['productLine'] ?></td>
                            <td><?php echo $fila['textDescription'] ?></td>
                            <td><?php echo $fila['MES'] ?></td>
                            <td><?php echo $fila['CANTIDAD'] ?></td>
                        </tr>
                    </tbody>
                </table>
                <br>
                <br>
                <h2 style="text-align: center; color: #3380FF;">Los paises que mas realizaron compras en el mes actual</h2>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Pais</th>
                            <th scope="col">Mes</th>
                            <th scope="col">Venta</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row"><?php echo $i?></th>
                            <td><?php echo $fila['country'] ?></td>
                            <td><?php echo $fila['MES'] ?></td>
                            <td><?php echo $fila['VENTA'] ?></td>
                        </tr>
                    </tbody>
                </table>
                <br>
                <br>
                <h2 style="text-align: center; color: #3380FF">
                    Top 5 empleados que tienen mas clientes asociados en ventas
                </h2>

                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nombre Empleado</th>
                            <th scope="col">Cantidad Clientes Asociados</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row"><?php echo $i?></th>
                            <td><?php echo $fila['firstName'] ?></td>
                            <td><?php echo $fila['CANTIDAD_DE_CLIENTES_ASOCIADOS'] ?></td>
                        </tr>
                    </tbody>
                </table>
                <br>
                <br>
                <div class="text-center">
                <button class="btn btn-primary">
                    <a href="./index.php" style="color:white">Acceder CRUD</a>
                </button>
            </div>
        </div>
        <br>
        <br>
    </body>
</html>
