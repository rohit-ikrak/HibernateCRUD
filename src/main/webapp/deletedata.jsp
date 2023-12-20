<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Data</title>
</head>

<script src="js/jquery.js"></script>
<script>
	$("document").ready(function(){
		$("#btn").click(function(){
			var id = $("#id").val();
			
			$.post("DeleteRecord.jsp", {id:id}, function(data){
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
		
		<tr>
			<td></td>
			<td><button id="btn">Delete</button></td>
		</tr>
	</table>
</body>
</html>