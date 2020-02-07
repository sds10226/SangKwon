package com.cafe24.sosang.dto;

public class ResultDTO {
	
	private String part;
	private int str_count;
	private int smlr_str_count;
	private int open;
	private int close;
	
	public String getPart() {
		return part;
	}
	
	public void setPart(String part) {
		this.part = part;
	}
	
	public int getStr_count() {
		return str_count;
	}
	
	public void setStr_count(int str_count) {
		this.str_count = str_count;
	}
	
	public int getSmlr_str_count() {
		return smlr_str_count;
	}
	
	public void setSmlr_str_count(int smlr_str_count) {
		this.smlr_str_count = smlr_str_count;
	}
	
	public int getOpen() {
		return open;
	}
	
	public void setOpen(int open) {
		this.open = open;
	}
	
	public int getClose() {
		return close;
	}
	
	public void setClose(int close) {
		this.close = close;
	}

	@Override
	public String toString() {
		return "ResultDTO [part=" + part + ", str_count=" + str_count + ", smlr_str_count=" + smlr_str_count + ", open="
				+ open + ", close=" + close + "]";
	}
	
}
