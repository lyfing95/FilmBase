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
		<h1>影片更新</h1>
		<hr>
		     ${errMsg}
			<form action="backendUpdateMovie.do" method="POST" enctype="multipart/form-data">
			    <input type="hidden" name="upType" value="movieUpdate"/>
			    <input type="hidden" name="id" value="${movie.id }"/>
				<table align="center" border="1" cellspacing="0px" cellpadding="5px">
				    <tr>
					    <td rowspan="6"><img src="../film/getFileImg.do?imgurl=${movie.imgurl}" alt="影片图片" width="200" height="300" /></td>
						<td>影片名称</td>
						<td><input type="text" name="name" value="${movie.name }"/></td>
					</tr>
					<tr>
						<td>影片时长</td>
						<td><input type="text" name="duration" value="${movie.duration }"/></td>
					</tr>
					<tr>
						<td>影片单价</td>
						<td><input type="text" name="price" value="${movie.price }"/></td>
					</tr>
					<tr>
						<td>电影海报</td>
						<td><input type="file" name="imgurl" value="${movie.imgurl }"/></td>
					</tr>
					<tr>
						<td>影片简介</td>
						<td>
							<textarea rows="5" cols="30" name="contents">${movie.contents }</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;"><input id="go" type="submit" value="更新"/></td>
					</tr>
				</table>
			</form>
		<hr>
	</body>
</html>
