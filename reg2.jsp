<%@page import="java.sql.*"%>
<html>
	<head>
		<style>
			table{
				width:700px;
				background-color: purple;
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
	<body  bgcolor=lightgray>
	<center>
	<form>
		<table cellspacing=5>
		<tr>
			<td>Registration No</td>
			<td>Name</td>
		</tr>
		<tr>
			<td><input type=text name=t1></td>
			<td><input type=text name=t2></td>
		</tr>
		<tr>
			<td colspan=2>Email Id</td>
		</tr>
		<tr>
			<td colspan=2><input type=text name=t3></td>
		</tr>
		<tr>
			<td>Password</td>
			<td>Confirm Password</td>
		</tr>
		<tr>
			<td><input type=text name=t4></td>
			<td><input type=text name=t5></td>
		</tr>
		<tr>
			<td>Phone No</td>
			<td>Address</td>
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
			int rno;
			String name,email,pass,confirmPass,phone,address;
			rno=Integer.parseInt(request.getParameter("t1"));
			name=request.getParameter("t2");
			email=request.getParameter("t3");
			pass=request.getParameter("t4");
			confirmPass=request.getParameter("t5");
			phone=request.getParameter("t2");
			address=request.getParameter("t2");
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
				Statement state=con.createStatement();
				String q="insert into reg values("+rno+",'"+name+"','"+email+"','"+pass+"','"+phone+"','"+address+"')";
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
	
	</body>
</html>