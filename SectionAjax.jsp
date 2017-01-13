<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <style>
   body
  {
  background-color:#330000;
  
  
  }
  h1
  {
  color:white;
  
  }
  table
  {
  width:60%;
  
  }
  table tr:nth-child(even)
  {
  
  
  
   background-color:#eee;
  
  }
  table tr:nth-child(odd)
  {
  
 
  
   background-color:#fff;
  
  }
  
  table ,th,td 
  {
  border-collapse:collapse;
  border:1px solid balck;
  padding:10px;
  
  }
  table th
  {
  background-color:black;
  color:white;
  
  
  }
  #img
  {
  margin-right:10px;
  
  }
 
   </style>
 
  </head>
    <body>
     <%  
     
     
    
   if(((session.getAttribute("name"))!=null))
     	{          
         
	try
             {
               int t=0;	
             //String year= request.getParameter("q");
             String year="3";
              Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback","root",null);
          

           PreparedStatement  st=con.prepareStatement("select count(rno),sec,avg(avg1),avg(avg2) from theory group by(sec)");
           PreparedStatement  st1=con.prepareStatement("select count(rno),sec,avg(fd1),avg(fd2) from practical group by(sec)");
           
           
              //st.setString(1,year);
              //st.setString(2,"B");
             // st1.setString(1,year);
              //st1.setString(2,"A");
              ResultSet rs = st.executeQuery();
              ResultSet rs1 = st1.executeQuery();
              /*while(rs.next())
              {
              out.println(rs.getString(1));
              out.println(rs.getString(2));
              out.println(rs.getString(3));
              out.println(rs.getString(4));
              }*/
             
                 
           
               %>
   <fieldset>
  <legend><h1>Theory:</h1></legend>           
	</br>	
<table border=2 style="width:100%;"><tr><th>Branch</th><th>Year</th><th>Section</th><th>Feedback</th><th>Students</th><th>gave feedback</th><th>EXIST</th></tr>
<% 
 while(rs.next()) { 

Float a=Float.parseFloat(rs.getString(3));
Float b=Float.parseFloat(rs.getString(4));
Float c=a+b;
%> 
<tr>
<td> <%= "MCA" %> </td> 
<td> <%= year %> </td>
<td> <%= rs.getString(2) %>
<td> <%= c %> </td>
<td> <%= 50 %> </td>
<td> <%= rs.getString(1) %> </td>
<td style="text-align:center" ><img id="img" src="bimg/right.jpg" height="30px" width="35px"> </td>
</tr>

<% 
} %>
</table>
</br>
</fieldset>

</br>
</br>
</br>

<fieldset>
  <legend><h1>Practical:</h1></legend>          
</br>		
<table border=2 style="width:100%;"><tr><th>Branch</th><th>Year</th><th>Section</th><th>Feedback</th><th>Students</th><th>gave feedback</th><th>EXIST</th></tr>

<% 
 while(rs1.next()) { 

//Float a=Float.parseFloat(rs1.getString(3));
//Float b=Float.parseFloat(rs1.getString(4));
//Float c=a+b;
%> 
<tr>
<td> <%= "MCA" %> </td> 
<td> <%= year %> </td>
<td> <%= rs1.getString(2) %>
<td> <%=rs1.getString(3) %> </td>
<td> <%= 50 %> </td>
<td> <%= rs1.getString(1) %> </td>
<td style="text-align:center" ><img id="img" src="bimg/right.jpg" height="30px" width="35px"> </td>
</tr>

<% 
} %>
</table>
</br>
</fieldset>


<%

}
     
             
             catch(Exception ex)
             {
             out.println(ex.getMessage());
             out.println("exception .....");
             }
              }
  else
	{
	response.sendRedirect("Login.jsp");
}
            
             
            
             
             %>
  
</body>
</head>

             


