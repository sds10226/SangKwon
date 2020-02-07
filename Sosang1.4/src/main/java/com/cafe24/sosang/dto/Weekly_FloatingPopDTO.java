package com.cafe24.sosang.dto;

public class Weekly_FloatingPopDTO {
	private int total_weekend;
	private int total_week;
	private int total_sun;
	private int total_mon;
	private int total_tue;
	private int total_wed;
	private int total_thu;
	private int total_fri;
	private int total_sat;
	
	public int getTotal_weekend() {
		return total_weekend;
	}

	public void setTotal_weekend(int total_weekend) {
		this.total_weekend = total_weekend;
	}

	public int getTotal_week() {
		return total_week;
	}

	public void setTotal_week(int total_week) {
		this.total_week = total_week;
	}

	public int getTotal_sun() {
		return total_sun;
	}

	public void setTotal_sun(int total_sun) {
		this.total_sun = total_sun;
	}

	public int getTotal_mon() {
		return total_mon;
	}

	public void setTotal_mon(int total_mon) {
		this.total_mon = total_mon;
	}

	public int getTotal_tue() {
		return total_tue;
	}

	public void setTotal_tue(int total_tue) {
		this.total_tue = total_tue;
	}

	public int getTotal_wed() {
		return total_wed;
	}

	public void setTotal_wed(int total_wed) {
		this.total_wed = total_wed;
	}

	public int getTotal_thu() {
		return total_thu;
	}

	public void setTotal_thu(int total_thu) {
		this.total_thu = total_thu;
	}

	public int getTotal_fri() {
		return total_fri;
	}

	public void setTotal_fri(int total_fri) {
		this.total_fri = total_fri;
	}

	public int getTotal_sat() {
		return total_sat;
	}

	public void setTotal_sat(int total_sat) {
		this.total_sat = total_sat;
	}

	@Override
	public String toString() {
		return "[total_weekend=" + total_weekend + ", total_week=" + total_week + ", total_sun=" + total_sun
				+ ", total_mon=" + total_mon + ", total_tue=" + total_tue + ", total_wed=" + total_wed + ", total_thu="
				+ total_thu + ", total_fri=" + total_fri + ", total_sat=" + total_sat + "]";
	}
}
