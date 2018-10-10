package com.doing.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileUtils {
	
	public static String getType(String name) {
		if (StringUtils.isEmpty(name)) {
			return null;
		}
		return StringUtils.substring(name,
				StringUtils.lastIndexOf(name, ".") + 1);
	}
	
	/**
	 * 检查文件是否是图片类型
	 * @param file
	 * @return
	 */
	public static boolean checkPhotoFile(MultipartFile file) {
		//System.out.println(file.getContentType());
		if (file.isEmpty()) {
			return false;
			
		}
		if (file.getContentType().equals("image/jpg")
				|| file.getContentType().equals("image/png")
				|| file.getContentType().equals("image/jpeg")
				|| file.getContentType().equals("image/gif")
				|| file.getContentType().equals("application/octet-stream")) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 检查文件
	 * @param file
	 * @return
	 */
	public static boolean checkFile(MultipartFile file) {
		if (file.isEmpty()) {
			return false;
		}
		System.out.println(file.getContentType());
		if (file.getContentType().equals("application/pdf")
				|| file.getContentType().equals("application/octet-stream")
				|| file.getContentType().equals("application/msword")
				|| file.getContentType().equals("application/x-ppt")
				|| file.getContentType().equals("text/plain")
				|| file.getContentType().equals("silk")) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * 检查视频文件
	 * @param file
	 * @return
	 */
	public static boolean checkFileVideo(MultipartFile file) {
		if (file.isEmpty()) {
			return false;
		}else {
			System.out.println(file.getContentType());
			return true;
		}
		
		
		/*if (file.getContentType().equals("application/pdf")
				|| file.getContentType().equals("application/octet-stream")
				|| file.getContentType().equals("application/msword")
				|| file.getContentType().equals("application/x-ppt")
				|| file.getContentType().equals("text/plain")) {
			return true;
		} else {
			return false;
		}*/
	}
	
	/**
	 * 保存文件
	 * @param file
	 * @param request
	 * @return
	 * @throws IOException
	 */
	public static String saveFile(MultipartFile file, HttpServletRequest request) throws IOException {

		String md5 = DigestUtils.md5Hex(file.getBytes());// 获取文件md5
		String oldName = file.getOriginalFilename();
		String type = FileUtils.getType(oldName);
		Calendar cal = Calendar.getInstance();
		int second = cal.get(Calendar.SECOND);//秒
		String nameName = md5 + second + "." + type;	
		String rootPath = request.getSession().getServletContext().getRealPath("/");// 获取服务器项目
		String relativePath = "upload" + "/" + nameName;// 现在的相对地址
		//System.out.println("路径"+relativePath);
		String path = rootPath + "/" + relativePath;// 存放在磁盘的地址

		File source = new File(path.toString());// 生成文件对象

		file.transferTo(source);// 把文件写入磁盘

		return relativePath;// 返回相对地址
	}
	
	/**
	 * 保存文件
	 * @param file
	 * @param request
	 * @return
	 * @throws IOException
	 */
	public static String saveFile1(MultipartFile file, HttpServletRequest request) throws IOException {

		String md5 = DigestUtils.md5Hex(file.getBytes());// 获取文件md5
		String oldName = file.getOriginalFilename();
		String type = FileUtils.getType(oldName);
		String nameName = md5 + "." + "jpg";
        
		String rootPath = request.getSession().getServletContext().getRealPath("/");// 获取服务器项目
        //System.out.println(nameName);
		String relativePath = "upload" + "/" + nameName;// 现在的相对地址
		System.out.println("路径"+relativePath);
		String path = rootPath + "/" + relativePath;// 存放在磁盘的地址

		File source = new File(path.toString());// 生成文件对象

		file.transferTo(source);// 把文件写入磁盘

		return relativePath;// 返回相对地址
	}
	
	
//	/*
//	 * 压缩文件
//	 * */
//	 public void resizeFix(int w, int h) throws IOException { 
//		    if (width / height > w / h) { 
//		      resizeByWidth(w); 
//		    } else { 
//		      resizeByHeight(h); 
//		    } 
//	} 
//	
////	 /** 
//	   * 以宽度为基准，等比例放缩图片 
//	   * @param w int 新宽度 
//	   */
//	  public void resizeByWidth(int w) throws IOException { 
//	    int h = (int) (height * w / width); 
//	    resize(w, h); 
//	  } 
//	  /** 
//	   * 以高度为基准，等比例缩放图片 
//	   * @param h int 新高度 
//	   */
//	  public void resizeByHeight(int h) throws IOException { 
//	    int w = (int) (width * h / height); 
//	    resize(w, h); 
//	  } 
	
	
	/**
	 * 保存文件
	 * @param file
	 * @param request
	 * @return
	 * @throws IOException
	 */
	public static String saveWordFile(MultipartFile file, HttpServletRequest request) throws IOException {

		//String md5 = DigestUtils.md5Hex(file.getBytes());// 获取文件md5
		String oldName = file.getOriginalFilename();
		String type = FileUtils.getType(oldName);
		//Calendar cal = Calendar.getInstance();
		//int second = cal.get(Calendar.SECOND);//秒
		String nameName = oldName + "." + type;	
		String rootPath = request.getSession().getServletContext()
				.getRealPath("/");// 获取服务器项目
		 System.out.println(rootPath);
		String relativePath = "upload" + "/" + oldName;// 现在的相对地址
		//System.out.println("路径"+relativePath);
		String path = rootPath + "/" + relativePath;// 存放在磁盘的地址

		File source = new File(path.toString());// 生成文件对象

		file.transferTo(source);// 把文件写入磁盘

		return relativePath;// 返回相对地址
	}
	
	/**
	 * 保存微信小程序语音文件
	 * @param file
	 * @param request
	 * @return
	 * @throws IOException
	 */
	public static String saveSilk(MultipartFile file, HttpServletRequest request) throws IOException {

		//String md5 = DigestUtils.md5Hex(file.getBytes());// 获取文件md5
		String oldName = file.getOriginalFilename();
		String type = FileUtils.getType(oldName);
		//Calendar cal = Calendar.getInstance();
		//int second = cal.get(Calendar.SECOND);//秒
		String nameName = oldName + "." + type;	
		String rootPath = request.getSession().getServletContext()
				.getRealPath("/");// 获取服务器项目
		 System.out.println(rootPath);
		String relativePath = "voice" + "/" + oldName;// 现在的相对地址
		//System.out.println("路径"+relativePath);
		String path = rootPath + "/" + relativePath;// 存放在磁盘的地址

		File source = new File(path.toString());// 生成文件对象

		file.transferTo(source);// 把文件写入磁盘

		return relativePath;// 返回相对地址
	}
	
	/**
	 * 检查文件
	 * @param file
	 * @return
	 */
	public static boolean checkWordFile(MultipartFile file) {
		if (file.isEmpty()) {
			return false;
		}
		System.out.println(file.getContentType());
		if (file.getContentType().equals("application/pdf")
				|| file.getContentType().equals("application/octet-stream")
				|| file.getContentType().equals("application/zip")
				|| file.getContentType().equals("application/x-rar")
				|| file.getContentType().equals("application/msword")
				|| file.getContentType().equals("application/application/vnd.ms-powerpoint")
				|| file.getContentType().equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document")
				|| file.getContentType().equals("text/plain")) {
			return true;
		} else {
			return false;
		}
	}
	
	
	public static String saveUrlFile(String urlString,  HttpServletRequest request) throws IOException {
		String filename = DigestUtils.md5Hex(urlString);
		filename=filename+".jpg";
		String rootPath = request.getSession().getServletContext()
				.getRealPath("/");// 获取服务器项目
		 System.out.println(rootPath);
		 String relativePath = "upload" + "/" + filename;// 现在的相对地址
			//System.out.println("路径"+relativePath);
			String path = rootPath + "/" + relativePath;// 存放在磁盘的地址
			String path2 = rootPath + "/" + "upload";

		   // 构造URL
	    URL url = new URL(urlString);
	    // 打开连接
	    URLConnection con = url.openConnection();
	    //设置请求超时为5s
	    con.setConnectTimeout(5*1000);
	    // 输入流
	    InputStream is = con.getInputStream();
	
	    // 1K的数据缓冲
	    byte[] bs = new byte[1024];
	    // 读取到的数据长度
	    int len;
	    // 输出的文件流
	//   File sf=new File(path);
	//   if(!sf.exists()){
	////	   sf.mkdirs();
	//   }
	   OutputStream os = new FileOutputStream(path2+"\\"+filename);
	    // 开始读取
	    while ((len = is.read(bs)) != -1) {
	      os.write(bs, 0, len);
	    }
	    // 完毕，关闭所有链接
	    os.close();
	    is.close();

		return relativePath;// 返回相对地址
	}

}
