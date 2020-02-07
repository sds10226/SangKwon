package com.cafe24.sosang;

class Calc {

	public static void main(String[] args) {
		double score = 0;
		double val;
		
		val = 0.92;
		score += Math.round(val*2.5*10)/10.0;
				Double.parseDouble(String.format("%.1f",val*2.5));
		System.out.println(score);
	}

}
