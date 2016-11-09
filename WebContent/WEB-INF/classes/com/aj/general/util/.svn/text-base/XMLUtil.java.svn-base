package com.aj.general.util;

/**
 * 这个类提供操作XML的常用方法。所有输入的XML字符串应该是well-formed
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: </p>
 * @author 薛枫
 * @version 1.0
 */

import org.w3c.dom.*;
import org.xml.sax.*;
import org.apache.xerces.parsers.DOMParser;
import javax.xml.transform.*;
import javax.xml.parsers.*;
import javax.xml.transform.dom.*;
import javax.xml.transform.stream.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Map.Entry;
import java.io.*;
import org.apache.xpath.*;
import org.apache.log4j.*;

public class XMLUtil {

	static Logger log = Logger.getLogger(XMLUtil.class);

	/**
	 * 创建一个空的Document对象
	 * 
	 * @return Document对象
	 * @throws Exception
	 */
	public static Document createEmptyDocument() throws Exception {
		try {
			DocumentBuilderFactory docBF = DocumentBuilderFactory.newInstance();
			DocumentBuilder docB = docBF.newDocumentBuilder();
			Document document = docB.newDocument();
			return document;
		} catch (Exception ex) {
			log.error("", ex);
			throw ex;
		}

	}

	/**
	 * 由XML字符串获得XML Document对象
	 * 
	 * @param xmlStr
	 *            给定的XML字符串
	 * @return org.w3c.dom.Document对象
	 * @throws IOException
	 * @throws SAXException
	 */
	public static Document getDoc(String xmlStr) throws IOException,
			SAXException {
		Document doc = null;
		StringReader sd = new StringReader(xmlStr);
		InputSource inp = new InputSource(sd);
		DOMParser parser = new DOMParser();
		parser.parse(inp);
		doc = parser.getDocument();
		doc.normalize();
		doc.getDocumentElement().normalize();
		return doc;
	}

	/**
	 * 由Document对象获得XML字串。
	 * 
	 * @param node
	 *            需要转换的Document对象。对象中如果包含Version和Encoding信息，则另两个参数不起作用。
	 * @param encoding
	 *            XML使用的字符集，为null时使用系统配置文件中默认的XMLEncoding。
	 * @param version
	 *            XML的版本，为null时使用系统配置文件中默认的XMLVersion。
	 * @return 相应的XML字串
	 * @throws TransformerConfigurationException
	 * @throws TransformerException
	 * @throws IOException
	 */
	public static String getXMLString(Node node, String encoding, String version)
			throws TransformerConfigurationException, TransformerException,
			IOException {

		String xmlStr = null;
		Properties props = new Properties();
		ByteArrayOutputStream bytes = new ByteArrayOutputStream();
		TransformerFactory trans_factory = TransformerFactory.newInstance();
		Transformer xml_out = trans_factory.newTransformer();
		props.setProperty("method", "xml");
		props.setProperty("encoding", "UTF-8");
		props.setProperty("version", "1.0");
		xml_out.setOutputProperties(props);
		xml_out.transform(new DOMSource(node), new StreamResult(bytes));
		xmlStr = bytes.toString("UTF-8");
		if (node instanceof Document) {
			// 去除多余的<?xml version...>信息
			int index = xmlStr.indexOf("<?xml", 5);
			if (index > 0) {
				xmlStr = xmlStr.substring(index);
			}
			// 替换‘号为”号
			char char1 = '\'';
			char char2 = '"';
			xmlStr = xmlStr.replace(char1, char2);
		}
		return xmlStr;
	}

	/**
	 * 由Document对象获得XML字串
	 * 
	 * @param node
	 *            需要转换的Document对象，如果doc中不包含version和encoding信息，将使用默认的字符集GBK
	 * @return 相应的XML字串
	 * @throws TransformerConfigurationException
	 * @throws TransformerException
	 * @throws IOException
	 */
	public static String getXMLString(Node node)
			throws TransformerConfigurationException, TransformerException,
			IOException {
		return getXMLString(node, null, null);
	}

