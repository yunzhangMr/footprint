package com.aj.general.util;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpClientParams;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class HttpClientQuestUtil {

	/** 转换工具*/
	private static Gson gson = new GsonBuilder().enableComplexMapKeySerialization().create();
	private static Integer CON_TIME = 60000;// 请求超时时间60秒
	private static Integer SO_TIME = 60000;// 读取超时时间60秒
	private static String BOUNDARY = UUID.randomUUID().toString(); // 边界标识 随机生成
	private static String PREFIX = "--", LINE_END = "\r\n";
	private static String CONTENT_TYPE = "application/octet-stream";//"application/x-www-form-urlencoded"; // 内容类型
	private static final int TIME_OUT = 120 * 1000; // 超时时间 1000 * 1000
	private static final String CHARSET = "UTF-8"; // 设置编码
	
	/** 
     * 执行一个HTTP POST请求，返回请求响应的HTML 
     * @param url       请求的URL地址 
     * @param params    请求的查询参数,可以为null 
     * @param charset 字符集 
     * @param pretty    是否换行 
     * @return 返回请求响应的HTML 
     */ 
    public static String doPost(String url, Map<String, String> params, String charset, boolean pretty) { 
    	// 通过HTTP请求返回的请求结果
    	StringBuffer response = new StringBuffer(); 
    	String responseStr = "";
    	HttpClientParams httpClientParams = new HttpClientParams();
    	// 设置请求超时时间
    	httpClientParams.setConnectionManagerTimeout(CON_TIME);
    	// 设置等待超时时间
    	httpClientParams.setSoTimeout(SO_TIME);
    	// 设置字符编码
    	httpClientParams.setContentCharset(charset);
        HttpClient client = new HttpClient();
        client.setParams(httpClientParams);
        client.setConnectionTimeout(CON_TIME);
        client.setTimeout(CON_TIME);
        PostMethod method = new PostMethod(url); 
        NameValuePair[] data = null;
        
        //设置Post数据 
        int count = 0;
        if (params != null) {
        	data = new NameValuePair[params.keySet().size()];
			for (Map.Entry<String, String> entry : params.entrySet()) {
				data[count] = new NameValuePair(entry.getKey(), entry.getValue());
				count ++;
			}
		}
        method.setRequestBody(data); 
        
        try { 
            client.executeMethod(method); 
            int resultCode = method.getStatusCode();
            if (resultCode == HttpStatus.SC_OK) { 
                BufferedReader reader = new BufferedReader(new InputStreamReader(method.getResponseBodyAsStream(), charset)); 
                String line; 
                while ((line = reader.readLine()) != null) { 
                        if (pretty) 
                            response.append(line).append(System.getProperty("line.separator"));
                        else 
                            response.append(line); 
                } 
                reader.close(); 
                responseStr = response.toString();
            } else {
            	responseStr = "ERROR_" + resultCode;
            }
        } catch (IOException e) { 
        	    responseStr = "ERROR_" + e.getMessage();
                e.printStackTrace();
        } finally { 
                method.releaseConnection(); 
        } 
        return responseStr; 
    }
    
    /** 
     * 执行一个HTTP POST请求，返回请求响应的HTML 
     * @param url       请求的URL地址 
     * @param params_json  JSON字符串
     * @param charset 字符集 
     * @param pretty    是否换行 
     * @return 返回请求响应的HTML 
     */ 
    public static String doPostStr(String url, String params_json, String charset, boolean pretty) { 
    	// 通过HTTP请求返回的请求结果
    	StringBuffer response = new StringBuffer(); 
    	String responseStr = "";
    	HttpClientParams httpClientParams = new HttpClientParams();
    	// 设置请求超时时间
    	httpClientParams.setConnectionManagerTimeout(CON_TIME);
    	// 设置等待超时时间
    	httpClientParams.setSoTimeout(SO_TIME);
    	httpClientParams.setContentCharset(charset);
        HttpClient client = new HttpClient();
        client.setParams(httpClientParams);
        PostMethod method = new PostMethod(url); 
        NameValuePair[] data = null;
        
        //设置Post数据 
        if (params_json != null) { 
           data = new NameValuePair[1];
           data[0] = new NameValuePair("params", params_json);
        } 
        method.setRequestBody(data); 
        
        try { 
            client.executeMethod(method);  
            int resultCode = method.getStatusCode();
            if (resultCode == HttpStatus.SC_OK) { 
                BufferedReader reader = new BufferedReader(new InputStreamReader(method.getResponseBodyAsStream(), charset)); 
                String line; 
                while ((line = reader.readLine()) != null) { 
                        if (pretty) 
                            response.append(line).append(System.getProperty("line.separator"));
                        else 
                            response.append(line); 
                } 
                reader.close();
                responseStr = response.toString();
            } else {
            	responseStr = "ERROR";
            }
        } catch (IOException e) { 
        	    responseStr = "ERROR";
                e.printStackTrace();
        } finally { 
                method.releaseConnection(); 
                
        } 
        return responseStr; 
    }
    
    /** 
     * 执行一个HTTP POST请求，返回请求响应的HTML 
     * @param url       请求的URL地址 
     * @param params    请求的查询参数,可以为null 
     * @param charset 字符集 
     * @param pretty    是否换行 
     * @return 返回请求响应的HTML 
     */ 
    private static HttpRequestEntity uploadFile(File file, String jsonText, String requestURL) throws Exception
    {
    	HttpRequestEntity httpRequestEntity = new HttpRequestEntity();
		HttpURLConnection conn = null;
		httpRequestEntity.setNetError(true);

        String  BOUNDARY =  UUID.randomUUID().toString();  //边界标识   随机生成
        String PREFIX = "--" , LINE_END = "\r\n";
        String CONTENT_TYPE = "multipart/form-data";   //内容类型
        try {
        	
			URL url = new URL(requestURL);
            conn = (HttpURLConnection) url.openConnection();
            conn.setReadTimeout(TIME_OUT);
            conn.setConnectTimeout(TIME_OUT);
            conn.setDoInput(true);  //允许输入流
            conn.setDoOutput(true); //允许输出流
            conn.setUseCaches(false);  //不允许使用缓存
            conn.setRequestMethod("POST");  //请求方式
            conn.setRequestProperty("Charset", CHARSET);  //设置编码
            conn.setRequestProperty("connection", "keep-alive");  
            conn.setRequestProperty("Content-Type", CONTENT_TYPE + ";boundary=" + BOUNDARY);
           
            // 定义输出流
            DataOutputStream dos = new DataOutputStream(conn.getOutputStream());
            
            // 写入实体数据
            if (!"".equals(jsonText)) {
            	StringBuffer entitySb = new StringBuffer();
            	// -------------------7defssoexe
            	entitySb.append(PREFIX);
            	entitySb.append(BOUNDARY);
            	entitySb.append(LINE_END);
            	entitySb.append("Content-Disposition: form-data; name=\"entityData\""+LINE_END);
            	entitySb.append(LINE_END);
            	dos.write(entitySb.toString().getBytes());
            	// 对文本数据进行加密后传输
            	dos.write(jsonText.getBytes());
            	dos.write(LINE_END.getBytes());
            }
             
            // 写入文件（图片）
            if(file!=null)
            {
                StringBuffer sb = new StringBuffer();
                sb.append(PREFIX);
                sb.append(BOUNDARY);
                sb.append(LINE_END);
                
                /**
                 * name里面的值为服务器端需要key  只有这个key 才可以得到对应的文件
                 * filename是文件的名字，包含后缀名的   比如:abc.png 
                 */
                sb.append("Content-Disposition: form-data; name=\"img\"; filename=\""+file.getName()+"\""+LINE_END);
                sb.append("Content-Type: application/octet-stream; charset="+CHARSET+LINE_END);
                sb.append(LINE_END);
                dos.write(sb.toString().getBytes());
                InputStream instream = new FileInputStream(file);
                byte[] bytes = new byte[1024];
                int len = 0;
                byte[] destAray = null;
                ByteArrayOutputStream bos = new ByteArrayOutputStream();  
                while((len=instream.read(bytes))!=-1)
                {
                	// 把文件流封装在一起
                	bos.write(bytes, 0, len); 
                }
                bos.flush();   
                destAray = bos.toByteArray(); 
                instream.close();
                // 对整个文件流进行加密
                dos.write(destAray);
                dos.write(LINE_END.getBytes());
                byte[] end_data = (PREFIX+BOUNDARY+PREFIX+LINE_END).getBytes();
                dos.write(end_data);
                dos.flush();
            }
            /**
             * 获取响应码  200=成功
             * 当响应成功，获取响应的流 
             */
            int res = conn.getResponseCode(); 
            httpRequestEntity.setResponseCode(res);
            if(res==200)
            {
                httpRequestEntity.setNetError(false);
                InputStream input = null;
				try {
					input =  conn.getInputStream();
	                StringBuffer sb1= new StringBuffer();
	                int ss ;
	                while((ss=input.read())!=-1)
	                {
	                    sb1.append((char)ss);
	                }
	                String result = sb1.toString();
	                httpRequestEntity.setData(result);
				} catch (Exception e) {
					httpRequestEntity.setNetError(false);
					httpRequestEntity.setError(502);//数据获取失败
					httpRequestEntity.setErrorMsg(e.getMessage());//错误信息
				} finally{
					if(input!=null)
						input.close();
				}
            }
            else{
            	httpRequestEntity.setError(1);// 连接失败
				httpRequestEntity.setNetError(true);// 连接失败异常
				InputStream input = conn.getInputStream();
				StringBuffer sb1 = new StringBuffer();
				int ss;
				while ((ss = input.read()) != -1) {
					sb1.append((char) ss);
				}
				String results = new String(sb1.toString().getBytes("ISO-8859-1"),"UTF-8");
				httpRequestEntity.setData(results);
				input.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
			if (conn != null)
				conn.disconnect();
		}
		return httpRequestEntity;
    }

	public static HttpRequestEntity uploadFileToServer(File file, String jsonText, 
			String requestURL) throws Exception {
		HttpRequestEntity hre = uploadFile(file, jsonText, requestURL);
		return hre;
	}

    
    /**
	 * @author wangli 请求结果对象
	 */
	public static class HttpRequestEntity {
		private int responseCode;// 结果类型
		private String data;// 反馈的数据
		private int error = 0; // 1 网络连接失败
		private boolean isNetError = false; // true是网络连接失败
		private String errorMsg;

		public HttpRequestEntity() {
		}

		public HttpRequestEntity(int responseCode) {
			this.responseCode = responseCode;
		}

		public HttpRequestEntity(int responseCode, String data) {
			this.responseCode = responseCode;
			this.data = data;
		}

		public void setData(String data) {
			this.data = data;
		}

		public int getResponseCode() {
			return this.responseCode;
		}

		public String getData() {
			return this.data;
		}

		public int getError() {
			return error;
		}

		public void setError(int error) {
			this.error = error;
		}

		public boolean isNetError() {
			return isNetError;
		}

		public void setNetError(boolean isNetError) {
			this.isNetError = isNetError;
		}

		public void setResponseCode(int responseCode) {
			this.responseCode = responseCode;
		}

		public String getErrorMsg() {
			return errorMsg;
		}

		public void setErrorMsg(String errorMsg) {
			this.errorMsg = errorMsg;
		}
	}
    
    /**
     * 测试
     * @param arge
     */
    public static void main(String[] arge) {
    	 Map<String, String> jMap = new HashMap<String,String>();
 		 jMap.put("interface", "orderInterface#2015");
 		 jMap.put("orderInfo", "12222");
 		 jMap.put("projectName", "建行");
    	 String reuslt =  doPost("http://192.168.12.172:80/jtpos/devicemanage/orderInterface.do?reqCode=addMerchantWorkOrder", jMap, "UTF-8", true);
    	 
    	 
    	 System.out.println("===========" + reuslt);
    }
}
