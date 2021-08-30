 <%-- 
    Document   : guardar
    Created on : 28/04/2021, 07:16:47 AM
    Author     : demon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,java.util.*,java.text.*"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <div class="container">
            <nav class="nav-container"> Menu Principal </nav>
            <p>Hola a todos</p>
<% 
   //conexion con mysql
   Connection con = null;
   
   String url = "jdbc:mysql://localhost/usuarios";
   //String bd = "usuarios";
   String userName = "root";
   String password = "12345";
   //String driver = ;
   
    try{
        
        Class.forName("com.mysql.jdbc.Driver");
        //establezco conexion
        
        con = DriverManager.getConnection(url, userName, password);
        
        try{
            
            Statement set = con.createStatement();
            
            //obtenemos los parametros del formulario
            String nss = request.getParameter("nss");
            String nombre = request.getParameter("nombre");
            String paterno = request.getParameter("a_paterno");
            String materno = request.getParameter("a_materno");
            String direccion = request.getParameter("direccion");
            String correo = request.getParameter("correo");
            String clave = request.getParameter("clave");
            
            String q = "insert into registrocita(nss_usu, nom_usu, paterno_usu, materno_usu, direccion_usu, correo_usu, clave_usu) "
                    + "values('"+nss+"', '"+nombre+"', '"+paterno+"', '"+materno+"', '"+direccion+"', '"+correo+"', '"+clave+"')";
            //para ejecutar la sentencia necesito una variable
            
            int val = set.executeUpdate(q);
            //aqui deberia de poder visualizar que si dejo
            
%>

      
        
        <div>
            <h1>Registro Exitoso wiiii</h1>
            Aqui si se dejo conectarse
                                    <form method="get" action="menu.html">
                        <input type="submit" value="Regresar" />
        </div>
<% }catch(SQLException e){
            System.out.println("No conecto con bd");
            System.out.println(e.getMessage());
            System.out.println(e.getSQLState());

%>
        <div>
            <h1>Registro NO Exitoso Solo juguito contigo</h1>
            Aqui si no se dejo conectarse
        </div>
<%        }
    
        }catch(Exception ed){
            System.out.println("Error general");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
%>
        <div>
            <h1>Pagina en Construcción</h1>
            Aqui si no se dejo conectarse
        </div>

<%

        }
   
        
%>          
        </div>
        
        
    </body>
</html>
