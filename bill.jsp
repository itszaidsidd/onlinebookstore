<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<html>
<body>
	<div style="font-family:calibri;background-color:">
	<table cellpadding=10>
	
			<tr>
				<td colspan=2 style="font-family: cursive; font-size:2.5em">Online Book Store</td>
				<td colspan=2 style="font-family:calibri; font-size:2.5em; font-weight:bold;text-align:right">INVOICE<br><span style="font-size:20px"><script> var d=new Date(); document.write(d.toDateString());</script></span></td>
			
			<tr>
				<td colspan=4></td>
			</tr>
	<% 
	String rname,rpass,rbno,remail;
	String q5="select * from bill";
	String radd,rpno,r_rno;
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
		Statement state=con.createStatement();
		ResultSet res3=state.executeQuery(q5);
		if(res3.next())
		{
			remail=res3.getString("email");
			rpass=res3.getString("password");
			rbno=res3.getString("bno");
			
			
			q5="select * from reg where email='"+remail+"' and pass='"+rpass+"'";
			ResultSet res=state.executeQuery(q5);
			if(res.next())
			{ 
				r_rno=res.getString("rno");
				rname=res.getString("name");
				radd=res.getString("address");
				rpno=res.getString("pno");
				remail=res.getString("email");
				q5="select * from book where bno='"+rbno+"'";
				ResultSet res2=state.executeQuery(q5);
				if(res2.next())
				{
					Date d =new Date();
				q5="insert into record values("+r_rno+",'"+rname+"','"+remail+"','"+rpno+"','"+radd+"','"+res2.getString("bno")+"','"+res2.getString("title")+"','"+res2.getString("author")+"',"+res2.getString("price")+",'"+d+"')";
					state.executeUpdate(q5);
				}
			}
		}
	}			
	catch(Exception obj)
	{
		out.write(obj.getMessage());
	}
		%>
		
		<% 
	String name,pass,bno,email;
	String q="select * from bill";
	String q1;
	String rno,add,pno,prno="101";
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
		Statement state=con.createStatement();
		ResultSet res3=state.executeQuery(q);
		if(res3.next())
		{
		email=res3.getString("email");
		pass=res3.getString("password");
		bno=res3.getString("bno");
		
		
		q="select * from reg where email='"+email+"' and pass='"+pass+"'";
		ResultSet res=state.executeQuery(q);
		
		
			
	
		%>
			<tr>
				<td colspan=2 style="font-family:calibri; font-size:1.5em; font-weight:bold">Customer Id : 
		<% 
		
			if(res.next())
			{
			
		
				out.write(res.getString("rno"));
			}
		%></td>
		<td colspan=2 style="font-family:calibri; font-size:1.2em;text-align:right">To<br><b> 
	<%
		q="select * from reg where email='"+email+"' and pass='"+pass+"'";
		ResultSet res5=state.executeQuery(q);
		if(res5.next())
		{ 
			name=res5.getString("name");
			add=res5.getString("address");
			pno=res5.getString("pno");
			
		
	out.write(name);%> </b><br> <%out.write(add);%><br><%out.write(pno); 
		}%></td>
			</tr>
			<tr style="font-weight:bold; font-size:1.2em; text-align:center">
				<td><hr>S.NO.<hr></td>
				<td><hr>DESCRIPTION<hr></td>
				<td><hr>QTY<hr></td>
				<td><hr>PRICE<hr></td>
			</tr>
			<tr style="text-align:center">
				<td>01</td>
				<td style="text-align:justify">
				<%
						q1="select * from book where bno='"+bno+"'";
						ResultSet res1=state.executeQuery(q1);
						if(res1.next())
						{
							out.write("<b>"+res1.getString("title")+"</b><br>"+res1.getString("title")+" Book Subject of "+res1.getString("subject")+" written by "+res1.getString("author"));
							
						}
						
				%>
				</td>
				<td>01</td>
				<td>
				<%
					q1="select * from book where bno='"+bno+"'";
						ResultSet res4=state.executeQuery(q1);
						if(res4.next())
						{
							out.write(res4.getString("price"));
						}
						
				%></td>
			</tr>
		<%
			
			String q2="delete from bill";
			state.executeUpdate(q2);
		}
		
	}
	catch(Exception obj)
	{
		out.write(obj.getMessage());
	}
	%>
	</table>
	<hr>
	<p style="font-family:cambria;font-size:20px;text-align:center">Thanks for Purchasing, Visit again</p>
	<form>
	<center><input type=SUBMIT value=Print onclick="window.print()">
	</form>
	</div>
	
    
</body>
</html>