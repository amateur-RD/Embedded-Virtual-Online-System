package com.dodo.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dodo.entity.TbNote;
import com.dodo.service.NoteService;
import com.dodo.util.Page;

public class NoteAction extends BaseAction{

	private NoteService noteService;
	private TbNote tbNote;
	public void setNoteService(NoteService noteService) {
		this.noteService = noteService;
	}
	public void setTbNote(TbNote tbNote) {
		this.tbNote = tbNote;
	}
	public TbNote getTbNote() {
		return tbNote;
	}
	

	public String myNote() throws Exception {
		return "result";
	}
	
	public void getNote() throws Exception{
		if (page == null) {
			page = new Page();
		}
	JSONWrite(noteService.findDataGrid(page));
	}

	public void deleteNote() throws Exception {
		boolean fals = false;
		if (tbNote != null) {
		fals=noteService.deletenote(tbNote);
		}
		JSONWrite(fals);
	}
	public void updateNote() throws Exception {
		boolean fals = false;
		if (tbNote != null) {
		fals=noteService.updatenote(tbNote);
		}
		JSONWrite(fals);
	}
}
