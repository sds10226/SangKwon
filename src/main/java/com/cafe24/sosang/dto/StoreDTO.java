package com.cafe24.sosang.dto;

public class StoreDTO {
	private int stdr_yy;
	private int stdr_qu;
	private String bs_se;
	private String bs_se_name;
	private int bs;
	private String bs_name;
	private String svc;
	private String svc_name;
	private int str_count;
	private int smlr_str_count;
	private int open_rt;
	private int close_rt;
	
	public int getStdr_yy() {
		return stdr_yy;
	}

	public void setStdr_yy(int stdr_yy) {
		this.stdr_yy = stdr_yy;
	}

	public int getStdr_qu() {
		return stdr_qu;
	}

	public void setStdr_qu(int stdr_qu) {
		this.stdr_qu = stdr_qu;
	}

	public String getBs_se() {
		return bs_se;
	}

	public void setBsSe(String bs_se) {
		this.bs_se = bs_se;
	}

	public String getBs_se_name() {
		return bs_se_name;
	}

	public void setBsSeName(String bs_se_name) {
		this.bs_se_name = bs_se_name;
	}

	public int getBs() {
		return bs;
	}

	public void setBs(int bs) {
		this.bs = bs;
	}

	public String getBs_name() {
		return bs_name;
	}

	public void setBsName(String bs_name) {
		this.bs_name = bs_name;
	}

	public String getSvc() {
		return svc;
	}

	public void setSvc(String svc) {
		this.svc = svc;
	}

	public String getSvc_name() {
		return svc_name;
	}

	public void setSvcName(String svc_name) {
		this.svc_name = svc_name;
	}

	public int getStr_count() {
		return str_count;
	}

	public void setStrCount(int str_count) {
		this.str_count = str_count;
	}

	public int getSmlr_str_count() {
		return smlr_str_count;
	}

	public void setSmlrStrCount(int smlr_str_count) {
		this.smlr_str_count = smlr_str_count;
	}

	public int getOpen_rt() {
		return open_rt;
	}

	public void setOpenRt(int open_rt) {
		this.open_rt = open_rt;
	}

	public int getClose_rt() {
		return close_rt;
	}

	public void setClose_rt(int close_rt) {
		this.close_rt = close_rt;
	}

	@Override
	public String toString() {
		return "StoreDTO [stdr_yy=" + stdr_yy + ", stdr_qu=" + stdr_qu + ", bs_se=" + bs_se + ", bs_se_name="
				+ bs_se_name + ", bs=" + bs + ", bs_name=" + bs_name + ", svc=" + svc + ", svc_name=" + svc_name
				+ ", str_count=" + str_count + ", smlr_str_count=" + smlr_str_count + ", open_rt=" + open_rt
				+ ", close_rt=" + close_rt + "]";
	}

}
