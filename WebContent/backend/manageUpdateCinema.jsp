<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<style type="text/css">
			h1{
				text-align: center;
			}
			input[id="go"]{
		   width:75px;
		   height:30px;
		   background-color:#4388F0;
		   color:white;
		   border-radius:5px;
         }
		</style>
	</head>
	<body>
		<h1>影院更新</h1>
		<hr>${errMsg}
			<form action="backendUpdateCinema.do" method="POST" enctype="multipart/form-data">
			    <input type="hidden" name="upType" value="cinemaUpdate"/>
			    <input type="hidden" name="id" value="${cinema.id }"/>
				<table align="center" border="1" cellspacing="0px" cellpadding="5px">
					
					<tr>
					    <td rowspan="5"><img src="../film/getFileImg.do?imgurl=${cinema.imgurl}" alt="影片图片" width="200" height="300" /></td>
						<td>影院名称</td>
						<td><input type="text" name="name" value="${cinema.name }"/></td>
					</tr>
					<tr>
						<td>影院地址</td>
						<td><input type="text" name="address" value="${cinema.address }"/></td>
					</tr>
					<tr>
						<td>影院美照</td>
						<td><input type="file" name="imgurl" value="${cinema.imgurl }"/></td>
					</tr>
					<tr>
						<td>联系影院</td>
						<td><input type="text" name="tell" value="${cinema.tell }"/></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;"><input id="go" type="submit" value="更新影院"/></td>
					</tr>
				</table>
			</form>
		<hr>
	</body>
</html>