	public static String getNodeContent(Node node)
			throws TransformerConfigurationException, TransformerException,
			IOException {
		if (node == null)
			return null;
		String xmlStr = "";
		String tempStr = "";
		int index = -1;
		NodeList nl = node.getChildNodes();
		for (int i = 0; i < nl.getLength(); i++) {
			tempStr = getXMLString(nl.item(i));
			index = tempStr.indexOf("?>");
			xmlStr += tempStr.substring(index + 2);
		}

		return xmlStr;
	}

	/**
	 * 将XML字符串根据给定的XSL文件进行转换。
	 * 
	 * @param xmlStr
	 *            需要转换的XML字符串
	 * @param xslFile
	 *            进行转换的XSL文件
	 * @return 转换后的XML字符串
	 * @throws TransformerConfigurationException
	 * @throws TransformerException
	 */
	public static String XMLTransform(String xmlStr, File xslFile)
			throws TransformerConfigurationException, TransformerException {
		Document doc = null;
		try {
			doc = getDoc(xmlStr);
		} catch (Exception e) {
			throw new TransformerException(e);
		}
		return XMLTransform(new DOMSource(doc),	new StreamSource(xslFile));
	}

	/**
	 * 将XML字符串根据给定的XSL文件进行转换。
	 * 
	 * @param xmlStr
	 *            需要转换的XML字符串
	 * @param xslFile
	 *            进行转换的XSL文件
	 * @param ht
	 *            给xslt文档传的参数
	 * @return 转换后的XML字符串
	 * @throws TransformerConfigurationException
	 * @throws TransformerException
	 */
	public static String XMLTransform(String xmlStr, File xslFile, Hashtable ht)
			throws TransformerConfigurationException, TransformerException {
		Document doc = null;
		try {
			doc = getDoc(xmlStr);
		} catch (Exception e) {
			throw new TransformerException(e);
		}

		return XMLTransform(new DOMSource(doc), new StreamSource(xslFile), ht);
	}

	/**
	 * 将XML字符串根据给定的XSL文件进行转换。
	 * 
	 * @param xmlStr
	 *            需要转换的XML字符串
	 * @param xslStr
	 *            进行转换的XSL字符串
	 * @return 转换后的XML字符串
	 * @throws TransformerConfigurationException
	 * @throws TransformerException
	 */
	public static String XMLTransform(String xmlStr, String xslStr)
			throws TransformerConfigurationException, TransformerException {
		Document doc = null;
		try {
			doc = getDoc(xmlStr);
		} catch (Exception e) {
			throw new TransformerException(e);
		}
		
		ByteArrayInputStream xslBAIS = new ByteArrayInputStream(xslStr
				.getBytes());
		return XMLTransform(new DOMSource(doc), new StreamSource(xslBAIS));
	}

	/**
	 * 将XML字符串根据给定的XSL文件进行转换。
	 * 
	 * @param xmlStr
	 *            需要转换的XML字符串
	 * @param xslStr
	 *            进行转换的XSL字符串
	 * @param ht
	 *            给XSLT传的参数
	 * @return 转换后的XML字符串
	 * @throws TransformerConfigurationException
	 * @throws TransformerException
	 */
	public static String XMLTransform(String xmlStr, String xslStr, Hashtable ht)
			throws TransformerConfigurationException, TransformerException {
		Document doc = null;
		try {
			doc = getDoc(xmlStr);
		} catch (Exception e) {
			throw new TransformerException(e);
		}
		ByteArrayInputStream xslBAIS = new ByteArrayInputStream(xslStr
				.getBytes());
		return XMLTransform(new DOMSource(doc), new StreamSource(xslBAIS));
	}

	/**
	 * 将XML Document对象根据给定的XSL文件进行转换。
	 * 
	 * @param xmlDoc
	 *            需要转换的XML Document对象
	 * @param xslFile
	 *            进行转换的XSL文件
	 * @return 转换后的XML Document对象
	 * @throws IOException
	 * @throws SAXException
	 * @throws TransformerConfigurationException
	 * @throws TransformerException
	 */
	public static Document XMLTransform(Document xmlDoc, File xslFile)
			throws IOException, SAXException,
			TransformerConfigurationException, TransformerException {
		String xmlResult = XMLTransform(new DOMSource(xmlDoc),
				new StreamSource(xslFile));
		return getDoc(xmlResult);
	}

