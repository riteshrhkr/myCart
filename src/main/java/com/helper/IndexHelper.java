package com.helper;

public class IndexHelper {

	// Return 50 char of a string. If string have less then 50 characters then add
	// white spaces.
	public static String get50Char(String input) {
		if (input.length() > 50) {
			return input.substring(0, 47) + "...";
		} else {
			StringBuilder stringBuilder = new StringBuilder(input);
			int paddingLength = 50 - input.length();
			for (int i = 0; i < paddingLength; i++) {
				if (i < 3) {
					stringBuilder.append(".");
				} else {
					stringBuilder.append(" ");
				}
			}
			return stringBuilder.toString();
		}
	}

	static public int getDiscountedPrice(int price, int discount) {
		return price - (price * discount / 100);
	}
}