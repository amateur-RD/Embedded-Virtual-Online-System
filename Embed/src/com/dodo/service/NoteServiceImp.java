package com.dodo.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dodo.dao.NoteDao;
import com.dodo.entity.TbNote;
import com.dodo.entity.TbUser;
import com.dodo.util.DataGrid;
import com.dodo.util.Page;

public class NoteServiceImp implements NoteService{

	private NoteDao<TbNote> noteDao;
	public void setNoteDao(NoteDao<TbNote> noteDao) {
		this.noteDao = noteDao;
	}
	
	@Override
	public DataGrid findDataGrid(Page p) throws Exception{
		int page = p.getPage();
		int count = p.getCount();
		String hql = "select count(*) from TbNote";
		int counts = Integer.parseInt(noteDao.findUnique(hql).toString());
		hql = "from TbNote";
		List<TbNote> list = noteDao.findList(hql, page, counts);
		DataGrid dataGrid = new DataGrid();
		dataGrid.setTotal(counts);
		//dataGrid.setPages(counts % count == 0 ? counts / count : counts / count + 1);
		dataGrid.setPages(1);
		dataGrid.setRows(list);
		//System.out.println(dataGrid.toString());
		return dataGrid;
	}
	@Override
	public boolean addnote(TbNote tbNote) throws Exception {
		tbNote.setCreatetime(new Timestamp(System.currentTimeMillis()));
			noteDao.save(tbNote);
		return true;
	}

	@Override
	public boolean deletenote(TbNote tbNote) throws Exception {
		noteDao.delete(tbNote);
		return true;
	}

	@Override
	public boolean updatenote(TbNote tbNote) throws Exception {
		tbNote.setCreatetime(new Timestamp(System.currentTimeMillis()));
		noteDao.update(tbNote);
		return true;
	}

}