	/**
	 * 将XML Document对象根据给定的XSL文件进行转换。
	 * 
	 * @param xmlDoc
	 *            需要转换的XML Document对象
	 * @param xslFile
	 *            进行转换的XSL文件
	 * @param ht
	 *            给xslt文档传的参数
	 * @return 转换后的XML Document对象
	 * @throws IOException
	 * @throws SAXException
	 * @throws TransformerConfigurationException
	 * @throws TransformerException
	 */
	public static Document XMLTransform(Document xmlDoc, File xslFile,
			Hashtable ht) throws IOException, SAXException,
			TransformerConfigurationException, TransformerException {
		String xmlResult = XMLTransform(new DOMSource(xmlDoc),
				new StreamSource(xslFile));
		return getDoc(xmlResult);
	}

	public static Document XMLFile2Doc(File xmlFile) throws Exception {
		byte[] buffer = new byte[(int) xmlFile.length()];
		FileInputStream fis = new FileInputStream(xmlFile);
		fis.read(buffer, 0, (int) xmlFile.length());
		String xmlStr = new String(buffer, "UTF-8");
		fis.close();
		Document doc = XMLUtil.getDoc(xmlStr);
		doc.normalize();
		return doc;
	}

	/**
	 * 将XML文件根据给定的XSL文件进行转换。
	 * 
	 * @param xmlFile
	 *            需要转换的XML文件
	 * @param xslFile
	 *            进行转换的XSL文件
	 * @return 转换后的XML Document对象
	 * @throws IOException
	 * @throws SAXException
	 * @throws TransformerConfigurationException
	 * @throws TransformerException
	 */
	public static String XMLTransform(File xmlFile, File xslFile)
			throws IOException, SAXException,
			TransformerConfigurationException, TransformerException {
		Document doc = null;
		try {
			doc = XMLFile2Doc(xmlFile);
		} catch (Exception e) {
			return null;
		}
		return XMLTransform(new DOMSource(doc), new StreamSource(xslFile));
	}

	/**
	 * 将XML文件根据给定的XSL文件进行转换。
	 * 
	 * @param xmlFile
	 *            需要转换的XML文件
	 * @param xslFile
	 *            进行转换的XSL文件
	 * @param ht
	 *            给XSLT传的参数
	 * @return 转换后的XML Document对象
	 * @throws IOException
	 * @throws SAXException
	 * @throws TransformerConfigurationException
	 * @throws TransformerException
	 */
	public static String XMLTransform(File xmlFile, File xslFile, Hashtable ht)
			throws IOException, SAXException,
			TransformerConfigurationException, TransformerException {
		Document doc = null;
		try {
			doc = XMLFile2Doc(xmlFile);
		} catch (Exception e) {
			return null;
		}
		return XMLTransform(new DOMSource(doc), new StreamSource(xslFile), ht);
	}

	// 内部方法，用XSL文件转换XML
	private static String XMLTransform(Source xmlSource, Source xslSource)
			throws TransformerConfigurationException, TransformerException {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		TransformerFactory factory = TransformerFactory.newInstance();
		Transformer trans = factory.newTransformer(xslSource);
		trans.transform(xmlSource, new StreamResult(baos));
		return baos.toString();
	}

	// 内部方法，用XSL文件转换XML
	private static String XMLTransform(Source xmlSource, Source xslSource,
			Hashtable ht) throws TransformerConfigurationException,
			TransformerException {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		TransformerFactory factory = TransformerFactory.newInstance();
		Transformer trans = factory.newTransformer(xslSource);
		setXLSTParam(trans, ht);
		trans.transform(xmlSource, new StreamResult(baos));
		return baos.toString();
	}

	/**
	 * 将XML文件根据给定的XSL文件进行转换。
	 * 
	 * @param xmlFile
	 *            需要转换的XML文件
	 * @param xslFile
	 *            进行转换的XSL文件
	 * @param resultFile
	 *            转换后保存文件
	 * @throws IOException
	 * @throws SAXException
	 * @throws TransformerConfigurationException
	 * @throws TransformerException
	 */
	public static void XMLTransform(File xmlFile, File xslFile, File resultFile)
			throws IOException, SAXException,
			TransformerConfigurationException, TransformerException {
		XMLTransform(new StreamSource(xmlFile), new StreamSource(xslFile),
				resultFile);
	}

