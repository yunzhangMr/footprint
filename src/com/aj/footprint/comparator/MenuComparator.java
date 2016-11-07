package com.aj.footprint.comparator;

import java.util.Comparator;

import com.aj.footprint.model.po.TMenu;

public class MenuComparator implements Comparator<TMenu> {

	public int compare(TMenu o1, TMenu o2) {
		int i1 = o1.getSeq() != null ? o1.getSeq().intValue() : -1;
		int i2 = o2.getSeq() != null ? o2.getSeq().intValue() : -1;
		return i1 - i2;
	}

}
