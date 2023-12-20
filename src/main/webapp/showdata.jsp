<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.maven.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="org.hibernate.cfg.*" %>
<%@page import="org.hibernate.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Data</title>
</head>
<body>
	<table>
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Email</th>
			<th>Contact</th>
		</tr>
		<%
			Configuration con = new Configuration().configure().addAnnotatedClass(User.class);
			SessionFactory sf = con.buildSessionFactory();
			Session s = sf.openSession();
			Transaction tx = s.beginTransaction();
			Query q = s.createQuery("from User");
			List l = q.list();
			Iterator i = l.iterator();
			while(i.hasNext()){
				User u = (User) i.next();
        %>
        <tr>
        	<td>
        		<% out.print(u.getUid()); %>
        	</td>
        	<td>
        		<% out.print(u.getUname()); %>
        	</td>
        	<td>
        		<% out.print(u.getUemail()); %>
        	</td>
        	<td>
        		<% out.print(u.getUcontact()); %>
        	</td>
        </tr>
		<%	
			}
		%>
	</table>
	
</body>
</html>