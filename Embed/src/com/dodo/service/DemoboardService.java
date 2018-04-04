package com.dodo.service;

import java.util.List;

import com.dodo.entity.TbDemoboard;

public interface DemoboardService {

	public boolean updateexp(TbDemoboard tbDemoboard) throws Exception;

	public List<String> getDemoboard() throws Exception;

	public boolean endexp(String id) throws Exception;

	public TbDemoboard getBT(String id) throws Exception;
}
