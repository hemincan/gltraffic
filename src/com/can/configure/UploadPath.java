package com.can.configure;

public class UploadPath {
	public static String getuploadpath(){
		//tomcat 的conf中的server.xml 配置了访问此文件的方式，为/upload/
		return "F:/gltrafficfile";
		
	}
}
