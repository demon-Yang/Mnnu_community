package com.yxd.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class HtmlIOUtil {
	/**
	 * 写文件
	 * String字符串写到html文件中
	 * */
	public static String write(String ncontent,String path,String name){
		
		File filePath = new File(path);
		if(!filePath.exists())
			filePath.mkdirs();
		DataOutputStream out = null;
		try {
			File file = new File(path,name);
			if(!file.exists())
				file.createNewFile();
			out = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(file)));
			out.writeUTF(ncontent);
			out.close();
			return "上传成功";
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(out != null)
					out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "上传失败";
	}
	/**
	 * 读文件
	 * html文件读成String
	 * */
	public static String read(String path) {
		File file = new File(path);
		if(!file.exists()) 
			return "该文件不存在";
		DataInputStream in = null;
		try {
			in = new DataInputStream(new BufferedInputStream(new FileInputStream(file)));
			String ncontent = in.readUTF();
			in.close();
			return ncontent;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(in != null)
					in.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "读取失败";
	}
	/**
	 * 删除文件
	 * */
	public static String delete(String path) {
		File file = new File(path);
		if(!file.exists()) 
			return "该文件不存在";
		file.delete();
		return "删除成功";
	}
}
