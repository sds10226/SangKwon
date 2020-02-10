package com.cafe24.sosang.dto;

public class AreaDTO {
	private String area;
	private String food;
	private int select_year;
	private int select_quarter;
	private String population_type;
	private String ipji_type;

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getFood() {
		return food;
	}

	public void setFood(String food) {
		this.food = food;
	}

	public int getSelect_year() {
		return select_year;
	}

	public void setSelect_year(int select_year) {
		this.select_year = select_year;
	}

	public int getSelect_quarter() {
		return select_quarter;
	}

	public void setSelect_quarter(int select_quarter) {
		this.select_quarter = select_quarter;
	}
	
	public String getPopulation_type() {
		return population_type;
	}

	public void setPopulation_type(String population_type) {
		this.population_type = population_type;
	}
	
	public String getIpji_type() {
		return ipji_type;
	}

	public void setIpji_type(String ipji_type) {
		this.ipji_type = ipji_type;
	}

	@Override
	public String toString() {
		return "AreaDTO [area=" + area + ", food=" + food + ", select_year=" + select_year + ", select_quarter="
				+ select_quarter + ", population_type=" + population_type + ", ipji_type=" + ipji_type + "]";
	}

}
