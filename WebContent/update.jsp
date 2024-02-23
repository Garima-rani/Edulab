<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


</head>
<body>
<%
String id=request.getParameter("id");
try
{

	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","root");
	PreparedStatement ps =con.prepareStatement("SELECT * from student where id="+id);
	ResultSet set=ps.executeQuery();
    while(set.next())
    {
    	

%>

<div class="modal fade " id="Modal3" tabindex="-1" aria-labelledby="ModalLabel3" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" >
  
    <div class="modal-content"  >
    <div class="modal-header bg-dark text-white">
         <h5 class="modal-title" id="ModalLabel3">Update</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
    <div class="container">
        
        <form action="updateStudent" method="post" >
      <div class="modal-body m-2">
  <div class="row">
        
         <div class="col-md-6">
        <label for="fname" class="form-label">Id</label>
        <input type="number" class="form-control" id="id" name="id" value="<%=set.getString("id") %>">
        </div>
        
 
        <div class="col-md-6">
        <label for="fname" class="form-label">First Name</label>
        <input type="text" class="form-control" id="fname" name="fname" value="<%=set.getString("fname") %>">
        </div>
        
        
        <div class="col-md-6">
        <label for="lname" class="form-label">Last Name</label>
        <input type="text" class="form-control" id="lname" name="lname" value="<%=set.getString("lname") %>">
        </div>
        <div class="col-xs-12">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control" id="email" name="email" value="<%=set.getString("email") %>">
        </div>
        
         <div class="col-xs-12">
        <label for="number" class="form-label">Contact</label>
        <input type="number" class="form-control" id="number" name="contact_no" value="<%=set.getString("contact_no") %>">
        </div>
        
        <div class="col-md-6">
        <label class="form-label">Gender</label>
        <div class="form-check" value="<%=set.getString("gender") %>">
  <input class="form-check-input" type="radio" name="gender" id="gender1" value="Male">
  
  <label class="form-check-label" for="gender1">
    Male
  </label>
</div>
<div class="form-check">

  <input class="form-check-input" type="radio" name="gender" id="gender2" value="Female">
  <label class="form-check-label" for="gender2">
    Female
  </label>
</div>
        </div>
 
        <div class="col-md-6">
        <label for="pass" class="form-label">Password</label>
        <input type="password" class="form-control" id="pass" name="pass" value="<%=set.getString("password") %>">
        </div>
     
        
         <div class="col-xs-12">
        <label for="ad" class="form-label">Address</label>
        <input type="text" class="form-control" id="ad" name="address" value="<%=set.getString("address") %>">
        </div>
        
    </div>
  <br>
    <button type="submit" class="btn btn-primary">Submit</button>
  
    
      </div>
      </form>
     
    </div>
</div>
      
       
    </div>
  </div>

<%
    }
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>