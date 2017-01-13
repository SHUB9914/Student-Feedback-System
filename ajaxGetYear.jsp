<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<html>
<head></head>
<body>

<%



try
{

 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Feedback","root",null);
          
String rno=request.getParameter("q");
PreparedStatement  st=con.prepareStatement("select * from stu_info where rno=?");
	st.setString(1,rno);
 ResultSet rs = st.executeQuery(); %>
 <select  name="Branch">
 <% 
while(rs.next())
{ %>


<option> <%= rs.getString(4) %>  </option>


<% }





} catch(Exception e)
{


}



 %>




</body>
</html>
