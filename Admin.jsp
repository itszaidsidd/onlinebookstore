<%@page import="java.sql.*"%>
<html>
	<head>
		<style>
			div.box{ 
				width:25%;
				height:60%;
				background-color: white;
				border-radius: 25px 0 25px 0;
				margin-top:30px;
				font-family:verdana;
				
			}
			input[type=text]{
				width:80%;
				height:40px;
				border:none;
				border-bottom:2px solid gray;
			}
			input[type=submit]{
				width:80%;
				height:40px;
				border-radius:20px;
				background-color:blue;
				color:white;
				border:none;
				font-weight:bold;
			}
			input[type=submit]:hover{
				width:80%;
				height:40px;
				border-radius:20px;
				background-color:lightgray;
				color:blue;
				border:none;
				font-weight:bold;
			}
			
		</style>	
	</head>
	<body>
		<p>
		<center>
		<div class=box><hr style="border:none;">
		<h2 style="font-family:verdana">Login</h2><hr color=gray><p>
		<form>
			<input type=text name=t1 placeholder=Username><p>
			<input type=text name=t2 placeholder=Password>
			<div class=abc style="text-align:left;margin-left:35px;color:gray;font-size:13;font-family:verdana">Forgate Password?</div><br>
			<input type=submit value=Login name=b1><p>
			<div style="color:gray;font-size:13;font-family:verdana">Not a member? <a href="#">Sign up</a></div>
		</form>
		</div>
		<%
			String r=request.getParameter("b1");
			if("Login".equals(r))
			{
				String user,pass;
				user=request.getParameter("t1");
				pass=request.getParameter("t2");
				try
				{
					Class.forName("oracle.jdbc.OracleDriver");
					Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
					Statement state=con.createStatement();
					String q="select * from admin";
					ResultSet res=state.executeQuery(q);
					if(res.next())
					{
						if(res.getString("username").equals(user) && res.getString("password").equals(pass))
						{
							response.sendRedirect("login.jsp");
						}
						else
						{
							%>
							<script>alert("Invalid User or Password");</script>
							<%
						}
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