package com.helper;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

public class PhotoOperation {

	public void storeProduct(InputStream iStream, String path) {
		try {
			byte[] array = new byte[iStream.available()];
			iStream.read(array);

			FileOutputStream fStream = new FileOutputStream(path);
			fStream.write(array);

			fStream.close();
			iStream.close();
		} catch (Exception e) {
			System.out.println("Unable to store product photo");
		}
	}

	public boolean createDirectory(String path) {
		try {
			Files.createDirectories(Paths.get(path));
			return true;

		} catch (Exception e) {
			System.out.println("Faild to create new directory");
			return false;
		}
	}

}
