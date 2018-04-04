package com.dodo.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class LoginInterceptor implements Interceptor {

	
	public void destroy() {
		// TODO Auto-generated method stub

	}

	
	public void init() {
		// TODO Auto-generated method stub

	}

	
	public String intercept(ActionInvocation invocation) throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = request.getSession();

		String uri = request.getRequestURI();
		System.out.println("LoginInterceptor"+uri);
		uri = uri.substring(uri.lastIndexOf("/") + 1, uri.lastIndexOf(".action"));
		Object user = session.getAttribute("username");
		if (!uri.equals("login")) {
			/*if (user == null) {
				PrintWriter pw = response.getWriter();
				pw.println(JSON.toJSON(false));
				pw.flush();
				pw.close();
				return null;
			}*/

			if (user == null) {
				return null;
			} else {
				return invocation.invoke();
			}
		} else {
			if (user == null) {
				return invocation.invoke();

			} else {
				return "success";
			}
		}
	}

}
