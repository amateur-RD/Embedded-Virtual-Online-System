package com.dodo.service;

import java.util.ArrayList;
import java.util.List;

import com.dodo.dao.DemoboardDao;
import com.dodo.entity.TbDemoboard;
import com.dodo.entity.TbMonitor;

public class DemoboardServiceImp implements DemoboardService {

	private DemoboardDao<TbDemoboard> demoboardDao;
	public void setDemoboardDao(DemoboardDao<TbDemoboard> demoboardDao) {
		this.demoboardDao = demoboardDao;
	}
	@Override
	public synchronized List<String> getDemoboard() throws Exception {
		List tb=new ArrayList<String>();
		String hql = "select id from TbDemoboard where flag = 'N'";
		List l=demoboardDao.findList(hql);
		if(l.size()<1){
			tb.add("null");
		}else{
			int i=new java.util.Random().nextInt(l.size());
			//	System.out.println(l.get(i));
			hql="update TbDemoboard set flag ='Y' where id="+l.get(i);
			demoboardDao.updateMonitor(hql);
			tb.add(l.get(i));
		}
		return tb;
	}
	@Override
	public boolean updateexp(TbDemoboard tbDemoboard) throws Exception {
		demoboardDao.update(tbDemoboard);
		return true;
	}
	@Override
	public boolean endexp(String id) throws Exception {
		String hql="update TbDemoboard set flag ='N' where id="+id;
		demoboardDao.updateDemoboard(hql);
		return true;
	}
	@Override
	public TbDemoboard getBT(String id) throws Exception{
		TbDemoboard t=demoboardDao.findByID(TbDemoboard.class, id);
		return t;
	}
	
}
