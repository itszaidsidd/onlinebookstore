<%@page import="java.sql.*" %>
<html>
	<head>
		<style>
			body{
				background-color:rgba(1,1,1,0.3);
				color:darkblue;
				background-color:lightblue;
			}
			h2{
				color:darkblue;
				text-decoration:underline;
			}
			table{
				background-color:white;
				border-radius:25px 25px 0 0;
				font-size:20;
				font-family:vardana;
				padding:10px;
				width:100%;
				text-align:center;
				border:1px solid black;
				
			}
			td{
				border:1px solid rgb(0,0,0);	
				text-decoration-color:white;
			}
			tr:hover{
				background-color:darkblue;
				color:white;
			}
		
		</style>
	</head>
	<body>
		<center>
		<h2>Record of Sold Books</h2>
		<table>
		<tr bgcolor=gray style="color:yellow;">
			<th style="border-radius:16px 0 0 0">Reg no</th>
			<th>Customer Name</th>
			<th>E-mail Id</th>
			<th>Phone No.</th>
			<th>Address</th>
			<th>Book Id</th>
			<th>Title</th>
			<th>Author</th>
			<th>Price</th>
			<th style="border-radius:0 16px 0 0">Date & Time</th>
		</tr>
		<%
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
				Statement state=con.createStatement();
				String q="select * from record";
				ResultSet res=state.executeQuery(q);
				while(res.next())
				{
					%>
					<tr>
						<td><% out.write(res.getString("rno"));%></td>
						<td><% out.write(res.getString("name"));%></td>
						<td><% out.write(res.getString("email"));%></td>
						<td><% out.write(res.getString("pno"));%></td>
						<td><% out.write(res.getString("address"));%></td>
						<td><% out.write(res.getString("bno"));%></td>
						<td><% out.write(res.getString("title"));%></td>
						<td><% out.write(res.getString("author"));%></td>
						<td><% out.write(res.getString("price"));%></td>
						<td><% out.write(res.getString("d"));%></td>
						
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
						