	/**
	 * 将XML文件根据给定的XSL文件进行转换。
	 * 
	 * @param xmlFile
	 *            需要转换的XML文件
	 * @param xslFile
	 *            进行转换的XSL文件
	 * @param resultFile
	 *            转换后保存文件
	 * @param ht
	 *            给xslt文档传的参数
	 * @throws IOException
	 * @throws SAXException
	 * @throws TransformerConfigurationException
	 * @throws TransformerException
	 */
	public static void XMLTransform(File xmlFile, File xslFile,
			File resultFile, Hashtable ht) throws IOException, SAXException,
			TransformerConfigurationException, TransformerException {
		XMLTransform(new StreamSource(xmlFile), new StreamSource(xslFile),
				resultFile, ht);
	}

	/**
	 * 添加一个节点到一个父节点
	 * 
	 * @param childNodeName
	 *            节点名称
	 * @param childNodeValue
	 *            节点值
	 * @param parent
	 *            父节点
	 * @throws Exception
	 *             系统异常
	 */
	public static void addNode(String childNodeName, String childNodeValue,
			Node parent) throws Exception {
		Document document = null;
		Text txtNode = null;
		Node node = null;
		try {
			document = parent.getOwnerDocument();
			node = (Node) document.createElement(childNodeName);
			// 创建一个TextNod节点
			txtNode = document.createTextNode(childNodeValue);
			node.appendChild(txtNode);
			parent.appendChild(node);
		} catch (Exception ex) {
			throw ex;
		}
	}

	/**
	 * 将一个节点下的所有子节点转移到新的父节点下
	 * 
	 * @param parent
	 *            新的父节点
	 * @param originalNode
	 *            原先的节点
	 */
	public static void transferNode(Node parent, Node originalNode) {
		NodeList nl = originalNode.getChildNodes();
		Document doc = parent.getOwnerDocument();
		for (int i = 0; i < nl.getLength(); i++) {
			Node newNode = doc.importNode(nl.item(i), true);
			parent.appendChild(newNode);
		}
		return;
	}

	// 内部方法，用XSL文件转换XML
	private static void XMLTransform(Source xmlSource, Source xslSource,
			File result) throws TransformerConfigurationException,
			TransformerException {
		TransformerFactory factory = TransformerFactory.newInstance();
		Transformer trans = factory.newTransformer(xslSource);
		trans.transform(xmlSource, new StreamResult(result));
	}

	// 内部方法，用XSL文件转换XML
	private static void XMLTransform(Source xmlSource, Source xslSource,
			File result, Hashtable ht)
			throws TransformerConfigurationException, TransformerException {
		TransformerFactory factory = TransformerFactory.newInstance();
		Transformer trans = factory.newTransformer(xslSource);
		setXLSTParam(trans, ht);
		trans.transform(xmlSource, new StreamResult(result));
	}

	// 对XLST设置参数
	private static void setXLSTParam(Transformer trans, Hashtable ht) {
		Enumeration e = ht.keys();
		while (e.hasMoreElements()) {
			String param = (String) e.nextElement();
			Object value = ht.get(param);
			trans.setParameter(param, value);
		}
	}

	/**
	 * 根据给定的结点名，得到Document这个结点的值，如果结点有子结点，也返回字符串
	 * 
	 * @param doc
	 *            要取值的Document
	 * @param tag
	 *            要取值得结点
	 * @return 结点值得字符串
	 */
	public static String getValuebyTag(Document doc, String tag) {
		NodeList e = doc.getElementsByTagName(tag);
		String val = null;
		if (e != null) {
			if (e.item(0) != null && e.item(0).getFirstChild() != null) {
				Element e0 = (Element) e.item(0);
				NodeList n0 = e0.getElementsByTagName("*");
				if (n0.getLength() == 0)
					val = e.item(0).getFirstChild().getNodeValue();
				else {
					try {
						val = getNodeContent(e0);
					} catch (Exception ex) {
						log.error("", ex);
					}
				}
			}
		}
		return val;
	}

