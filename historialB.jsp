<%-- 
    Document   : borrar
    Created on : 29/04/2021, 10:42:52 AM
    Author     : demon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ELIMINACION </title>
    </head>
    <body bgcolor="#F3F781">
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            
            String Driver = "com.mysql.jdbc.Driver";
                    
            Class.forName(Driver).newInstance();

            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            
            try{
                String url = "jdbc:mysql://localhost/usuarios";
                //String bd = "usuarios";
            String userName = "leox";
                String password = "12345";
                con = DriverManager.getConnection(url, userName, password);
                
                try{
                    set = con.createStatement();
                    String nombre = "";
                    
                    String q = "delete from registrohistorial where id_usu="+id;
                    
                    int borrar = set.executeUpdate(q);
                    
                    
                            
                    %>
                
        <h1>Registro Eliminado con Exito</h1>
        
        <%
            set.close();
            
                }catch(SQLException ed){
                    System.out.println("Registro no se pudo eliminadar");
                    System.out.println(ed.getMessage());
                    %>
         <h1>Registro No Eliminado Error en la tabla</h1>           
                    <%
                
                }
                
                con.close();
            
            }catch(Exception e){
                System.out.println("Error al conectar con tabla");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());

                %>
         <h1>Sitio en Construcción</h1>         
                <%
            
            }
            
        %>
        
        
        <br>
        <a href="consultar.jsp" >Regresar a la Consulta</a>
        <br>
        <a href="index.html" >Regresar al Menu Principal</a>
    </body>
</html>
