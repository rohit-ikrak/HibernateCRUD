<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Date</title>
</head>

<script src="js/jquery.js"></script>
<script>
	$("document").ready(function(){
		$("#btn").click(function(){
			var id = $("#id").val();
			var name = $("#name").val();
			var email = $("#email").val();
			var contact = $("#contact").val();	
			
//			alert(id + " " + name + " " + contact + " " + email);
			$.post("UpdateRecord.jsp", {id:id, name:name, email:email, contact:contact}, function(data){
				alert(data);
			});
		});
	});	
</script>

<body>
	<table>
		<tr>
			<td>Enter Id:</td>
			<td><input type="text" name="id" id="id" /></td>
		</tr>
		<tr>
			<td>Enter Name:</td>
			<td><input type="text" name="name" id="name" /></td>
		</tr>
		<tr>
			<td>Enter Email:</td>
			<td><input type="text" name="email" id="email" /></td>
		</tr>
		<tr>
			<td>Enter Contact:</td>
			<td><input type="text" name="contact" id="contact" /></td>
		</tr>
		<tr>
			<td></td>
			<td><button id="btn">Update</button></td>
		</tr>
	</table>
</body>
</html>