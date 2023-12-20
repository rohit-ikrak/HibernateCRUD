<%@page import="org.hibernate.*"%>
<%@page import="com.maven.entities.User"%>
<%@page import="org.hibernate.cfg.Configuration" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
	int id = Integer.parseInt(request.getParameter("id"));
	
	User u = new User();
	u.setUid(id);
	
	Configuration con = new Configuration().configure().addAnnotatedClass(User.class);
	SessionFactory sf = con.buildSessionFactory();
	Session s = sf.openSession();
	Transaction tx = s.beginTransaction();
	try{
		s.delete(u);
		tx.commit();
		out.print("Value Deleted.");
	}
	catch(Exception e){
		e.printStackTrace();
		out.print("Id not Valid.");
	}
%>