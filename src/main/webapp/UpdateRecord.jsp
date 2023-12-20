<%@page import="com.maven.entities.User"%>
<%@page import="org.hibernate.cfg.Configuration" %>
<%@page import="org.hibernate.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String contact = request.getParameter("contact");
	
//	out.print(id+name+email+contact);

	User u = new User();
	u.setUid(id);
	u.setUname(name);
	u.setUemail(email);
	u.setUcontact(contact);
	;
//	out.print(u.getUcontact() + u.getUemail() + u.getUid() + u.getUname());

	Configuration con = new Configuration().configure().addAnnotatedClass(User.class);
	SessionFactory sf = con.buildSessionFactory();
	Session s = sf.openSession();
	Transaction tx = s.beginTransaction();
	try{
		s.update(u);
		tx.commit();
		out.print("Value Updated.");
	}
	catch(Exception e){
		e.printStackTrace();
		out.print("Value not valid");
	}
%>