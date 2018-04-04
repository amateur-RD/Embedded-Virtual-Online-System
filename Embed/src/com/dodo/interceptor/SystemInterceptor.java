package com.dodo.interceptor;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class SystemInterceptor implements Interceptor {

	
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	
	public void init() {
		// TODO Auto-generated method stub
		
	}

	
	public String intercept(ActionInvocation invocation) throws Exception {
		System.out.println("SystemInterceptor"+ServletActionContext.getRequest().getRequestURI());
		return invocation.invoke();
	}

}
