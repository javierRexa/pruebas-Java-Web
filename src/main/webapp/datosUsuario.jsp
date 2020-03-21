
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Usuario</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals(0)) {
                response.sendRedirect("login.jsp");
            }
            Connection con = null;
            Statement st = null;
        %>
        <div class="container mt-5"> 
            <div class="row">
                <div class="col-sm">
                    <form action="datosUsuario.jsp" method="post">
                        <div class="form-group">
                            <label>Nombre usuario</label>
                            <input type="text" class="form-control" id="nombreUser" value="<%= sesion.getAttribute("user")%>" name="nombreUser" placeholder="Nombre" required="required">
                        </div>
                        <div class="form-group">
                            <label>Contraseña</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Contraseña" required="required">
                        </div>
                        <div class="form-group">
                            <label>Repite contraseña</label>
                            <input type="password" class="form-control" id="password2" name="password2" placeholder="Contraseña" required="required">
                        </div>
                        <a href="index.jsp" class="btn btn-danger">Cancelar<i class="fa fa-ban" aria-hidden="true"></i></a>
                        <button type="submit" name="guardar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                    </form>
                </div>
            </div>
            <%
                if (request.getParameter("guardar") != null) {
                    String user = request.getParameter("nombreUser");
                    String pwd1 = request.getParameter("password");
                    String pwd2 = request.getParameter("password2");
                    if (pwd1.equals(pwd2)) {
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=root");
                            st = con.createStatement();
                            st.executeUpdate("update user set user='" + user + "',password='" + pwd1 + "'where id='" + sesion.getAttribute("id") + "';");
                            sesion.setAttribute("user", user);
                            response.sendRedirect("index.jsp");
                        } catch (Exception e) {
                            out.print(e);
                        }
                    }else{
                        out.print("Contraseña equivocada");
                    }
                }
            %>
        </div>            
    </body>
</html>
