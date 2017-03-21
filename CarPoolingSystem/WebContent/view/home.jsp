<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
    <%@ page import="Model.Users" %>
 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="res/js/jquery-3.2.0.js" charset="utf-8"></script>
<script type="text/javascript" src="res/js/profile.js" charset="utf-8"></script>
<script type="text/javascript" src="res/js/home.js" charset="utf-8"></script>
<title>Home Page</title>
</head>
<body>

<%
	String gender ="";
	if( ((Users)session.getAttribute("logedinuser")).getGender() == 1){
		gender = "Male";
	}else{
		gender = "Female";
	}
%>
	<p><a href = "">Log out</a>
	<a href = "view/updateprofile.jsp">Update profile</a>
	<a href = "view/Weatherservice.jsp">Weather Service</a></p>
 	<p>Welcome to Ride Pool</p>
	<p>Ask for ride, offering a ride</p>
	
	<form action="Home" method="post">
	<input type="hidden" id="txtuserid" name="userid" value="${logedinuser.userid}"><br>
	<textarea rows="6" cols="50" id="txtpost" name="txtpost" placeholder="Write a post"></textarea><br><br>
	<input type="button" id="btnPostMessage"  value="submit">
	</form>
	
	
	<p>Welcome ${logedinuser.fullname}</p>
	<p>Gender: <%=gender %></p>
	<p>State: ${logedinuser.state}</p>
	<p>City: ${logedinuser.city}</p>
	<p>Street: ${logedinuser.street}</p>
	<p>zip code: ${logedinuser.zipcode}</p>
	<p>Birth year: ${logedinuser.birthyear}</p>
	<p>Email: ${logedinuser.email}</p>
	
	<h3>Posts</h3>
	
	
		<c:forEach var="post" items="${allpost}">
			
			<div style="border:1px solid">
				${post.post}
				${post.posttype}
				
					
					<c:forEach var="comment" items="${post.commensts}">
					<br>
					${comment.comment} <a href=""> Delete</a>
					</c:forEach>
					<br>
				 Add comment<br>
				 <textarea rows="1" cols="30" name="txtpost" placeholder="Write a comment"></textarea><br>
				 <input type="button" value="Comment">
			</div>
		</c:forEach>
		
		
	11
	
</body>
</html>