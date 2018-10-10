package com.doing.src.action.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.doing.common.util.FileUtils;
import com.doing.common.vo.JsonVo;

@Controller
@RequestMapping("upload")
public class UploadAction {

	/**
	 * 图片上传
	 * 
	 * @param file
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "photo", method = RequestMethod.POST)
	public JsonVo<String> handleRequest(@RequestParam("file") MultipartFile file, HttpServletRequest request)
			throws Exception {
		JsonVo<String> json = new JsonVo<String>();
		/**
		 * 
		 * 上传
		 */
		if (FileUtils.checkPhotoFile(file)) {
			String url = FileUtils.saveFile(file, request);
			json.setT(url);
			json.setSuccess(true);
			json.check();
		} else {
			String errorMessage = "上传的文件只能是jpg,png,gif的图片格式";
			json.setMsg(errorMessage);
			json.setSuccess(false);
		}
		return json;
	}

	/**
	 * 富文本图片上传
	 * 
	 * @param file
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@CrossOrigin(origins = "*", maxAge = 3600)
	@ResponseBody
	@RequestMapping(value = "photoEditor", method = RequestMethod.POST)
	public String photoEditor(@RequestParam("file") MultipartFile file, HttpServletRequest request)
			throws Exception {
		JsonVo<String> jsonVo = new JsonVo<>();
		/**
		 * 
		 * 上传
		 */
		String url="";
		//if (FileUtils.checkPhotoFile(file)) {
		 url = FileUtils.saveFile(file, request);
			//jsonVo.setT(url);
			//jsonVo.setSuccess(true);
			//jsonVo.check();
		//}
		return url;
	}
	
	/**
	 * 信息小程序语音上传
	 * @param file 语音
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@CrossOrigin(origins = "*", maxAge = 3600)
	@ResponseBody
	@RequestMapping("volice")
	public JsonVo<String> file(@RequestParam("file") MultipartFile file, HttpServletRequest request)
			throws Exception {
		JsonVo<String> json = new JsonVo<String>();
		/**
		 * 
		 * 上传
		 */
		//if (FileUtils.checkFile(file)) {
			String url = FileUtils.saveSilk(file, request);
			json.setT(url);
			json.setSuccess(true);
			json.check();
		/*} else {
			String errorMessage = "上传的文件只能是silk的格式";
			json.setMsg(errorMessage);
			json.setSuccess(false);
		}*/
		return json;
	}

}
