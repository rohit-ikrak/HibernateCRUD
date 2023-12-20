<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.cfg.Configuration" %>
<%@page import="com.maven.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
int id = Integer.parseInt(request.getParameter("id"));
String name = request.getParameter("name");
String email = request.getParameter("email");
String contact = request.getParameter("contact");

User u = new User();

u.setUid(id);
u.setUname(name);
u.setUemail(email);
u.setUcontact(contact);

//out.print(u.getUid() +" " + u.getUname()+ " " + u.getUemail()+ " " + u.getUcontact());

Configuration con = new Configuration().configure().addAnnotatedClass(User.class);
SessionFactory sf = con.buildSessionFactory();
Session s = sf.openSession();
Transaction tx = s.beginTransaction();
try {
	s.save(u);
	tx.commit();
	out.println("Value Inserted.");
} catch (Exception e) {
	e.printStackTrace();
	out.print("Id not valid");
}
%>
