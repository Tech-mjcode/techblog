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
			<img src="pics/<%= post.getpPic() %>" class="card-img-top" alt="..." width="300px" height="300px">
			<div class = card-body>
				<h3><%= post.getpTitle() %></h3>
<%-- 				<p><%= post.getpContent() %></p> --%>
<%-- 				<pre><%= post.getpCode() %></pre> --%>

			</div>
			<diV class = "card-footer primary-background text-center">
				<a href="#" class = "btn btn-outline-light"><i class = "fa fa-thumbs-o-up"><span> 10</span></i></a>
				<a href="show_blog_page.jsp?post_id=<%= post.getpId() %>" class = "btn btn-outline-light">Read more</a>
				<a href="#" class = "btn btn-outline-light"><i class = "fa fa-commenting-o"><span> 20</span></i></a>
			</div>
		</div>
	</div>
	<%
	}
	%>




</div>