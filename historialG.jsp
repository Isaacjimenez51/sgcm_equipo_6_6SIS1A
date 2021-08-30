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
            String nombre = request.getParameter("nombre");
            String paterno = request.getParameter("a_paterno");
            String materno = request.getParameter("a_materno");
            String direccion = request.getParameter("direccion");
            String correo = request.getParameter("correo");
            String descripcion = request.getParameter("descripcion");
            
            String q = "insert into registrohistorial(nom_usu, paterno_usu, materno_usu, direccion_usu, correo_usu, descripcion_usu) "
                    + "values('"+nombre+"', '"+paterno+"', '"+materno+"', '"+direccion+"', '"+correo+"', '"+descripcion+"')";
            //para ejecutar la sentencia necesito una variable
            
            int val = set.executeUpdate(q);
            //aqui deberia de poder visualizar que si dejo
            
%>

      
        
        <div>
            <h1>Registro Exitoso wiiii</h1>
            Aqui si se dejo conectarse
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
