package com.dodo.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dodo.dao.UserDao;
import com.dodo.entity.TbUser;
import com.dodo.util.DataGrid;
import com.dodo.util.Page;

public class SystemServiceImp implements SystemService {

	private UserDao<TbUser> userDao;

	public void setUserDao(UserDao<TbUser> userDao) {
		this.userDao = userDao;
	}

	
	public DataGrid findDataGrid(Page p) throws Exception {
		int page = p.getPage();
		int count = p.getCount();
		String hql = "select count(*) from TbUser";
		int counts = Integer.parseInt(userDao.findUnique(hql).toString());
		hql = "from TbUser";
		List<TbUser> list = userDao.findList(hql, page, count);
		DataGrid dataGrid = new DataGrid();
		dataGrid.setTotal(counts);
		dataGrid.setPages(counts % count == 0 ? counts / count : counts / count + 1);
		dataGrid.setRows(list);
		return dataGrid;

	}

	
	public boolean addmanager(TbUser tbUser) throws Exception {
		String hql = "select count(*) from TbUser where username = :name";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", tbUser.getUsername());
		int count = Integer.parseInt(userDao.findUnique(hql, map).toString());
		if (count == 0) {
			if (tbUser.getUsername() != null && !"".equals(
					tbUser.getUsername() != null && tbUser.getPassword() != null && !"".equals(tbUser.getPassword()))) {
				tbUser.setCreatetime(new Timestamp(System.currentTimeMillis()));
				userDao.save(tbUser);
				return true;
			}
		}
		return false;
	}

	
	public int removeManager(String ids) throws Exception {
		String[] sid = ids.split(",");
		int index = 0;
		for (String id : sid) {
			if (id != null && !"".equals(id.trim())) {
				if (!"8".equals(id)) {
					userDao.delete(new TbUser(id));
					index++;
				}
			}
		}
		return index;
	}

	
	public TbUser getManager(String id) throws Exception {
		return userDao.findByID(TbUser.class, id);
	}

	
	public boolean updatemanager(TbUser tbUser) throws Exception {

		if (tbUser.getPassword() != null && !"".equals(tbUser.getPassword())) {
			TbUser t = userDao.findByID(TbUser.class, tbUser.getId());

			t.setPassword(tbUser.getPassword());
			return true;
		}
		return false;
	}
	
	
	
	public boolean checkUsername(TbUser tbUser) throws Exception {
		
		if(tbUser.getUsername()!=null&&!"".equals(tbUser.getUsername().trim())){
			String hql = "select count(*) from TbUser where username = :name";
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("name", tbUser.getUsername());
			int count = Integer.parseInt(userDao.findUnique(hql,map).toString());
			if(count!=0) return false;
		}
		return true;
	}

}
