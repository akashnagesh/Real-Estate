package com.me.helper;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class AddImages {

	public static String savePhoto(MultipartFile photo) {
		if (null != photo) {
			String hardCoddedPath = "/Users/akashnagesh/Documents/workspace/RealEstate/src/main/webapp/resources/Images/";
			String dataBasePath = "resources/Images/";
			String fileNameWithExt = System.currentTimeMillis() +photo.getOriginalFilename();
			File file = new File(hardCoddedPath + fileNameWithExt);
			try {
				photo.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return dataBasePath+fileNameWithExt;
		}
		else
			return null;
	}

}
