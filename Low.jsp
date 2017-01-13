<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <style>
  body
  {
  background-color:#800000;
  
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
     
     
    
             
         
	try
             {
            	
            
              Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback","root",null);
          

           PreparedStatement  st=con.prepareStatement("select Faculty_name,sub_name,B_NAME,year, avg1, avg2 from theory where avg1 in (select min(avg1) from theory)" );
           PreparedStatement  st1=con.prepareStatement("select avg(avg1),avg(avg2) from theory where Faculty_name=?" );
           
              //st.setString(1,tname);
              ResultSet rs = st.executeQuery();
               
             
               int flag=0;
              
               String str1="";
               String str="";
               
                 
           
               %>
              
		
               <table border=2 style="width:100%;"><tr><th>Teachers</th><th>subject</th><th>Branch</th><th>year</th><th>feedback1</th><th>feedback2</th><th>EXIST</th></tr>
            <%  while(rs.next()) { 
            
            
            if(flag==0)
            {
            String s=rs.getString(1);
           
            st1.setString(1,s);
            out.println(s);
            ResultSet rs1 = st1.executeQuery();
            
            
            while(rs1.next())
               {
               
               str=rs1.getString(1);
               str1=rs1.getString(2);
               
               }
               flag=1;
               
               
            
            
            }
        
            %>
            
              
<tr>
<td> <%= rs.getString(1) %> </td> 
<td> <%= rs.getString(2) %> </td>
<td> <%= rs.getString(3) %> </td>
<td> <%= rs.getString(4)  %> </td>
<td> <%= str %> </td>
<td> <%= str1 %> </td>
 
<td style="text-align:center" ><img id="img" src="bimg/right.jpg" height="30px" width="35px"> </td>

 </tr>
 
<% 
}
}
     
             
             catch(Exception ex)
             {
             out.println(ex.getMessage());
             }
            
             
            
             
             %>
  
</body>
</head>

             


