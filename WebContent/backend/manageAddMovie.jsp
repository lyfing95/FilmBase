<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<style type="text/css">
			h1{
				text-align: center;
			}
			.go{
			width:75px;
		   height:30px;
		   background-color:#4388F0;
		   color:white;
		   border-radius:5px;
			}
			input[id="go"]{
		   width:75px;
		   height:30px;
		   background-color:#4388F0;
		   color:white;
		   border-radius:5px;
         }
		</style>
		<script type="text/javascript">
		 //图片回显
    function changImg(e){  
    	for (var i = 0; i < e.target.files.length; i++) {  
            var file = e.target.files.item(i);  
            if (!(/^image\/.*$/i.test(file.type))) {  
                continue; //不是图片 就跳出这一次循环  
            }  
            //实例化FileReader API  
            var freader = new FileReader();  
            freader.readAsDataURL(file);  
             freader.onload = function(e) {  
            	$('#myhead').attr("src",e.target.result); 
             };
        }
    }
		 </script>
	</head>
	<body>
		<h1>添加影片</h1>
		<hr>
			<form action="backendAddMovie.do" method="POST" enctype="multipart/form-data">
			   <input type="hidden" name="upType" value="movieAdd"/>
				<table align="center" border="1" cellspacing="0px" cellpadding="5px">
					<tr>
						<td>影片名称</td>
						<td><input type="text" name="name"/></td>
					</tr>
					<tr>
						<td>影片时长</td>
						<td><input type="text" name="duration"/></td>
					</tr>
					<tr>
						<td>影片单价</td>
						<td><input type="text" name="price"/></td>
					</tr>
					<!-- <tr>
						<td>电影种类</td>
						<td><input type="text" name="cname"/></td>
					</tr> 
					<tr>
						<td>库存数量</td>
						<td><input type="text" name="pnum"/></td>
					</tr>-->
					<tr>
						<td>电影海报</td>
						<td><input type="file" name="imgurl"/></td>
					</tr>
					<tr>
						<td>影片简介</td>
						<td>
							<textarea rows="5" cols="30" name="contents"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;"><input id="go" type="submit" value="上传影库"/></td>
					</tr>
				</table>
			</form>
		<hr>
	</body>
</html>
