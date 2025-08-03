<html>
	<head>
		<style>
			div.box{
				width:21%;
				height:100%;
				background-color:wheat;
				float:left;
			}
			input[type=submit]{
				width:250px;
				height:50px;
				background-color:black;
				color:yellow;
				border:none;
				font-family:verdana;
				align:left;
				font-size:20px;
				margin-top:2px;
				margin-left:7px;
				border-radius:10px;
			}
			input[type=submit]:hover{
				background-color:white;
				color:black;
				cursor:pointer;
			}
		</style>
	</head>
	<body bgcolor=gray>
		<div class=box>
			<br>
			<a href=add.jsp target=frm1><input type=submit value="Add Book"></a>
			<a href=update.jsp target=frm1><input type=submit value="Update Book"></a>
			<a href=delete.jsp target=frm1><input type=submit value="Delete Book"></a>
			<a href=search.jsp target=frm1><input type=submit value="Search Book"></a>
			<a href=list.jsp target=frm1><input type=submit value="List Book"></a>
			<a href=record.jsp target=frm1><input type=submit value="Record Sale"></a>
			<a href=changePassword.jsp target=frm1><input type=submit value="Change Password"></a>
		</div>
		<iframe width=78% height=100% name=frm1 style="float:right;background-image:url('pic1.jpg');background-size:100% 100%;border:none;"></iframe>
	</body>
</html>