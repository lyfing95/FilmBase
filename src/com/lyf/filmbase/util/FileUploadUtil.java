package com.lyf.filmbase.util;

    import java.io.File;
	import java.io.FileOutputStream;
	import java.io.IOException;
	import java.io.InputStream;
	import java.util.HashMap;
	import java.util.List;
	import java.util.Map;
	import java.util.UUID;

	import javax.servlet.ServletContext;
	import javax.servlet.ServletException;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;

	import org.apache.commons.fileupload.FileItem;
	import org.apache.commons.fileupload.FileUploadException;
	import org.apache.commons.fileupload.disk.DiskFileItemFactory;
	import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.lyf.filmbase.entity.Cinema;
import com.lyf.filmbase.entity.Movie;
import com.lyf.filmbase.entity.User;


	public class FileUploadUtil extends HttpServlet {

		public  static  <T> T fileUpload(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			// 获取ServletContext对象
			ServletContext sc=req.getServletContext();
			/*String encode=sc.getInitParameter("encode");*/
			String encode="UTF-8";
			// 声明临时文件夹和上传文件夹的相对路径
			String tempPath="/WEB-INF/temp";
			String uploadPath="/WEB-INF/upload";
			
			// 声明一个用于保存普通表单项数据的map集合
			Map<String, String> pMap=new HashMap<String, String>();
			// 声明一个变量，保存商品图片的实际url
			String imgurl=null;
			// 1.接收请求参数
			// 2.表单验证（略）
			// 借助commons-fileupload.jar
			
			
			DiskFileItemFactory factory=new DiskFileItemFactory(1024*1024,new File(sc.getRealPath(tempPath)));
			ServletFileUpload fileUpload=new ServletFileUpload(factory);
			if(!fileUpload.isMultipartContent(req)){
				throw new RuntimeException("请使用正确的文件上传表单");
			}
			// 设置单个文件的大小
			fileUpload.setFileSizeMax(1024*1024);//10KB
			// 设置一次上传的文件的总大小
			fileUpload.setSizeMax(1024*1024);//1mb
			
			// 解决上传文件名的乱码问题
			fileUpload.setHeaderEncoding(encode);
			try {
				// 解析请求
				List<FileItem> list=fileUpload.parseRequest(req);
				if(list!=null && list.size() >0){
					for(FileItem fileItem:list){
						if(fileItem.isFormField()){
							// 普通表单项
							String name=fileItem.getFieldName();
							String value=fileItem.getString(encode);
							//System.out.println(name+"~~~"+value);
							//将普通表单项数据添加到pMap集合中
							pMap.put(name, value);
						}else{
							// 3.将上传的图片保存到对应位置
							// 文件上传项
							String fileName=fileItem.getName();
							
							//ie bug
							if(fileName.contains("\\")){
								fileName=fileName.substring(fileName.lastIndexOf("\\")+1);
							}
							
							//文件名重复问题
							fileName=UUID.randomUUID().toString()+"_"+fileName;
							
							//文件路径问题
							String hexStr=Integer.toHexString(fileName.hashCode());
							//补足8位
							while(hexStr.length()<8){
								hexStr="0"+hexStr;
							}
							// 拆分成路径
							String midPath="/";
							for(int i=0;i<hexStr.length();i++){
								midPath+=hexStr.charAt(i)+"/";
							}
							
							// /WEB-INF/upload/a/b/c/d/1/2/3/4/1231231.jpg
							imgurl=uploadPath+midPath+fileName;
							// 生成目录
							// d:/web/workspace/easymall/webroot/....
							uploadPath=sc.getRealPath(uploadPath+midPath);
							new File(uploadPath).mkdirs();
							
							//将文件保存到目标目录
							InputStream is=fileItem.getInputStream();
							FileOutputStream fos=null;
							try {
								fos=new FileOutputStream(uploadPath+"/"+fileName);
								byte[] array=new byte[1024];
								int len=is.read(array);
								while(len!=-1){
									fos.write(array, 0, len);
									len=is.read(array);
								}
							} catch (Exception e) {
								e.printStackTrace();
								throw new RuntimeException("图片上传失败");
							}finally{
								is.close();
								fos.close();
								//删除临时文件
								fileItem.delete();
							}
						}
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
			
			//用户信息更新文件上传
			if(pMap.get("upType").equals("userUpdate")){
				// 创建一个JavaBean，封装本次表单提交的商品信息
				User updateInfo = new User();
				// 从pMap中获取普通表单项数据，添加到prod对象中
				updateInfo.setId(pMap.get("id"));
				updateInfo.setUsername(pMap.get("username"));
				updateInfo.setNickname(pMap.get("nickname"));
				updateInfo.setGender(pMap.get("gender"));
				// 保存商品图片的url 相对于当前应用的路径
				updateInfo.setProfilehead(imgurl);     
				updateInfo.setAge(pMap.get("age"));
				updateInfo.setEmail(pMap.get("email"));
				updateInfo.setTell(pMap.get("tell"));
				updateInfo.setProfile(pMap.get("profile"));
				 return (T) updateInfo;
				}
			//后台添加影片文件上传
			if(pMap.get("upType").equals("movieAdd")){
			// 创建一个JavaBean，封装本次表单提交的商品信息
			Movie addMovie = new Movie();
			// 从pMap中获取普通表单项数据，添加到prod对象中
			addMovie.setId(DateUtil.getId());
			addMovie.setName(pMap.get("name"));
			addMovie.setPrice(Double.parseDouble(pMap.get("price")));
			addMovie.setDuration(Integer.valueOf(pMap.get("duration").trim()));
			// 保存商品图片的url 相对于当前应用的路径
			addMovie.setImgurl(imgurl);     
			addMovie.setContents(pMap.get("contents"));
			return  (T) addMovie;
			}
		//后台上线影院文件上传
		 if(pMap.get("upType").equals("cinemaAdd")){
			Cinema addCinema= new Cinema();
			// 从pMap中获取普通表单项数据，添加到prod对象中
			addCinema.setId(DateUtil.getId());
			addCinema.setName(pMap.get("name"));
			addCinema.setAddress(pMap.get("address"));
			addCinema.setImgurl(imgurl);
			addCinema.setTell(pMap.get("tell"));
			  return (T) addCinema;
		 }
			
		//后台更新影片文件上传
		if(pMap.get("upType").equals("movieUpdate")){
		Movie updateMovie = new Movie();
		// 从pMap中获取普通表单项数据，添加到prod对象中
		updateMovie.setId(pMap.get("id"));
		updateMovie.setName(pMap.get("name"));
		updateMovie.setPrice(Double.parseDouble(pMap.get("price")));
		updateMovie.setDuration(Integer.valueOf(pMap.get("duration").trim()));
		// 保存商品图片的url 相对于当前应用的路径
		updateMovie.setImgurl(imgurl);     
		updateMovie.setContents(pMap.get("contents"));
		return  (T) updateMovie;
		}
		//后台更新影院文件上传
		 if(pMap.get("upType").equals("cinemaUpdate")){
				Cinema updateCinema= new Cinema();
				// 从pMap中获取普通表单项数据，添加到prod对象中
				updateCinema.setId(pMap.get("id"));
				updateCinema.setName(pMap.get("name"));
				updateCinema.setAddress(pMap.get("address"));
				updateCinema.setImgurl(imgurl);
				updateCinema.setTell(pMap.get("tell"));
				  return (T) updateCinema;
			 }
		 
		return (T)pMap;
	}
	}	

		