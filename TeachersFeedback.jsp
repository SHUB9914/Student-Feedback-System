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
  width:100%;
  
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
             String tname= request.getParameter("q");
              Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback","root",null);
          

           PreparedStatement  st=con.prepareStatement("select Faculty_name,sub_name,B_NAME,year,avg(avg1),avg(avg2),count(rno) from theory group by(Faculty_name)");
           PreparedStatement  st1=con.prepareStatement("select fname,sub_name,branch,year,avg(fd1),count(rno),sec from practical group by fname,sec");
           PreparedStatement  st2=con.prepareStatement("select lname,sub_name,branch,year,avg(fd2),count(rno),sec from practical group by lname,sec");
           
           
              //st.setString(1,tname);
              ResultSet rs = st.executeQuery();
              ResultSet rs1 = st1.executeQuery();
              ResultSet rs2 = st2.executeQuery();
             
                 
           
               %>
              
				<h1><center>Theory Feedback</center></h1>
               <table border=2 style="width:100%;"><tr><th>Teachers</th><th>subject</th><th>Branch</th><th>year</th><th>feedback1</th><th>feedback2</th><th>Total student</th><th>student gave feedback </th><th>EXIST</th></tr>
            <%  while(rs.next()) {  %>
           
       
              
<tr>

<td> <%= rs.getString(1) %> </td> 
<td> <%= rs.getString(2) %> </td>
<td> <%= rs.getString(3) %> </td>
<td> <%= rs.getString(4)  %> </td>
<td> <%= rs.getString(5) %> </td>
<td> <%= rs.getString(6) %> </td>
<td> <%= 50 %> </td>
<td> <%= rs.getString(7) %> </td>

 
<td style="text-align:center" ><img id="img" src="bimg/right.jpg" height="30px" width="35px"> </td>

 </tr>
 
<% 
} %>

</table>

<H1> <CENTER>   Practical FeedBack   </CENTER></H1>
 <table border=2 style="width:100%;"><tr><th>Teacher</th><th>Branch</th><th>Subject</th><th>Year</th><th>Section</th><th>Feedback</th><th>Students</th><th>gave feedback</th><th>EXIST</th></tr>
<% 
 while(rs1.next()) { 


%> 
<tr>
<td> <%= rs1.getString(1) %> </td>
<td> <%= rs1.getString(3) %>
<td> <%= rs1.getString(2) %>
<td> <%= rs1.getString(4) %> </td>
<td> <%= rs1.getString(7) %> </td>
<td> <%= rs1.getString(5) %> </td>
<td> <%= 50 %> </td>
<td> <%= rs1.getString(6) %> </td>
<td style="text-align:center" ><img id="img" src="bimg/right.jpg" height="30px" width="35px"> </td>
</tr>

<% 
} %>
</table>    

</br>
</br>

<table border=2 style="width:100%;"><tr><th>LabAssistent</th><th>Branch</th><th>Subject</th><th>Year</th><th>Section</th><th>Feedback</th><th>Students</th><th>gave feedback</th><th>EXIST</th></tr>
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
  out.println(ex.getMessage());
 }
  }
  else
	{
	response.sendRedirect("Login.jsp");
}
             
            
             
             %>
  
</body>
</head>

             


