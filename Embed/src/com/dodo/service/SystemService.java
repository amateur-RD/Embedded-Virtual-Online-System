package com.dodo.service;

import com.dodo.entity.TbUser;
import com.dodo.util.DataGrid;
import com.dodo.util.Page;

public interface SystemService {

	public DataGrid findDataGrid(Page page) throws Exception;

	public boolean addmanager(TbUser tbUser) throws Exception;

	public int removeManager(String ids) throws Exception;

	public TbUser getManager(String id) throws Exception;

	public boolean updatemanager(TbUser tbUser)throws Exception;

	public boolean checkUsername(TbUser tbUser) throws Exception;

}
