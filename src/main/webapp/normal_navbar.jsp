<%@page import="com.tech.blog.entities.User"%>
<%
HttpSession se = request.getSession();
User u = (User) se.getAttribute("currentUser");
%>


<nav class="navbar navbar-expand-lg navbar-dark primary-background">
	<%
	if (u == null) {
	%>
	<a class="navbar-brand" href="index.jsp"> <span
		class="fa fa-asterisk"></span> Tech Blog
	</a>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<!--             <li class="nav-item active"> -->
			<!--                 <a class="nav-link" href="#"> <span class="	fa fa-bell-o"></span> LearnCode with Manash <span class="sr-only">(current)</span></a> -->
			<!--             </li> -->

			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <span class="	fa fa-check-square-o"></span>
					Categories
			</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">Programming Language</a> <a
						class="dropdown-item" href="#">Project Implementation</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Data Structure</a>
				</div></li>

			<li class="nav-item"><a class="nav-link" href="#"> <span
					class="	fa fa-address-card-o"></span> Contact
			</a></li>

			<li class="nav-item"><a class="nav-link" href="login_page.jsp">
					<span class="fa fa-user-circle "></span> Login
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="register_page.jsp"> <span class="fa fa-user-plus "></span>
					Sign up
			</a></li>
		</ul>
	</div>
	<%
	} else {
	%>
	<!-- 				user login -->

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" href="profile.jsp">
					<span class="	fa fa-asterisk"></span> Home
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="user_post_page.jsp"> <span class="	fa fa-asterisk"></span>
					Your Post
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#"
				data-toggle="modal" data-target="#add-post-modal"> <span
					class="	fa fa-asterisk"></span> Do Post
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#!"
				data-toggle="modal" data-target="#profile-modal"> <span
					class="fa fa-user-circle "></span> <%=u.getName()%>
			</a></li>

			<li class="nav-item"><a class="nav-link" href="LogoutServlet">
					<span class="fa fa-user-plus "></span> Logout
			</a></li>
		</ul>
	</div>
	<%
	}
	%>


</nav>