	/**
	 * 根据给定的结点名，得到Element这个结点的值，如果结点有子结点，也返回字符串
	 * 
	 * @param doc
	 *            要取值的Elemnet
	 * @param tag
	 *            要取值得结点
	 * @return 结点值得字符串
	 */
	public static String getValuebyTag(Element doc, String tag) {
		NodeList e = doc.getElementsByTagName(tag);
		String val = null;
		if (e != null) {
			if (e.item(0) != null && e.item(0).getFirstChild() != null) {
				Element e0 = (Element) e.item(0);
				NodeList n0 = e0.getElementsByTagName("*");
				if (n0.getLength() == 0)
					val = e.item(0).getFirstChild().getNodeValue();
				else {
					try {
						val = getNodeContent(e0);
					} catch (Exception ex) {
						log.error(ex);
					}
				}
			} else if (e.item(0) != null) {
				val = "";
			}
		}
		return val;
	}

	/**
	 * 改变节点的值，移除旧节点，创建新的包含新节点值的和旧节点同名的节点替换旧节点(李翔)
	 * 
	 * @param nodeName
	 *            待改变节点的节点名
	 * @param nodeValue
	 *            新的节点值
	 * @param parentNode
	 *            待改变节点所属父节点
	 * @throws IOException
	 * @throws TransformerException
	 * @throws TransformerConfigurationException
	 * @throws SAXException
	 * @throws Exception
	 */
	public static void setNodeValue(String nodeName, String nodeValue,
			Node parentNode) throws IOException, TransformerException,
			TransformerConfigurationException, SAXException, Exception {
		NodeList ndl = parentNode.getChildNodes();
		for (int i = 0; i < ndl.getLength(); i++) {
			Node nd = ndl.item(i);
			if (nd.getNodeName().equals(nodeName)) {
				XMLUtil.setNodeValue(nd, nodeValue);
				break;
			}
		}
	}

	/**
	 * 将一个元素节点或空节点设置为指定的值
	 * 
	 * @param node
	 *            元素节点或空节点
	 * @param value
	 *            节点的新值
	 */
	public static void setNodeValue(Node node, String value) {
		if (node.getFirstChild() != null) {
			node.getFirstChild().setNodeValue(value);
		} else if (node.getFirstChild() == null) {
			Document belongDoc = node.getOwnerDocument();
			node.appendChild(belongDoc.createTextNode(value));
		}
	}

	/**
	 * 取得给定node节点下第一个节点名为tag的子孙节点的值，如果该节点有子节点， 也返回字符串
	 * 
	 * @param node
	 * @param tag
	 * @return
	 */
	public static String getValueByTag(Node node, String tag) {
		String value = null;
		NodeList ndl = null;

		short type = node.getNodeType();
		if (type == Node.DOCUMENT_NODE) {
			Document doc = (Document) node;
			ndl = doc.getElementsByTagName(tag);
		} else if (type == org.w3c.dom.Node.ELEMENT_NODE) {
			Element emt = (Element) node;
			ndl = emt.getElementsByTagName(tag);
		}
		if (ndl != null && ndl.getLength() > 0) {
			Element nd = (Element) ndl.item(0);
			if (nd != null && nd.getFirstChild() != null) {
				NodeList ndlt = nd.getElementsByTagName("*");
				if (ndlt.getLength() == 0) {
					value = nd.getFirstChild().getNodeValue();
				} else {
					try {
						value = getNodeContent(nd);
					} catch (Exception ex) {
						log.error(ex);
					}
				}
			} else if (nd != null) {
				value = "";
			}
		}
		return value;
	}

	/**
	 * This method gets the attributes of the Node specified as a method
	 * argument.
	 * 
	 * @return Attr[] attributes
	 * @param node
	 *            Node
	 */
	public static Attr[] getNodeAttributes(Node node) {
		int len = (node.getAttributes() == null) ? 0 : node.getAttributes()
				.getLength();
		Attr attributes[] = new Attr[len];
		try {
			for (int i = 0; i < len; i++) {
				attributes[i] = (Attr) node.getAttributes().item(i);
			}
		} catch (Exception ex) {
			log.error("getNodeAttributes", ex);
		}
		return attributes;
	}

