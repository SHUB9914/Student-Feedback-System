<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<html>
<head></head>
<body>

<%



try
{

 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Feedback","root",null);
          
String Sub_Code=request.getParameter("q");
PreparedStatement  st=con.prepareStatement("select * from stu_info where rno=?");
	st.setString(1,Sub_Code);
 ResultSet rs = st.executeQuery(); %>
 <select  name="Branch">
 <% 
while(rs.next())
{ %>


<option> <%= rs.getString(5) %>  </option>


<% }





} catch(Exception e)
{


}



 %>




</body>
</html>
