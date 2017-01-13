<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
  <body>
   <%
   try
   {
    
              Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback","root",null);
                    

            String uname = request.getParameter("uname");
            String password = request.getParameter("pword");
            int flag=0;
            
            
   PreparedStatement  st=con.prepareStatement("select * from Hod_info where id=? and password=?" );
   PreparedStatement  st1=con.prepareStatement("select * from stu_info where rno=? and password=?" );
   PreparedStatement  st2=con.prepareStatement("select * from teacher_info where tid=? and password=?" );
   
   			st.setString(1,uname);
   			st.setString(2,password);
   			
   			st1.setString(1,uname);
   			st1.setString(2,password);
   			
   			st2.setString(1,uname);
   			st2.setString(2,password);
   			
   			ResultSet rs = st.executeQuery();
   			ResultSet rs1 = st1.executeQuery();
   			ResultSet rs2 = st2.executeQuery();
           
            
              while(rs.next())
              {
              	flag=1;
                session.setAttribute("name",uname);  //STARTING OF SESSION
        		response.sendRedirect("Hod.jsp");
              
              }
              while(rs1.next())
              {
              	flag=1;
                session.setAttribute("name",uname);  //STARTING OF SESSION
        		response.sendRedirect("Student.jsp");
              
              }
              while(rs2.next())
              {
              flag=1;
                session.setAttribute("name",uname);  //STARTING OF SESSION
        		response.sendRedirect("Teacher.jsp");
              
              }
              if(flag==0)
              {
              response.sendRedirect("Login.jsp");
              
              }
              
              
              }
            
  catch(Exception ex)
  {
  ex.printStackTrace();
  out.println(ex.getMessage());
  } %> 
            
            
      </body>    
</html>

