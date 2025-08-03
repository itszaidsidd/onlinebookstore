<%@page import="java.sql.*" %>
<html>
	<head>
		<style>
			table{
				background-color:white;
				border-radius:25px;
				font-size:20;
				font-family:vardana;
				padding:10px;
				width:800;
				text-align:center;
				border:1px solid black;
			}
			tr:hover{
				background-color:blue;
				color:white;
				cursor:pointer;
			}
		</style>
	</head>
	<body bgcolor=wheat text=darkblue>
		<center>
		<u><h2>LIST OF BOOKS</h2></u>
		<table>
		<tr bgcolor=gray style="color:yellow;">
			<th style="border-radius:16px 0 0 0">Book Id</th>
			<th>Subject</th>
			<th>Title</th>
			<th>Author</th>
			<th>Price</th>
			<th style="border-radius:0 16px 0 0">Quantity</th>
		</tr>
		<%
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
				Statement state=con.createStatement();
				String q="select * from book";
				ResultSet res=state.executeQuery(q);
				while(res.next())
				{
					%>
					<tr>
						<td><% out.write(res.getString("bno"));%></td>
						<td><% out.write(res.getString("subject"));%></td>
						<td><% out.write(res.getString("title"));%></td>
						<td><% out.write(res.getString("author"));%></td>
						<td><% out.write(res.getString("price"));%></td>
						<td><% out.write(res.getString("qty"));%></td>
						
					</tr>
					<%
				}
			}
			catch(Exception e)
			{
				out.write(e.getMessage());
			}
		%>
		</table>
	</body>
</html>
						