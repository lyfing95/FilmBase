package com.lyf.filmbase.util;





import java.io.FileInputStream;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 public class ImgUtil  extends HttpServlet {

	private static final ServletOutputStream sos = null;

	public static ServletOutputStream getFileImg(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//1. 获取请求参数-图片的url
		String imgurl=req.getParameter("imgurl");
		//2. 表单验证（略）
		//3. 执行逻辑-通过输入流读取图片的内容，通过输出流写给用户
		FileInputStream fis=null;
		
		try {
			// 根据图片url获取图片的真实路径
			
			String realPath=req.getServletContext().getRealPath(imgurl);
			// 需要的路径是图片在服务器上的绝对路径
			fis=new FileInputStream(realPath);
			// 获取向应答实体内容中输入内容的输出流
			ServletOutputStream sos=resp.getOutputStream();
			byte[] array=new byte[1024];
			// 从服务器本地读取图片的一部分内容
			int len=fis.read(array);
			while(len!=-1){
				//向应答实体内容中输出图片的内容
				sos.write(array, 0, len);
				len=fis.read(array);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(fis!=null){
				fis.close();
			}
		}
		return sos;
	}
   
}