	/**
	 * This method returns the attribute value for the attribute name specified.
	 * 
	 * @param node
	 *            Node
	 * @param attributeName
	 *            String
	 * @return String The attribute value
	 */
	public static String getNodeAttribute(Node node, String attributeName) {
		String attrValue = "";
		try {
			Attr[] attr = getNodeAttributes(node);
			for (int i = 0; i < attr.length; i++) {
				if (attributeName.equalsIgnoreCase(attr[i].getName())) {
					attrValue = attr[i].getValue();
					break;
				}
			}
		} catch (Exception ex) {
			log.error("getNodeAttribute", ex);
		}
		return attrValue;
	}

	public static String getNodeTextbyXPath(Node nd, String xpath) {
		String text = "";
		try {
			Node n = XPathAPI.selectSingleNode(nd, xpath);
			if (n.getFirstChild() != null)
				text = n.getFirstChild().getNodeValue();
			if (text == null)
				text = "";
		} catch (Exception ex) {
			log.error("getNodeTextbyXPath", ex);
			text = "";
		}
		return text;
	}

	/**
	 * 用递归的方法把一个文档中含有tagName的节点的值替换为Clob中文档
	 * 
	 * @param node
	 *            要处理的文档，一般是Rowset
	 * @param tagName
	 *            要处理的特殊节点
	 * @return 合并后的文档
	 */
	public static String chainDocByTag(Node node, String tagName) {
		String xmlStr = "";
		int type = node.getNodeType();
		switch (type) {
		// print the document element
		case Node.DOCUMENT_NODE:
			xmlStr = "<?xml version=\"1.0\" encoding=\"GBK\"?>";
			xmlStr += chainDocByTag(((Document) node).getDocumentElement(),
					tagName);
			break;
		// print element with attributes
		case Node.ELEMENT_NODE:
			xmlStr += "<";
			xmlStr += node.getNodeName();
			NamedNodeMap attrs = node.getAttributes();
			for (int i = 0; i < attrs.getLength(); i++) {
				Node attr = attrs.item(i);
				xmlStr += " " + attr.getNodeName() + "=\""
						+ attr.getNodeValue() + "\"";
			}
			xmlStr += ">";

			if (tagName.equals(node.getNodeName())) {
				// 只在这里处理特殊的节点
				if (node.getFirstChild() != null) {
					String id = node.getFirstChild().getNodeValue();
					char space = ' ';
					id = id.replace('\n', space);
					id = id.replace('\r', space);
					id = id.replace('\t', space);
					id = id.trim();
					if (id != null && !id.equals("")) {
						String data = new XMLClob().getXMLData(Integer.parseInt(id));
						xmlStr += data;
					}
				}
			} else {
				NodeList children = node.getChildNodes();
				if (children != null) {
					int len = children.getLength();
					for (int i = 0; i < len; i++)
						xmlStr += chainDocByTag(children.item(i), tagName);
				}
			}
			break;
		// handle entity reference nodes
		case Node.ENTITY_REFERENCE_NODE: 
			xmlStr += "&";
			xmlStr += node.getNodeName();
			xmlStr += ";";
			break;
		// print cdata sections
		case Node.CDATA_SECTION_NODE: 
			xmlStr += "<![CDATA[";
			xmlStr += node.getNodeValue();
			xmlStr += "]]>";
			break;
		// print text
		case Node.TEXT_NODE: 
			xmlStr += node.getNodeValue();
			break;
		// print processing instruction
		case Node.PROCESSING_INSTRUCTION_NODE: 
			xmlStr += "<?";
			xmlStr += node.getNodeName();
			String data = node.getNodeValue();
			{
				xmlStr += " ";
				xmlStr += data;
			}
			xmlStr += "?>";
			break;
		}

		if (type == Node.ELEMENT_NODE) {
			xmlStr += "</";
			xmlStr += node.getNodeName();
			xmlStr += '>';
		}
		return xmlStr;
	} // chainDocByTag(Node)

