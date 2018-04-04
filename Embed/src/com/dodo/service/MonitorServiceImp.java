package com.dodo.service;

import java.util.ArrayList;
import java.util.List;

import com.dodo.dao.MonitorDao;
import com.dodo.entity.TbMonitor;

public class MonitorServiceImp implements MonitorService {
private MonitorDao<TbMonitor> monitorDao;
	public void setMonitorDao(MonitorDao<TbMonitor> monitorDao) {
		this.monitorDao = monitorDao;
	}
	@Override
	public synchronized List<String> getMonitor() throws Exception {
		List tb=new ArrayList<String>();
		String hql = "select id from TbMonitor where flag = 'N'";
		List l=monitorDao.findList(hql);
		if(l.size()<1){
			tb.add("null");
		}else{
			int i=new java.util.Random().nextInt(l.size());
			//	System.out.println(l.get(i));
			hql="update TbMonitor set flag ='Y' where id="+l.get(i);
			monitorDao.updateMonitor(hql);
			hql="select ip from TbMonitor where id="+l.get(i);
			String ip=monitorDao.findList(hql).toString();
					ip=	ip.substring(1,ip.length()-1);
			tb.add(ip);
			tb.add(l.get(i).toString());
		}
		//System.out.println(tb);
		return tb;
	}
	@Override
	public boolean updateexp(TbMonitor tbMonitor) throws Exception {
		monitorDao.update(tbMonitor);
		return true;
	}
	@Override
	public boolean endexp(String id) throws Exception {
		String hql="update TbMonitor set flag ='N' where id="+id;
		monitorDao.updateMonitor(hql);
		return true;
	}
}
