<%-- 
    Document   : PageLogin
    Created on : 1/12/2023, 8:48:50 p. m.
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
        <div class="container-lg text-center" style="display: flex; justify-content: center">
            <div class="container-lg text-center" style="margin: 0 auto">
                <br>
                <h2>Iniciar Sesion</h2>
                <i>
                    <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="200" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                        <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
                    </svg>
                </i>
                
                <form action="verificar_usuario.php" method="POST">
                    <div class="mb-3">
                        <label for="username" class="form-label" style="font-size: 1.5em;">Username:</label><br>
                        <input type="text" class="form-control" style="font-size: 1.5em;" id="titulo" name="username" required><br>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label" style="font-size: 1.5em;">Password:</label><br>
                        <input type="password" class="form-control" style="font-size: 1.5em;" id="titulo" name="password" required><br>
                    </div>
                    
                    <button class="btn btn-primary" name="bt_verificar_login" type="submit" >
                        Entrar
                    </button>
                </form>
            </div>
        </div>
        
    </body>
</html>
