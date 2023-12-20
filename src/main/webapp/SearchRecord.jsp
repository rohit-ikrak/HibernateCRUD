<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.maven.entities.User"%>
<%@page import="org.hibernate.cfg.*" %>
<%@page import="org.hibernate.*" %>
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
	
	Query q = s.createQuery("from User where Uid = " + id);
	List l = q.list();
	Iterator i = l.iterator();
	while(i.hasNext()){
		User o = (User) i.next();
		out.print(o.getUid()+" "+o.getUname()+" "+o.getUemail()+" "+o.getUcontact());
	}
%>