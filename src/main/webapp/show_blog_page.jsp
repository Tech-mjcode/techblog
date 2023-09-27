<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error_page.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%>

<%
int post_id = Integer.parseInt(request.getParameter("post_id"));

PostDao pDao = new PostDao(ConnectionProvider.getConnection());
Post p = pDao.getAllPostByPostId(post_id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=p.getpTitle()%></title>

<!-- 	Bootstrap css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/TechBlog/css/style.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
}

.post-title {
	font-weight: 100;
	font-size: 30px;
}

.post-content {
	font-weight: 100;
	font-size: 25px;
}

.post-date {
	font-weight: 80;
	font-size: 20px;
	font-style: italic;
}

.post-user-info{
	font-weight: 80;
	font-size: 20px;
	
}

.row-user{
	border: 1px solid black;
	padding-top: 12px;
}
</style>
</head>
<body class = "primary-background">
	<!-- 			addNavbar -->
	<%@ include file="normal_navbar.jsp" %>
<!-- 				end of nav -->


	<!--         main content of the body -->



	<div class="container mt-5">
		<div class="row">
			<div class="col col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header primary-background text-white">
						<h4 class="post-title"><%=p.getpTitle()%></h4>
					</div>

					<div class="card-body">
						<img src="pics/<%=p.getpPic()%>" class="card-img-top"
							height="500px"> <br> <br>
						<div class="row row-user">
							<div class="col col-md-8 post-user-info">
							<% UserDao uDao = new UserDao(ConnectionProvider.getConnection());
								User u1 = uDao.getUserById(p.getuId());
							%>
								<p><a href="#"><%= u1.getName() %></a> has posted :</p>
							</div>
							<div class="col col-md-4 post-date">
								<p><%=p.getpDate().toLocaleString()%></p>
							</div>
						</div>
						<p class="post-content"><%=p.getpContent()%></p>
						<br> <br>
						<div class="post-code">
							<pre><%= DateFormat.getDateTimeInstance().format(p.getpDate())%></pre>
						</div>
					</div>

					<diV class="card-footer primary-background">
						<a href="#" class="btn btn-outline-light"><i
							class="fa fa-thumbs-o-up"><span> 10</span></i></a> <a href="#"
							class="btn btn-outline-light"><i class="fa fa-commenting-o"><span>
									20</span></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 			end of main content -->
</body>
</html>