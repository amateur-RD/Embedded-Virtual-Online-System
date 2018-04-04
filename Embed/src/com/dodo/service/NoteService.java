package com.dodo.service;

import com.dodo.entity.TbNote;
import com.dodo.util.DataGrid;
import com.dodo.util.Page;

public interface NoteService {

	public DataGrid findDataGrid(Page page) throws Exception;
	public boolean addnote(TbNote tbNote) throws Exception;
	public boolean deletenote(TbNote tbNote) throws Exception;
	public boolean updatenote(TbNote tbNote) throws Exception;
	
}
