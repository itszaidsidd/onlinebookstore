<%@page import="java.sql.*"%>
<html>
	<head>
		<style>
			table{
				width:700px;
				background-color: rgba(7,7,0,0.5);
				padding:20px;
				font-size:20;
				font-family: verdana;
				color:white;
				margin:auto;
				border-radius:10px;
			}
			input[type=text]{
				padding:5px;
				width:100%;
				font-size:18px;
				border-radius: 0 10px 0 0;	
			}
			input[type=submit]{
				fone-size:18px;
				padding:10px;
				width:30%;
				border-radius:10px;
				border:none;
			}
			input[type=reset]{
				fone-size:18px;
				padding:10px;
				width:30%;
				border-radius:10px;
				border:none;
			}
			
		</style>
	</head>
	<body bgcolor=lightblue>
	<center><br>
	<h1>Add New Book</h1>
	<form>
		<table cellspacing=5>
		<tr>
			<td>Book id</td>
			<td>Subject</td>
		</tr>
		<tr>
			<td><input type=text name=t1></td>
			<td><input type=text name=t2></td>
		</tr>
		
		<tr>
			<td>Title</td>
			<td>Author</td>
		</tr>
		<tr>
			<td><input type=text name=t4></td>
			<td><input type=text name=t5></td>
		</tr>
		<tr>
			<td>Price</td>
			<td>Quantity</td>
		</tr>
		<tr>
			<td><input type=text name=t6></td>
			<td><input type=text name=t7></td>
		</tr>
		<tr>
			<td><center><br><input type=SUBMIT value=SUBMIT name=b1></td>
			<td><center><br><input type=reset value=RESET name=b2></td>
		</tr>
	</table>
	<%
		String r=request.getParameter("b1");
		if("SUBMIT".equals(r))
		{
			int price,qty;
			String bno,subject,title,author;
			bno=request.getParameter("t1");
			subject=request.getParameter("t2");
			title=request.getParameter("t4");
			author=request.getParameter("t5");
			price=Integer.parseInt(request.getParameter("t6"));
			qty=Integer.parseInt(request.getParameter("t7"));
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
				Statement state=con.createStatement();
				String q="insert into book values('"+bno+"','"+subject+"','"+title+"','"+author+"',"+price+","+qty+")";
				state.executeUpdate(q);
				out.write("<h1>Successfully Saved</h1>");
			}
			catch(Exception e)
			{
				out.write(e.getMessage());
			}
		}
	%>

	</body>
</html>