	/**
	 * 去掉xmlStr字符串回车和换行"\n"、"\r"、"t"，使得在客户端用XSL转换XML时， DOM可以完整读取XML串
	 * 
	 * @param xmlStr
	 *            需要处理的字符串
	 * @return 去掉"\n"、"\r"、"t"后的字符串
	 */
	public static String trimString(String xmlStr) {
		int index = 0;
		xmlStr = xmlStr.replaceAll("\n", "");
		xmlStr = xmlStr.replaceAll("\r", "");
		xmlStr = xmlStr.replaceAll("\t", "");
		return xmlStr;
	}

	public static Document mapList2Doc(List list) {
		Document doc = null;
		String debugStr = "=====XMLUtil.mapList2Doc()=====";
		try {
			SimpleDateFormat sdfdt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd");
			doc = XMLUtil.createEmptyDocument();
			Element rowset = doc.createElement("Rowset");
			doc.appendChild(rowset);
			Iterator it = list.iterator();
			int count = 0;
			while (it.hasNext()) {
				count++;
				Element row = doc.createElement("Row");
				row.setAttribute("num", String.valueOf(count));
				Map map = (Map) it.next();
				Iterator ittr = map.entrySet().iterator();
				while (ittr.hasNext()) {
					Entry entry = (Entry) ittr.next();
					String key = String.valueOf(entry.getKey()).toUpperCase();
					String value = "";
					Object valobj = entry.getValue();
					if (valobj == null) {
					} else if (valobj instanceof java.sql.Date) {
						value = sdfd.format(valobj);
					} else if (valobj instanceof java.sql.Timestamp) {
						value = sdfdt.format(valobj);
					} else {
						value = valobj.toString();
					}
					Node nd = doc.createElement(key);
					if (!"".equals(value)) {
						nd.appendChild(doc.createTextNode(value));
					}
					row.appendChild(nd);
				}
				rowset.appendChild(row);
			}
		} catch (Exception ex) {
			log.error(debugStr, ex);
		}
		return doc;
	}

	public static Document map2Doc(Map map) {
		Document doc = null;
		String debugStr = "=====XMLUtil.map2Doc()=====";
		try {
			SimpleDateFormat sdfdt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd");
			doc = XMLUtil.createEmptyDocument();
			Element rowset = doc.createElement("Rowset");
			doc.appendChild(rowset);
			Element row = doc.createElement("Row");
			row.setAttribute("num", "1");
			Iterator ittr = map.entrySet().iterator();
			while (ittr.hasNext()) {
				Entry entry = (Entry) ittr.next();
				String key = String.valueOf(entry.getKey()).toUpperCase();
				String value = "";
				Object valobj = entry.getValue();
				if (valobj == null) {
				} else if (valobj instanceof java.sql.Date) {
					value = sdfd.format(valobj);
				} else if (valobj instanceof java.sql.Timestamp) {
					value = sdfdt.format(valobj);
				} else {
					value = valobj.toString();
				}
				Node nd = doc.createElement(key);
				if (!"".equals(value)) {
					nd.appendChild(doc.createTextNode(value));
				}
				row.appendChild(nd);
			}
			rowset.appendChild(row);
		} catch (Exception ex) {
			log.error(debugStr, ex);
		}
		return doc;
	}

	public static Map tableDef2Map(Document tableDef) {
		Map map = new LinkedHashMap();
		
		try{
			NodeList ndl = tableDef.getElementsByTagName("Field");
			for (int i = 0; i < ndl.getLength(); i++) {
				Element emt = (Element) ndl.item(i);
				Map field = new HashMap();
				String name = XMLUtil.getValueByTag(emt, "Name");
				String comment = XMLUtil.getValueByTag(emt, "Comment");
				field.put("comment", comment);
				String type = XMLUtil.getValueByTag(emt, "Type");
				field.put("type", type);
				String length = XMLUtil.getValueByTag(emt, "Length");
				length = (length == null || "".equals(length.trim())) ? "0"
						: length.trim();
				field.put("length", new Integer(length));
				Element showtype = (Element) XPathAPI.selectSingleNode(
						emt, "Display/ShowType");
				String display = showtype.getAttribute("Type");
				field.put("display", display);
				map.put(name, field);
			}
		}catch (Exception e) {
			log.error("解析XML文件时出错", e);
		}
		return map;
	}

}
