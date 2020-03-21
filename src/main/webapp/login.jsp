<%-- 
    Document   : login
    Created on : 21 mar. 2020, 18:16:40
    Author     : Usuario
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Login</title>
    </head>
    <body>

        <!--Formulario-->
        <div class="container mt-5"> 
            <div class="row">
                <div class="col-sm">
                    <form action="login.jsp" method="post">
                        <div class="form-group">
                            <label>Usuario</label>
                            <input type="text" class="form-control" name="user" placeholder="Usuario">
                        </div>
                        <div class="form-group">
                            <label>Contraseña</label>
                            <input type="password" class="form-control" name="password" placeholder="Contraseña">
                        </div>
                        <button type="submit" name="login" class="btn btn-primary">Login</button>
                    </form>
                </div>
            </div>
            <%
                Connection con = null;
                Statement st = null;
                ResultSet rs = null;
                if (request.getParameter("login") != null) {
                    String user = request.getParameter("user");
                    String pwd = request.getParameter("password");
                    HttpSession sesion = request.getSession();

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=root");
                        st = con.createStatement();
                        rs = st.executeQuery("Select * from user where user='" + user + "' and password='" + pwd + "';");
                        while (rs.next()) {
                            sesion.setAttribute("logueado", 1);
                            sesion.setAttribute("user", user);
                            sesion.setAttribute("id", rs.getString(1));
                            response.sendRedirect("index.jsp");
                        }

                        out.print("<div class=\"alert alert-danger\" role=\"alert\">Usuario o contraseña equivocado</div>");

                    } catch (Exception e) {
                        out.print("error mysql " + e);
                    }

                }
            %>
        </div>



    </body>
</html>
