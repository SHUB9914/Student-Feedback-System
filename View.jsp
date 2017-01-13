<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <link rel="stylesheet" href="common.css">
  <style>
   body
  {
  background-color:#330000;
  
  
  }
  h1
  {
  color:white;
  
  }
  </style>
  </head>
    
  <body>
   <%
   if(((session.getAttribute("name"))!=null))
     	{
   try
   {
    
              Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback","root",null);
                    

            String tid = (String)session.getAttribute("name"); 
            String tname=""; 
            
            
            
   out.println(tid);
   PreparedStatement  st=con.prepareStatement("select * from teacher_info where tid=? " );
   PreparedStatement  st1=con.prepareStatement("select Faculty_name,sub_name,B_NAME,year,avg(avg1),avg(avg2),count(rno) from theory group by(Faculty_name) having Faculty_name=? ");
   PreparedStatement  st2=con.prepareStatement(" select fname,sub_name,branch,year,avg(fd1),count(rno),sec from practical group by fname,sec having fname=? ");
   
  st.setString(1,tid);
 ResultSet rs = st.executeQuery();
   			
            
              while(rs.next())
              {
              	tname=rs.getString(1);
              	
              
              }
              
              st1.setString(1,tname);
              st2.setString(1,tname);
              ResultSet rs1 = st1.executeQuery();
               ResultSet rs2 = st2.executeQuery();
              
    %>     
    <h1><center>Theory Feedback</center></h1>     
              
 <table border=2 style="width:100%;"><tr><th>Teachers</th><th>subject</th><th>Branch</th><th>year</th><th>feedback1</th><th>feedback2</th><th>Total student</th><th>student gave feedback </th><th>EXIST</th></tr>
 <%  while(rs1.next()) {  %>
           
       
              
<tr>

<td> <%= rs1.getString(1) %> </td> 
<td> <%= rs1.getString(2) %> </td>
<td> <%= rs1.getString(3) %> </td>
<td> <%= rs1.getString(4)  %> </td>
<td> <%= rs1.getString(5) %> </td>
<td> <%= rs1.getString(6) %> </td>
<td> <%= 50 %> </td>
<td> <%= rs1.getString(7) %> </td>

 
<td style="text-align:center" ><img id="img" src="bimg/right.jpg" height="30px" width="35px"> </td>

 </tr>
 
<% 
} %>

</table>
</br>
</br>    

<h1><center>Practical Feedback</center></h1>
 <table border=2 style="width:100%;"><tr><th>Teachers</th><th>subject</th><th>Branch</th><th>year</th><th>feedback1</th><th>feedback2</th><th>Total student</th><th>student gave feedback </th><th>EXIST</th></tr>          
              
   <%     
   
    
 while(rs2.next()) { 


%> 
<tr>
<td> <%= rs2.getString(1) %> </td>
<td> <%= rs2.getString(3) %>
<td> <%= rs2.getString(2) %>
<td> <%= rs2.getString(4) %> </td>
<td> <%= rs2.getString(7) %> </td>
<td> <%= rs2.getString(5) %> </td>
<td> <%= 50 %> </td>
<td> <%= rs2.getString(6) %> </td>
<td style="text-align:center" ><img id="img" src="bimg/right.jpg" height="30px" width="35px"> </td>
</tr>

<% 
} %>
   
 </table>  
   
 <%  
             
              
 
  }
            
  catch(Exception ex)
  {
  ex.printStackTrace();
  out.println(ex.getMessage());
  }
  }
             else
				{
				response.sendRedirect("Login.jsp");

				}
  %> 
            
            
      </body>    
</html>

