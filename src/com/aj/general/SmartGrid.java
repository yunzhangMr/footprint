package com.aj.general;

import java.util.*;

public class SmartGrid {
	/**
	 * 记录总数
	 */
	private int totalCount;
	/**
	 * 部分记录，从posStart到posStart+count条记录
	 */
	private List items;

	public SmartGrid(int totalCount, List items) {
		this.totalCount = totalCount;
		this.items = items;
	}

	public SmartGrid() {
		this.items = new ArrayList();
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public List getItems() {
		return items;
	}

}
