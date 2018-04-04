package com.dodo.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.dodo.entity.TbUser;
import com.dodo.service.SystemService;
import com.dodo.util.Page;

public class SystemAction extends BaseAction {

	private TbUser tbUser;

	public void setTbUser(TbUser tbUser) {
		this.tbUser = tbUser;
	}

	public TbUser getTbUser() {
		return tbUser;
	}

	private SystemService systemService;

	public void setSystemService(SystemService systemService) {
		this.systemService = systemService;
	}

	/**
	 * 获取管理员详细信息
	 * @throws Exception
	 */
	public void manager() throws Exception {

		if (page == null) {
			page = new Page();
		}
		JSONWrite(systemService.findDataGrid(page));

	}

	/**
	 * 添加管理员
	 * @throws Exception
	 */
	public void addmanager() throws Exception {

		boolean fals = false;
		if (tbUser != null) {
			fals = systemService.addmanager(tbUser);
		}
		JSONWrite(fals);

	}

	/**
	 * 删除用户
	 * @throws Exception
	 */
	public void remove() throws Exception {
		int count = 0;
		if (ids != null) {
			count = systemService.removeManager(ids);
		}
		message = "删除了" + count + "条数据";
		JSONWrite(message);
	}

	/**
	 * 获取修改密码的用户
	 * @throws Exception
	 */
	public void getManager() throws Exception {
		TbUser user = null;
		if (tbUser.getId() != null) {
			user = systemService.getManager(tbUser.getId());
		}
		JSONWrite(user);
	}

	/**
	 * 修改管理员密码
	 * @throws Exception
	 */
	public void updateUser() throws Exception {
		boolean fals = false;
		if (tbUser != null) {
			fals = systemService.updatemanager(tbUser);
		}
		JSONWrite(fals);
	}
	
	/**
	 * 检查用户名是否重复
	 * @throws Exception
	 */
	public void checkUsername()throws Exception{
		boolean fals = true;
		if (tbUser != null) {
			fals = systemService.checkUsername(tbUser);
		}
		JSONWrite(fals);
	}
	public void checkUser()throws Exception{
		boolean fals = true;
		if (tbUser != null) {
//			System.out.println("密码一"+systemService.getManager(tbUser.getId()).getPassword());
//			System.out.println("密码二"+tbUser.getPassword());
			fals = systemService.getManager(tbUser.getId()).getPassword().equals(tbUser.getPassword());
//			System.out.println(fals);
		}
		JSONWrite(fals);
	}
	
	
	/**
	 * 安全退出
	 * @return
	 * @throws Exception
	 */
	public String loginout()throws Exception{
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.invalidate();
		return "out";
	}
//	public void hello() throws Exception{
//		HttpSession session = ServletActionContext.getRequest().getSession();
//		session.invalidate();
//	}
	public void Mytest()throws Exception{
		boolean fals = false;
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(null==session.getAttribute("userid")){
			fals=true;
		}
		JSONWrite(fals);
	}

}
