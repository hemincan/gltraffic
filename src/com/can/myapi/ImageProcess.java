package com.can.myapi;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

public class ImageProcess {
	/**
	 * ͼƬ
	 */
	private Image img;
	/**
	 * ���
	 */
	private int width;
	/**
	 * �߶�
	 */
	private int height;
	/**
	 * �ļ���ʽ
	 */
	private String imageFormat;
	
	/**
	 * ���캯��
	 * 
	 * @throws Exception
	 */
	public ImageProcess(InputStream in, String fileName) throws Exception {
		// ����Image����
		img = ImageIO.read(in);
		// �õ�Դͼ��
		width = img.getWidth(null);
		// �õ�Դͼ��
		height = img.getHeight(null);
		// �ļ���ʽ
		imageFormat = fileName.substring(fileName.lastIndexOf(".") + 1);
	}
	
	/**
	 * ���տ�Ȼ��Ǹ߶Ƚ���ѹ��
	 * 
	 * @param w
	 *            int �����
	 * @param h
	 *            int ���߶�
	 */
//	public byte[] resizeFix(int w, int h) throws IOException {
//		
//		if (width / height > w / h) {
//			return resizeByWidth(w);
//		} else {
//			return resizeByHeight(h);
//		}
//	}

	/**
	 * �Կ��Ϊ��׼���ȱ�������ͼƬ
	 * 
	 * @param w
	 *            int �¿��
	 */
	public byte[] resizeByWidth(int w) throws IOException {
		//���ͼƬ̫С���Ͳ�ѹ����
		if(width<1000){
			w=width;
		}
		int h = (int) (height * w / width);
		return resize(w, h);
	}

	/**
	 * �Ը߶�Ϊ��׼���ȱ�������ͼƬ
	 * 
	 * @param h
	 *            int �¸߶�
	 */
//	public byte[] resizeByHeight(int h) throws IOException {
//		int w = (int) (width * h / height);
//		return resize(w, h);
//	}

	/**
	 * ǿ��ѹ��/�Ŵ�ͼƬ���̶��Ĵ�С
	 * 
	 * @param w
	 *            int �¿��
	 * @param h
	 *            int �¸߶�
	 */
	private byte[] resize(int w, int h) throws IOException {
		// SCALE_SMOOTH �������㷨 ��������ͼƬ��ƽ���ȵ� ���ȼ����ٶȸ� ���ɵ�ͼƬ�����ȽϺ� ���ٶ���
		BufferedImage image = new BufferedImage(w, h,
				BufferedImage.TYPE_INT_RGB);
		image.getGraphics().drawImage(img, 0, 0, w, h, null); // ������С���ͼ
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(image, imageFormat, baos);
		return baos.toByteArray();
	}
}