package com.dodo.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.dodo.entity.TbDemoboard;
import com.dodo.entity.TbMonitor;
import com.dodo.entity.TbNote;
import com.dodo.service.DemoboardService;
import com.dodo.service.MonitorService;
import com.dodo.service.NoteService;
import com.dodo.util.FileUtil;
import com.dodo.util.PropertiesUtil;
import com.dodo.util.ShellUtil;

/**
 * 开始实验
 * 
 * @author dzy
 * 
 * @date：2017年5月9日 下午11:15:44
 */
public class DoexpAction extends BaseAction {

	private NoteService noteService;
	private MonitorService monitorService;
	private DemoboardService demoboardService;
	private TbNote tbNote;
	private TbMonitor tbMonitor;
	private TbDemoboard tbDemoboard;

	public void setNoteService(NoteService noteService) {
		this.noteService = noteService;
	}

	public void setMonitorService(MonitorService monitorService) {
		this.monitorService = monitorService;
	}
	public void setDemoboardService(DemoboardService demoboardService) {
		this.demoboardService = demoboardService;
	}
	public void setTbNote(TbNote tbNote) {
		this.tbNote = tbNote;
	}

	public TbNote getTbNote() {
		return tbNote;
	}

	public void setTbMonitor(TbMonitor tbMonitor) {
		this.tbMonitor = tbMonitor;
	}

	public TbMonitor getTbMonitor() {
		return tbMonitor;
	}

	public void setTbDemoboard(TbDemoboard tbDemoboard) {
		this.tbDemoboard = tbDemoboard;
	}
	public TbDemoboard getTbDemoboard() {
		return tbDemoboard;
	}
	public String startExp() throws Exception {
		HttpServletRequest req = ServletActionContext.getRequest();
		String userid = null;
		if (null == req.getSession().getAttribute("userid")) {
			return "index";
		}
		userid = req.getSession().getAttribute("userid").toString();
		req.setAttribute("userid", userid);
		// System.out.println("userid"+userid);
	
		
		
		String DOCKERURL = "http://" + req.getServerName() + ":6080/vnc_auto.html?websockify/?token=host"+userid;
//		String DOCKERURL = "http://172.18.137.3:6080/vnc_auto.html?websockify/?token=host4028b8815bed30b3015bed4451fe0001";
		//System.out.println(DOCKERURL);
		String MONITORIP, MONITORID,DEMOBOARDID = null;
		if (null != req.getSession().getAttribute("monitorip")){
			MONITORIP = req.getSession().getAttribute("monitorip").toString();
		}else {
			List<String> l = monitorService.getMonitor();
			if ("null" == l.get(0)) {
				req.setAttribute("message", "摄像头资源不足，请联系管理员或稍等片刻");
				return "error";
			}
			MONITORIP = l.get(0);
			MONITORID = l.get(1);
			req.getSession().setAttribute("monitorip", MONITORIP);
			req.getSession().setAttribute("monitorid", MONITORID);
		}
		
		req.setAttribute("dockerUrl", DOCKERURL);
//		req.setAttribute("dockerUrl", DOCKERURL + userid);
		req.setAttribute("monitorUrl", "http://" + MONITORIP + ":81/monitor2.htm");
		
		if(null!=req.getSession().getAttribute("demoboardid")){
			DEMOBOARDID = req.getSession().getAttribute("demoboardid").toString();
		}else {
			List<String> l = demoboardService.getDemoboard();
			if ("null" == l.get(0)) {
				req.setAttribute("message", "开发板资源不足，请联系管理员或稍等片刻");
				return "error";
			}
			DEMOBOARDID = l.get(0);
			//System.out.println("DEMOBOARDID"+DEMOBOARDID);
			req.getSession().setAttribute("demoboardid",DEMOBOARDID );
		}
		//fUtil.writeLog("host"+userid+": "+"172.17.0.2:5902", p.readProperty("vnctoken"));
		return "startExp";
	}

	public void addnote() throws Exception {
		boolean fals = false;
		if (null != tbNote) {
			fals = noteService.addnote(tbNote);
		}
		JSONWrite(fals);
	}

	public void endExp() throws Exception {
		boolean fals = false;
		PropertiesUtil p = new PropertiesUtil("config.properties");
		HttpSession session = ServletActionContext.getRequest().getSession();
		if (null != session.getAttribute("monitorid")) {
			fals = monitorService.endexp(session.getAttribute("monitorid").toString());
			session.removeAttribute("monitorid");
			session.removeAttribute("monitorip");
		}
		if (null != session.getAttribute("demoboardid")) {
			fals = demoboardService.endexp(session.getAttribute("demoboardid").toString());
			session.removeAttribute("demoboardid");
		}
//		if(null!=session.getAttribute("dockerid")){
//		ShellUtil shUtil = new ShellUtil();
//		shUtil.run(p.readProperty("endshell")+" "+session.getAttribute("dockerid")+" "+session.getAttribute("userid")+" "+p.readProperty("vnctoken"));
//		session.removeAttribute("dockerid");
//		}
		////String s="sed -i '/"+req.getSession().getAttribute("userid")+"/d' "+p.readProperty("vnctoken");
		////System.out.println("s==="+s);
		////shUtil.run("sed -i '/"+req.getSession().getAttribute("userid")+"/d' "+p.readProperty("vnctoken"));
		JSONWrite(fals);
	}
	
	public void getBt() throws Exception{
		HttpSession session = ServletActionContext.getRequest().getSession();
		JSONWrite(demoboardService.getBT(session.getAttribute("demoboardid").toString()));
	}

}
