<%@page import="java.sql.*"%>
<html>
	<head>
		<style>
			form{
				background-color: lightblue;
				width:750px;
				padding:5px;
				border-radius:20px;
			}
			table{
				width:700px;
				background-color: rgba(7,7,0,0.5);
				padding:20px;
				font-size:20;
				font-family: verdana;
				color:white;
				margin-top:20px;
				margin-bottom:20px;
				border-radius:10px;
			}
			input[type=text]{
				padding:5px;
				width:100%;
				font-size:18px;
				border-radius: 0 10px 0 0;	
			}
			input[type=submit]{
				padding:7px;
				font-size:18px;
				background-color:black;
				border:none;
				border-radius:10px;
				color:white;
			}
			input[type=submit]:hover{
				background-color:lightgray;
				color:black;
			}input[type=reset]{
				padding:7px;
				font-size:18px;
				background-color:black;
				border:none;
				border-radius:10px;
				color:white;
			}
			input[type=reset]:hover{
				background-color:lightgray;
				color:black;
			}
		</style>
	</head>
	<body >
		<center>
		<form>
		
			<table>
				<tr>
					<td>Name</td>
					<td>Password</td>
				</tr>		
				<tr>
					<td><input type=text name=t1></td>
					<td><input type=text name=t2></td>
				</tr>
				<tr>
					<td colspan=2><input type=submit value=VERIFY name=b1 style="width:100%;"></td>
				</tr>
				<%
					String r=request.getParameter("b1");
					if("VERIFY".equals(r))
					{
						String name,password;
						name=request.getParameter("t1");
						password=request.getParameter("t2");
						try
						{
							Class.forName("oracle.jdbc.driver.OracleDriver");
							Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
							Statement state=con.createStatement();
							String q="select name,pass from reg where name='"+name+"' and pass='"+password+"'";
							ResultSet res=state.executeQuery(q);
							if(!res.next())
							{
								%>
								<script>alert("Invalid Username or Password");</script>
								<%
							}
							else			
							{
								%>
								<tr>
									<td>Book Id</td>
									<td rowspan=2><input type=submit value="SHOW DETAILS" name=b2 style="width:100%;height:62px"></td>
								</tr>
								<tr>
									<td><input type=text name=t3></td>
								</tr>
								<%
							}
						}
						catch(Exception obj)
						{
							out.write(obj.getMessage());
						}
					}
					String r2=request.getParameter("b2");
					if("SHOW DETAILS".equals(r2))
					{
						String bno=request.getParameter("t3");
						String q1="select * from book where bno='"+bno+"'";
						try
						{
							Class.forName("oracle.jdbc.driver.OracleDriver");
							Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
							Statement state=con.createStatement();
							ResultSet res1=state.executeQuery(q1);
							if(!res1.next())
							{
								%>
								<script>alert("Stock not avalible");</script>
								<%
							}
							else
							{
								%>
								<tr>
									<td>Subject</td>
									<td>Title</td>
								</tr>
								<tr>
									<td><input type=text value=<%out.write(res1.getString("subject"));%>></td>
									<td><input type=text value=<%out.write(res1.getString("title"));%>></td>
								</tr>
								<tr>
									<td>Author</td>
									<td>Price</td>
								</tr>
								<tr>
									<td><input type=text value=<%out.write(res1.getString("author"));%>></td>
									<td><input type=text value=<%out.write(res1.getString("price"));%>></td>
								</tr>
								<tr>
									<td><center><br><input type=submit value=PURCHASE name=b3 style="width:120px;height:40px;font-size:15px"></td>
									<td><center><br><input type=reset value=RESET name=b4 style="width:120px;height:40px;font-size:15px"></td>
								</tr>
								<%
							}
						}
						catch(Exception e)
						{
							out.write(e.getMessage());
						}
					}
				%>		
			</table>
		</form>
	</body>
</html>