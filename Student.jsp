<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<html>
<head>
<style>
body
{
background-color:#330000;

}

#m001
{
height:100px;

background-color:#800000;

margin-left:-6px;
margin-top:-17px;
margin-right:-6px;
color:white;


}
h1
{
padding-top:10px;
padding-left:155px;


}


#menu ul
{

list-style:none;
margin-top:-90px;

}
 #menu ul li
{

background-color:#800000;
border: 0px;
width:170px;
height:50px;
text-align:center;
line-height:55px;
float:left;
position:relative;



}
#menu ul li a
{
text-decoration:none;
color:white;
display:block;

}

#menu ul li a:hover
{
background-color:#330000;
border-radius: 30px 30px 30px 30px;
}
#menu
{

margin-left:600px;

margin-top:40px;
}
#subMenu
{


margin-top:100px;
height:450px;
width:220px;
margin-left:1110px;
color-white;
background-color:#330000;


}
#subMenu ul li 
{

color:white;
}
#subMenu ul li a
{

color:white;
}
#subMenu h4
{
padding:2px;
color:white;
}

#main
{


width:1050px;
height:400px;
color:white;
margin-top:-547px;

}
#footer
{

height:40px;
width:1000px;
margin-top:90px;

color:white;
margin-left:150px;
background-color:#800000;

}

</style>
</head>

<body>
<%

String s=(String)session.getAttribute("name");
if(((session.getAttribute("name"))!=null))
     {

%>
<div id="m001">
<h1><em>FeedbackSystem</em></h1>
<h4 style="margin-left:100px"><em>within the hands of AKGEC</em></h4>

<div id="menu">
<ul>
<li><a href="Student.jsp" target=f2>Home</a></li>
<li><a href="Theory.jsp">Theory</a></li>
<li><a href="Practical.jsp">Pracrtical</a></li>

<li><a href="LogOut.jsp">Logout</a></li>

</ul>
</div>

</div>
<div id="subMenu">



</br>
<ul>

</ul>
</br>

</div>
<div id="main">

<center><h1>Welcome To FaculyFeedback System!</h1></center>
</br></br>
<center>
<p>
 This  WebSite is developed for  the Faculties  of AKGEC for helping  them
to take easly feedback from student. </p><p> Visitors must keep in mind  that website 
of feedback only for AKGEC and students can only be able to give feedback within college. 
</p><p>intended to provide a gernal  idea  of  organization and furnish
authentic through basic information on its functioning in a  convenient and atteracive manner</p>
</br>
</br>
<p>All endeavours have been made to provide a correct informaiton in the Website</p>
<p>However ,any inadvertant error that might have crept in, if brought to out notice will be rectified in the next updating shedule.</p>

</p>
</center>

</div>
<div id="footer">

<em> <center><h3>Copyright @ 2016 AKGEC<h3></center>
</div>
</body>
<% 
 }
else
{
response.sendRedirect("Login.jsp");

}

 %>
</html>