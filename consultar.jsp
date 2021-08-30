<%-- 
    Document   : consultar.jsp
    Created on : 29/04/2021, 10:10:59 AM
    Author     : demon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*"%>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style> 
            h2{
                text-align: center;
                font-family: Roboto;
                color: aqua;
            }
            td{
                text-align: center;
                font-family: Roboto;
                font-size: 16px;
            }
        </style>
    </head>
    <body>
        <h1>Consulta de citas</h1>
        <br>
        <div class="containerTable">
            <table border="2" width="920" height="80" borderColor="#AAEE00">
                <thead>
                    <tr>
                        <td bfcolor="cyan" width="290" headers="19" >ID</td>
                        <td bfcolor="cyan" width="290" headers="19" >Nss</td>
                        <td bfcolor="cyan" width="290" headers="19" >Nombre</td>
                        <td bfcolor="cyan" width="230" headers="19" >Paterno</td>
                        <td bfcolor="cyan" width="230" headers="19" >Materno</td>
                        <td bfcolor="cyan" width="230" headers="19" >Direccion</td>
                        <td bfcolor="cyan" width="230" headers="19" >Correo</td>
                         <td bfcolor="cyan" width="230" headers="19" >Fecha y Hora</td>
                    </tr>
                </thead>
                <tbody>
            
                    <%
                    
                    String Driver = "com.mysql.jdbc.Driver";
                    
                    Class.forName(Driver).newInstance();
                    
                    Connection con = null;
                    Statement set = null;
                    ResultSet rs = null;
                    
                    try{
                        String url = "jdbc:mysql://localhost/usuarios";
                        //String bd = "usuarios";
                        String userName = "root";
                        String password = "12345";
                        
                        con = DriverManager.getConnection(url, userName, password);
                        set = con.createStatement();
                        
                        String q = "select * from registrocita order by nom_usu ASC";
                        
                        rs = set.executeQuery(q);
                        
                        while(rs.next()){
                            
                         %>
                         <tr>
                             <td bfcolor="cyan" width="290" headers="19"  > <%=rs.getInt(1)%> </td>
                             <td bfcolor="cyan" width="290" headers="19"  > <%=rs.getString(2)%> </td>
                             <td bfcolor="cyan" width="290" headers="19"  > <%=rs.getString(3)%> </td>
                             <td bfcolor="cyan" width="290" headers="19"  > <%=rs.getString(4)%> </td>
                             <td bfcolor="cyan" width="290" headers="19"  > <%=rs.getString(5)%> </td>
                             <td bfcolor="cyan" width="290" headers="19"  > <%=rs.getString(6)%> </td>
                             <td bfcolor="cyan" width="290" headers="19"  > <%=rs.getString(7)%> </td>
                               <td bfcolor="cyan" width="290" headers="19"  > <%=rs.getString(9)%> </td>
                             <td bfcolor="cyan" width="290" headers="19" > <a href="borrar.jsp?id=<%=rs.getInt("id_usu")%>" >Borrar Registro</a> </td>
                         </tr>
                
                
                
                
                       
                         <%
                        }
                        rs.close();
                        set.close();
                        con.close();

                %>
                </tbody>  
                <%
                    
                    }catch(Exception e){
                        System.out.println("Error al consultar la tabla");
                        System.out.println(e.getMessage());
                        System.out.println(e.getStackTrace());

                        %>
                        
                        <h1>Error el recurso no esta disponible</h1>
                        <img>Sitio en construccion
                        <%
                    
                    }
                    
                    
                    %>
                    
                
            </table>
        </div>
    </body>
</html>
