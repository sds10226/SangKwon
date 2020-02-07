package com.cafe24.sosang.dto;

public class GenderAndAge_FloatingPopDTO {
	private int total;
	private int total_male;
	private int total_female;
	private int total_10;
	private int total_20;
	private int total_30;
	private int total_40;
	private int total_50;
	private int total_60;

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getTotal_male() {
		return total_male;
	}

	public void setTotal_male(int total_male) {
		this.total_male = total_male;
	}

	public int getTotal_female() {
		return total_female;
	}

	public void setTotal_female(int total_female) {
		this.total_female = total_female;
	}

	public int getTotal_10() {
		return total_10;
	}

	public void setTotal_10(int total_10) {
		this.total_10 = total_10;
	}

	public int getTotal_20() {
		return total_20;
	}

	public void setTotal_20(int total_20) {
		this.total_20 = total_20;
	}

	public int getTotal_30() {
		return total_30;
	}

	public void setTotal_30(int total_30) {
		this.total_30 = total_30;
	}

	public int getTotal_40() {
		return total_40;
	}

	public void setTotal_40(int total_40) {
		this.total_40 = total_40;
	}

	public int getTotal_50() {
		return total_50;
	}

	public void setTotal_50(int total_50) {
		this.total_50 = total_50;
	}

	public int getTotal_60() {
		return total_60;
	}

	public void setTotal_60(int total_60) {
		this.total_60 = total_60;
	}

	@Override
	public String toString() {
		return "[total=" + total + ", total_male=" + total_male + ", total_female=" + total_female + ", total_10="
				+ total_10 + ", total_20=" + total_20 + ", total_30=" + total_30 + ", total_40=" + total_40
				+ ", total_50=" + total_50 + ", total_60=" + total_60 + "]";
	}

}
