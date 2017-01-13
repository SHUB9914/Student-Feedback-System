<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>

<html>
<head></head>
    
<body>
<% 
try 
{

String Roll_NO=request.getParameter("rno");
String date=request.getParameter("Date");
String sname=request.getParameter("student_name");
String Fname=request.getParameter("Nofm");
String labAname=request.getParameter("Nola");
String sub_code=request.getParameter("SubCode");
String branch=request.getParameter("Branch");
String year=request.getParameter("Year");
String sub_name=request.getParameter("Sub_Name");
String section=request.getParameter("Section");
String sem=request.getParameter("Sem");
String fou1=request.getParameter("Fou1");
String fou2=request.getParameter("Fou2");

     
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Feedback","root",null);
PreparedStatement  st=con.prepareStatement("insert into practical values(?,?,?,?,?,?,?,?,?,?,?)");
PreparedStatement  st1=con.prepareStatement("select * from practical where rno=? and fname=?  ");
//PreparedStatement  st1=con.prepareStatement("select * from theory where rno=? and faculty_name=?  ");
st1.setString(1,Roll_NO);
st1.setString(2,Fname);

ResultSet rs=st1.executeQuery();
String p="";
while(rs.next())
{
p=rs.getString(1);

}
if(p.equals(Roll_NO))
{
out.println("sorry you can not give again feedback");

}
else
{
st.setString(1,Roll_NO);
st.setString(2,sname);
st.setString(3,branch);
st.setString(4,year);
st.setString(5,sub_code);
st.setString(6,Fname);
st.setString(7,fou1);
st.setString(8,fou2);
st.setString(9,sub_name);
st.setString(10,labAname);
st.setString(11,section);
int i=st.executeUpdate();
if(i>0)
{
out.println("your feedback submited successfully ");

}
else
{

out.println("not update");
}
}
}
catch(Exception e)
{

out.println(e.getMessage());

} %>
</body>
</html>