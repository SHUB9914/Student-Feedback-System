<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>


<html>
<head>

<link rel="stylesheet" href="bootstrap.min.css">


<script src="bootstrap.min.js"></script>

<link rel="stylesheet" href="home.css">

<style>
#m001
{

margin-left:200px;

}

#m001 table
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



              
              


<div class="container" >

<h1>plese select  Year</h1>
</br>
</br>


<form >

</br>

<div class="form-group">
<label for="sname">Teacher Name:</label>

<select class="form-control" id="sname" name="rno" onchange="My(this.value)" >
<option> Select Year</option>
<option>1</option>
<option>2</option>
<option>3</option>
</select>
</div>


<script>
function My(str) {
  var xhttp;  
    
  if (str == "") {
    document.getElementById("Branch").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      document.getElementById("m001").innerHTML = xhttp.responseText;
    }
  };
  xhttp.open("GET", "SectionAjax.jsp?q="+str, true);
  xhttp.send();
  name(str);
}

</script>
</br>
</br>
</br>
</div>
<div id="m001" >

</div>

     
            


</body>
</html>