package org.express.deliver.util;

import java.awt.Graphics;
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
	 * 等比例压缩图片
	 * @param path 图片路径
	 * @throws IOException
	 */
	public static void CompressedImage(String path) throws IOException {
		File fi = new File(path); // 大图文件
		File fo = new File(path); // 将要转换出的小图文件
		int nw = 100;
		AffineTransform transform = new AffineTransform();
		BufferedImage bis = ImageIO.read(fi);
		int w = bis.getWidth();
		int h = bis.getHeight();
		double scale = (double) w / h;
		int nh = (nw * h) / w;
		double sx = (double) nw / w;
		double sy = (double) nh / h;
		transform.setToScale(sx, sy);
		AffineTransformOp ato = new AffineTransformOp(transform, null);
		BufferedImage bid = new BufferedImage(nw, nh,
				BufferedImage.TYPE_INT_RGB);
		ato.filter(bis, bid);
		try {
			ImageIO.write(bid, "png", fo);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
