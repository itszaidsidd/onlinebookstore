<html>
	<head>
		<style>
			body{
				
				background-image: url("lib7.jpg");
				background-size:100% 100%;
				//filter:blur(5px);
				
			}
			div .logo{
				padding:20px;
				float:left;
				width:25%;
				margin-left:50px;
				font-size:28px;
				font-family:arial;
				color:white;
			}
			ul{
				list-style:none;
				float:right;
				display:flex;
			}
			li{
				font-weight:bold;
				padding:12px 30px;
				font-family:arial;
			}
			li a{
				text-decoration:none;
				color:white;				
			}
			li a:hover{
				background: rgba(0,0,0,0.7);
				border:15px solid rgba(0,0,0,0.7);
				border-radius:10px;
				cursor:pointer;
			}
			.main{
				width:97%;
				height:12%;
				background-color:rgba(0,0,0,0.6);
				padding:22px;
				border-bottom:2px solid white;
			}
		</style>
	</head>
	<body>
	
		<div class=main>
			<div class=logo><b>Online Book Store</b></div>
			<ul>
				<li><a href=index.jsp>HOME</a></li>
				<li><a href=reg.jsp target=frm>REGISTRATION</a></li>
				<li><a href=purchase.jsp target=frm>PURCHASE</a></li>
				<li><a href=download\download.jsp target=frm>DOWNLOAD</a></li>
				<li><a href=list.jsp target=frm>LIST BOOKS</a></li>
				<li><a href=Admin.jsp target=frm>ADMIN</a></li>

			</ul>
		</div>
		<center>
		<iframe width=100% height=80% name=frm style="border:none"></iframe>
	
	</body>
</html>