package com.dodo.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.dodo.dao.UserDao;
import com.dodo.entity.TbUser;

public class LoginServiceImp implements LoginService {

	private UserDao<TbUser> userDao;
//	private BaseDao<> baseDao;

	
	public void setUserDao(UserDao<TbUser> userDao) {
		this.userDao = userDao;
	}

	@Override
	public String findUser(TbUser tbUser) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		if(null==tbUser){
			return "relogin";
		}
		if (null!= tbUser.getUsername()  && !"".equals(tbUser.getUsername()))
			map.put("username", tbUser.getUsername());
		if (null!= tbUser.getPassword()  && !"".equals(tbUser.getPassword()))
			map.put("password", tbUser.getPassword());
		// 当用户数量=1的时候 用户存在
		//System.out.println(tbUser.getUsername()+tbUser.getPassword());
		String hql = "select id from TbUser t where t.username =:username and t.password =:password";
		List list=userDao.findList(hql,map);
		if(list.size()<1)
		{
			return null;
		}
		return list.get(0).toString();
	}
	public String addHost() throws Exception{
//		TbUser tbUser= new TbUser();
//		tbUser.setUsername("user1");
//		tbUser.setCreatetime(new Timestamp(System.currentTimeMillis()));
//		tbUser.setPassword("111");
//		System.out.println(tbUser.toString());
//		userDao.save(tbUser);
		//SystemService.addmanager(tbUser);
		
		
		return null;	
	}
	
}
