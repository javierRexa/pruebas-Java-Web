/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servelets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Driver;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Usuario
 */
@WebServlet(name = "Empleados", urlPatterns = {"/Empleados"})
public class Empleados extends HttpServlet {

    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

        }
    }

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
        PrintWriter out = response.getWriter();
        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=root");
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM empleados;");
            while (rs.next()) {

                out.print("<tr>"
                        + "<th scope=\"row\">" + rs.getString(1) + "</th>"
                        + "<td>" + rs.getString(2) + "</td>"
                        + "<td>" + rs.getString(3) + "</td>"
                        + "<td>" + rs.getString(4) + "</td>"
                        + "<td>"
                        + "  <a href=\"editar.jsp?id=" + rs.getString(1) + "&nombre=" + rs.getString(2) + "&direccion=" + rs.getString(3) + "&telefono=" + rs.getString(4) + "\"><i class=\"fa fa-pencil\" aria-hidden=\"true\"></i></a>"
                        + "  <a href=\"borrar.jsp?id=" + rs.getString(1) + "\" class=\"ml-1\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></a>"
                        + "</td>"
                        + "</tr>"
                );

            }
        } catch (Exception e) {
            out.print("error mysql " + e);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=root");
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM empleados;");
            while (rs.next()) {

                out.print("<tr>"
                        + "<th scope=\"row\">" + rs.getString(1) + "</th>"
                        + "<td>" + rs.getString(2) + "</td>"
                        + "<td>" + rs.getString(3) + "</td>"
                        + "<td>" + rs.getString(4) + "</td>"
                        + "<td>"
                        + "  <a href=\"editar.jsp?id=" + rs.getString(1) + "&nombre=" + rs.getString(2) + "&direccion=" + rs.getString(3) + "&telefono=" + rs.getString(4) + "\"><i class=\"fa fa-pencil\" aria-hidden=\"true\"></i></a>"
                        + "  <a href=\"borrar.jsp?id=" + rs.getString(1) + "\" class=\"ml-1\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></a>"
                        + "</td>"
                        + "</tr>"
                );

            }
        } catch (Exception e) {
            out.print("error mysql " + e);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
