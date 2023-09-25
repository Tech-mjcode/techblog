<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">

	<%
	Thread.sleep(500);
	PostDao pDao = new PostDao(ConnectionProvider.getConnection());
	int catId = Integer.parseInt(request.getParameter("cid"));
	ArrayList<Post> p = null;
	if(catId == 0){
		p = pDao.getAllPost();
	}else{
		p = pDao.getAllPostByCattegory(catId);
	}
	
	if(p.size()==0){
		out.println("<h3 class = 'display-3 text-center'>No Post</h3>");
		return;
	}
	for (Post post : p) {
	%>
	<div class="col-md-6 mt-2">
		<div class = "card">
			<img src="pics/<%= post.getpPic() %>" class="card-img-top" alt="...">
			<div class = card-body>
				<h1><%= post.getpTitle() %></h1>
				<p><%= post.getpContent() %></p>
				<pre><%= post.getpCode() %></pre>
			</div>
		</div>
	</div>
	<%
	}
	%>




</div>