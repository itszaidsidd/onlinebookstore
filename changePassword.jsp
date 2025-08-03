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
	<h1>Change Password</h1>
	<form>
		<table cellspacing=5>
		<tr>
			<td>User Name</td>
			<td>Old Password</td>
		</tr>
		<tr>
			<td><input type=text name=t1></td>
			<td><input type=text name=t2></td>
		</tr>
		
		<tr>
			<td>New Password</td>
			<td>Confirm Password</td>
		</tr>
		<tr>
			<td><input type=text name=t3></td>
			<td><input type=text name=t4></td>
		</tr>
		<tr>
			<td colspan=2><center><br><input type=SUBMIT value=CHANGE name=b1></td>
		</tr>
	</table>
	<%
		String r=request.getParameter("b1");
		if("CHANGE".equals(r))
		{
			String user,pass,newpass;
			user=request.getParameter("t1");
			pass=request.getParameter("t2");
			newpass=request.getParameter("t3");
			String c="select * from admin where username='"+user+"' and password='"+pass+"'";
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
				Statement state=con.createStatement();
				ResultSet res=state.executeQuery(c);
				if(!res.next())
				{
					%>
					<script>alert("Invalid Username or Password");</script>
					<%
				}
				else
				{
					String q="update admin set password='"+newpass+"' where username='"+user+"'";
					state.executeUpdate(q);
					out.write("<h1>Successfully Change</h1>");
				}
			}
			catch(Exception e)
			{
				out.write(e.getMessage());
			}
		}
	%>

	</body>
</html>