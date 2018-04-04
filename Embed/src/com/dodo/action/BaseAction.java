package com.dodo.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.dodo.util.DataGrid;
import com.dodo.util.Page;

/**
 *  编写存放一些Action中通用的属性和方法
 * @author Administrator
 *
 */
public class BaseAction {

	protected final static String RESULT = "result";
	
	protected final static String SUCCESS = "success";
	
	protected final static String FALSE = "false";

	protected String path;

	protected Page page;

	protected String ids;

	protected String message;

	public String getMessage() {
		return message;
	}

	public Page getPage() {
		return page;
	}

	public String getPath() {
		return path;
	}

	protected void JSONWrite(Object obj) throws Exception {

		HttpServletResponse response = ServletActionContext.getResponse();

		response.setCharacterEncoding("UTF-8");

		PrintWriter pw = response.getWriter();

		// long 数据库获取的是long型的 在页面展示的时候也是long
		// SerializerFeature.DisableCircularReferenceDetect解除SSH 级联的循环引用
		pw.println(JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd",
				SerializerFeature.DisableCircularReferenceDetect));
		// pw.println(JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd"));
		pw.flush();
		pw.close();
	}

	protected void JSONWrite(String str) throws Exception {

		HttpServletResponse response = ServletActionContext.getResponse();

		response.setCharacterEncoding("UTF-8");

		PrintWriter pw = response.getWriter();

		pw.println(str);

		pw.flush();
		pw.close();
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public void setPage(Page page) {
		this.page = page;
	}
}
