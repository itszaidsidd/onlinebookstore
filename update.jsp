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
				font-size:15px;
				background-color:black;
				border:none;
				border-radius:10px;
				color:white;
				width:100%;
				height:40px;
			}
			input[type=submit]:hover{
				background-color:lightgray;
				color:black;
			}
		</style>
	</head>
	<body bgcolor=lightblue>
		<center>
		<h1>Update Book</h1>
		<form>
		
			<table>
				<tr>
					<td>Book Id</td>
					<td rowspan=2><input type=submit value="SHOW DETAILS" name=b1 style="width:100%;height:62px;"></td>
				</tr>
				<tr>
					<td><input type=text name=t1></td>
				</tr>
				<%
				String r=request.getParameter("b1");
				if("SHOW DETAILS".equals(r))
				{
					String bno=request.getParameter("t1");
					try
					{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
						Statement state=con.createStatement();								
						String q1="select * from book where bno='"+bno+"'";
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
								<td>Book Id</td>
								<td>Author</td>
							</tr>
							<tr>
								<td><input type=text value="<%out.write(res1.getString("bno"));%>" name=t2 size=20></td>
								<td><input type=text value="<%out.write(res1.getString("author"));%>" name=t3 size=20></td>
							</tr><tr>
								<td>Subject</td>
								<td>Title</td>
							</tr>
							<tr>
								<td><input type=text value="<%out.write(res1.getString("subject"));%>" name=t4 size=20></td>
								<td><input type=text value="<%out.write(res1.getString("title"));%>" name=t5 size=20></td>
							</tr>
							<tr>
								<td>Quantity</td>
								<td>Price</td>
							</tr>
							<tr>
								<td><input type=text value=<%out.write(res1.getString("qty"));%> name=t6></td>
								<td><input type=text value=<%out.write(res1.getString("price"));%> name=t7></td>
							</tr>
							<tr>
								<td colspan=2><br><a href=login.jsp target=frm><input type=submit value=UPDATE name=b2></a></td>
							</tr>
							<%
						}
					}
					catch(Exception obj)
					{
						out.write(obj.getMessage());
					}
				}
				String r1=request.getParameter("b2");
				if("UPDATE".equals(r1))
				{
					String bno=request.getParameter("t2");
					String author=request.getParameter("t3");
					String subject=request.getParameter("t4");
					String title=request.getParameter("t5");
					int qty=Integer.parseInt(request.getParameter("t6"));
					int price=Integer.parseInt(request.getParameter("t7"));
					String q="update book set subject='"+subject+"', title='"+title+"', author='"+author+"', price="+price+", qty="+qty+" where bno='"+bno+"'";
					
					try
					{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
						Statement state=con.createStatement();	
						state.executeUpdate(q);
						out.write("<h1>Successfully Update</h1>");
					}
					catch(Exception e)
					{
						out.write(e.getMessage());
					}
				}
				%>		
		</form>
		</table>
	</body>
</html>