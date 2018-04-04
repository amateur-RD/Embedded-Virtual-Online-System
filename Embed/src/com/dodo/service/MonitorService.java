package com.dodo.service;

import java.util.List;

import com.dodo.entity.TbMonitor;

public interface MonitorService {
	public List<String> getMonitor() throws Exception;
	public boolean updateexp(TbMonitor tbMonitor) throws Exception;
	public boolean endexp(String id) throws Exception;
}
