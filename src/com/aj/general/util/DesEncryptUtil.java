package com.aj.general.util;

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class DesEncryptUtil {
	
	/** 默认加密密钥字符串  **/
	private static String defaultKey = "ztkj1015";
	
	/** 加密工具  **/
	private Cipher encryptCipher;
	
	/** 解密工具  **/
	private Cipher decryptCipher;
	
	/**
	 *  默认构造方法  
	 *  使用默认秘钥
	 *  @throws java.lang.Exception 
	**/
	public DesEncryptUtil() throws Exception {
		this(defaultKey);
	}

	/**
	 *  构造方法  
	 *  @param encryptKey 加密秘钥
	 *  @throws java.lang.Exception 
	**/
	public DesEncryptUtil(String encryptKey) throws Exception{

		// 用密码初始化加密向量
		IvParameterSpec iv = generateIv(encryptKey);
		// 取得加密密钥
		Key key = getKey(encryptKey);
		
		// 初始化加密工具
		encryptCipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
		encryptCipher.init(Cipher.ENCRYPT_MODE, key,iv);
		
		// 初始化解密工具
		decryptCipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
		decryptCipher.init(Cipher.DECRYPT_MODE, key,iv);
	}
	
	 /**
     * 生成初始化向量
     * @param String bytes 指定的密码  
     * @return 初始化向量
     */
    public IvParameterSpec generateIv(String keyStr){
    	
        // 8个字节作为向量
        return new IvParameterSpec(getCorrectKeyByte(keyStr));
    }

	 /**  
	   * 从指定字符串生成密钥，密钥所需的字节数组长度为8位 不足8位时后面补0，超出8位只取前8位  
	   * @param String bytes 指定的密码  
	   * @return 生成的密钥  
	   * @throws java.lang.Exception  
	   */

	private Key getKey(String keyStr) {
		// 生成密钥
		Key key = new SecretKeySpec(getCorrectKeyByte(keyStr), "DES");
		return key;
	}
	
	 /**  
	   * 从指定字符获取8位字符， 不足8位时后面补0，超出8位只取前8位  
	   * @param String keyStr 指定的密码 
	   * @return 8位字符 
	   * @throws java.lang.Exception  
	   */

	public byte[] getCorrectKeyByte(String keyStr) {
		byte[] bytes = keyStr.getBytes();
		// 创建一个新的字节数字，默认值为0
		byte[] newBytes = new byte[8];
		// 取到原始字节数组的前8位
		for (int i = 0; i < bytes.length && i < newBytes.length; i++) {
			newBytes[i] = bytes[i];
		}
		return newBytes;
	}
	
	/**
	 * 加密字节数组
	 * @param needEncrypt 所要加密的字节串数组
	 * @return 加密后的字节数组
	 * @throws Exception
	 */
	public byte[] encrypt(byte[] needEncrypt) throws Exception {
		
		return encryptCipher.doFinal(needEncrypt);
	}
	
	/**
	 * 加密字符串
	 * @param needEncrypt 所要加密的字符串
	 * @return 加密后的字符串
	 * @throws Exception
	 */
	public String encrypt(String needEncrypt) throws Exception {
		
		return (new sun.misc.BASE64Encoder()).encode(encryptCipher.doFinal(needEncrypt.getBytes("utf-8")));
	}
	
	
	/**
	 * 解密字节数组
	 * @param needDecrypt 需要解密的字节数组
	 * @return 解密后的字节数组
	 * @throws Exception
	 */
	public byte[] decrypt(byte[] needDecrypt) throws Exception {
		
		return decryptCipher.doFinal(needDecrypt);
	}
	
	
	/**
	 * 解密字符串
	 * @param needDecrypt 需要解密的字符串
	 * @return 解密后的字符串
	 * @throws Exception
	 */
	public String decrypt(String needDecrypt) throws Exception {
		
		byte c[] = new sun.misc.BASE64Decoder().decodeBuffer(needDecrypt);
		
		return new String(decryptCipher.doFinal(c), "utf-8");
	}
}

