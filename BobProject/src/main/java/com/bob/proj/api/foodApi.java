package com.bob.proj.api;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;
 
public class foodApi {
 
    public final static String PHARM_URL = "http://apis.data.go.kr/1470000/FoodNtrIrdntInfoService/getFoodNtrItdntList?";
    public final static String KEY = "fVvHlO1X2h4lmI4mDp6o2Pr%2Bfx73zG%2Bo6XXt1LjEPvs4WCmiE4KxohexkMF6%2BAFodIu%2BCVChGgeLFeLcC4J%2FWw%3D%3D";
 
  
    public static void main(String[] args) {

    
    	int page = 1;
    	List<String> foodlist = new ArrayList<String>();
    	while(true) {
    		    		
    		try {
    			String url = PHARM_URL+"serviceKey="+KEY+"&pageNo=1";
        		
        		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        		
        		DocumentBuilder dBuilder;
				
				dBuilder = dbFactory.newDocumentBuilder();
				
				Document doc = dBuilder.parse(url);
				
				doc.getDocumentElement().normalize();
				
				System.out.println("Root element : " + doc.getDocumentElement().getNodeName());
				
				NodeList nList = doc.getElementsByTagName("item");
				System.out.println("파싱할 리스트 수 : " + nList.getLength());
				
				for (int temp = 0; temp < 5; temp++) {
					
					  // for문을 사용해 준 것은 모든 데이터를 출력해 보기 위해서이다.

					Node nNode = nList.item(temp);
										
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
											
				Element eElement = (Element) nNode;
				String foodname = getTagValue("DESC_KOR", eElement);
				System.out.println("음식 이름 =  "+  foodname);
				System.out.println(getTagValue("SERVING_WT", eElement));
				foodlist.add(foodname);
				}		
	}
				
				//하나의 리스트 값을 출력하면 +1 을 함으로써 구분시킬려고 , 20번째까지 구하기 위해서 , 임의로 
				page += 1;
				System.out.println("page number " + page);
				if(page > 0) 
				{
					break;
				}
				
			}catch (SAXException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}catch (ParserConfigurationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		
    	}
    		System.out.println(foodlist.get(0));
    	
    	
    	
    	
    }
    private static String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if (nValue == null) {
			return null;
		}
		return nValue.getNodeValue();
	}


 
}
 