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
		 input[name="go"]{
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
			<form action="backendAddCinema.do" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="upType" value="cinemaAdd"/>
				<table align="center" border="1" cellspacing="0px" cellpadding="5px">
					<tr>
						<td>影院名称</td>
						<td><input type="text" name="name"/></td>
					</tr>
					<tr>
						<td>影院地址</td>
						<td><input type="text" name="address"/></td>
					</tr>
					<tr>
						<td>影院美照</td>
						<td><input type="file" name="imgurl"/></td>
					</tr>
					<tr>
						<td>联系影院</td>
						<td><input type="text" name="tell"/></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;"><input name="go" type="submit" value="上线影院"/></td>
					</tr>
				</table>
			</form>
		<hr>
	</body>
</html>
