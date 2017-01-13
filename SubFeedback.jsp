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
             //String year= request.getParameter("q");
              Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback","root",null);
     PreparedStatement  st=con.prepareStatement("select sub_name,year,avg(avg1),avg(avg2),count(rno),sec from theory group by sub_name,sec order by year ");
      PreparedStatement  st1=con.prepareStatement("select sub_name,year,avg(fd1),avg(fd2),count(rno),sec from practical group by sub_name,sec order by year ");
          
         
             
            
              ResultSet rs = st.executeQuery();
              ResultSet rs1 = st1.executeQuery();
              
             
             
         %>
         
   <H1> <CENTER>   Theory FeedBack   </CENTER></H1>
 <table border=2 style="width:100%;"><tr><th>Branch</th><th>Subject</th><th>Year</th><th>Section</th><th>Feedback</th><th>Students</th><th>gave feedback</th><th>EXIST</th></tr>
<% 
 while(rs.next()) { 

Float a=Float.parseFloat(rs.getString(3));
Float b=Float.parseFloat(rs.getString(4));
Float c=a+b;
%> 
<tr>
<td> <%= "MCA" %> </td> 
<td> <%= rs.getString(1) %> </td>
<td> <%= rs.getString(2) %>
<td> <%= rs.getString(6) %>
<td> <%= c %> </td>
<td> <%= 50 %> </td>
<td> <%= rs.getString(5) %> </td>
<td style="text-align:center" ><img id="img" src="bimg/right.jpg" height="30px" width="35px"> </td>
</tr>

<% 
} %>
</table>  

</br>
</br>
</br>
<H1> <CENTER>   Practical FeedBack   </CENTER></H1>
 <table border=2 style="width:100%;"><tr><th>Branch</th><th>Subject</th><th>Year</th><th>Section</th><th>Feedback</th><th>Students</th><th>gave feedback</th><th>EXIST</th></tr>
<% 
 while(rs1.next()) { 


%> 
<tr>
<td> <%= "MCA" %> </td> 
<td> <%= rs1.getString(1) %> </td>
<td> <%= rs1.getString(2) %>
<td> <%= rs1.getString(6) %>
<td> <%= rs1.getString(3) %> </td>
<td> <%= 50 %> </td>
<td> <%= rs1.getString(5) %> </td>
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
             out.println("exception .....");
             }
             }
  else
	{
	response.sendRedirect("Login.jsp");
}
            
             
            
             
             %>
  </div>
</body>
</head>

             


