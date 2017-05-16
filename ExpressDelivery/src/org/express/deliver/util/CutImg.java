package org.express.deliver.util;

import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.imageio.ImageIO;

public class CutImg {
	/**
	 * 压缩图片
	 * 
	 * @param bi
	 * @param resize_width
	 *            宽
	 * @param resize_height
	 *            高
	 * @return
	 */
	public static BufferedImage ImageTransform(BufferedImage bi,
			int resize_width, int resize_height) {
		float xscale = (float) resize_width / (float) bi.getWidth();
		float yscale = (float) resize_height / (float) bi.getHeight();

		AffineTransform affineTransform = new AffineTransform();
		affineTransform.setToScale(xscale, yscale);

		BufferedImage outputImage = new BufferedImage(resize_width,
				resize_height, BufferedImage.TYPE_INT_RGB);
		Graphics2D gd2 = outputImage.createGraphics();
		gd2.drawImage(bi, affineTransform, null);
		gd2.dispose();
		return outputImage;
	}
}
