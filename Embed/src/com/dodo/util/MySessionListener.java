package com.dodo.util;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.dodo.service.DemoboardService;
import com.dodo.service.MonitorService;

public class MySessionListener implements HttpSessionListener {
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		arg0.getSession().setMaxInactiveInterval(30*60);

	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		System.out.println("sessiondestory"+arg0.getSession().getId());
		if(null!=arg0.getSession().getAttribute("monitorid")){
			MonitorService ms = (MonitorService) this.getObjectFromApplication(arg0
					.getSession().getServletContext(), "monitorService");
			try {
				ms.endexp(arg0.getSession().getAttribute("monitorid").toString());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(null!=arg0.getSession().getAttribute("demoboardid")){
			DemoboardService ds = (DemoboardService) this.getObjectFromApplication(arg0
					.getSession().getServletContext(), "demoboardService");
			try {
				System.out.println("！！！！！！！！！！！！！");
				ds.endexp(arg0.getSession().getAttribute("demoboardid").toString());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(null!=arg0.getSession().getAttribute("dockerid")){
		PropertiesUtil p = new PropertiesUtil("config.properties");
		ShellUtil shUtil = new ShellUtil();
		shUtil.run(p.readProperty("endshell")+" "+arg0.getSession().getAttribute("dockerid")+" "+arg0.getSession().getAttribute("userid")+" "+p.readProperty("vnctoken"));
		//shUtil.run(p.readProperty("endshell"));
		//shUtil.run("sed -i '/"+arg0.getSession().getAttribute("userid")+"/d' "+p.readProperty("vnctoken"));
		}
	}

	private Object getObjectFromApplication(ServletContext servletContext,
			String beanName) {
		// 通过WebApplicationContextUtils 得到Spring容器的实例。
		ApplicationContext application = WebApplicationContextUtils
				.getWebApplicationContext(servletContext);
		return application.getBean(beanName);
	}
}
