package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class helper {
		
	public static boolean deleteFile(String path) {
		boolean  f = false;
			
		try {
			File file = new File(path);
			f = file.delete();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public static boolean saveFile(InputStream ips , String path) {
		boolean f = false;
		try {
		byte[] b = new byte[ips.available()];
		ips.read(b);
		FileOutputStream fos = new FileOutputStream(path);
		fos.write(b);
		fos.flush();
		fos.close();
		f = true;
		}catch(Exception e) {
			System.out.println("hiiiii");
			e.printStackTrace();
		}
		return f;
	}
}