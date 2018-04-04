/*package com.dodo.util;
import java.util.List;

public class DataGrid {

	private int page = 1;// 当前页
	private int rows = 10;// 每页显示记录数
	private String sort = null;// 排序字段名
	private String field;//字段
	private String treefield;//树形数据表文本字段
	private List results;// 结果集
	private int total;//总记录数
	private String footer;//合计列
	private String sqlbuilder;//合计列
	
	public String getSqlbuilder() {
		return sqlbuilder;
	}

	public void setSqlbuilder(String sqlbuilder) {
		this.sqlbuilder = sqlbuilder;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getField() {
		return field;
	}

	public List getResults() {
		return results;
	}

	public void setResults(List results) {
		this.results = results;
	}

	public void setField(String field) {
		this.field = field;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
			return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getTreefield() {
		return treefield;
	}

	public void setTreefield(String treefield) {
		this.treefield = treefield;
	}

	public String getFooter() {
		return footer;
	}

	public void setFooter(String footer) {
		this.footer = footer;
	}
	
}*/

package com.dodo.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class DataGrid implements Serializable {

	private long total = 0;//总条数

	private long pages = 0;//总页数
	

	private List<?> rows = new ArrayList<Object>();//页面的内容数据

	public List<?> getRows() {
		return rows;
	}

	public void setRows(List<?> rows) {
		this.rows = rows;
	}
	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public long getPages() {
		return pages;
	}

	public void setPages(long pages) {
		this.pages = pages;
	}

	@Override
	public String toString() {
		return "DataGrid [total=" + total + ", pages=" + pages + ", rows="
				+ rows + "]";
	}

	
}
