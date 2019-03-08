package com.bob.proj.api;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;
@Service
public class Ttest {

	
	 public String TranslateService(String text, String source, String target){
	        String key = "AIzaSyCAX74OsJ5YoSNsgV9s5KXV4bjMxP-p__U"; // API 키
	        HttpClient client = new DefaultHttpClient();
	        URI uri;
	        String result = null;
	        JSONArray jsonArray = null;
	        JSONObject jsonObject = null;
	        JSONObject jsonObject2 = null;
	        JSONObject jsonObject3 = null;
	        try {
	            uri = new URIBuilder("https://www.googleapis.com/language/translate/v2")
	            .addParameter("key", key)
	            .addParameter("q", text)
	            .addParameter("source", "en")
	            .addParameter("target", target)
	            .build();
	            HttpGet httpGet = new HttpGet(uri);
	            HttpResponse resp = client.execute(httpGet);
	            result = EntityUtils.toString(resp.getEntity(), "UTF-8");
	            
	            JSONParser parser = new JSONParser();
	            jsonObject = (JSONObject)parser.parse(result);
	            jsonObject2 = (JSONObject)jsonObject.get("data");
	            jsonArray = (JSONArray) jsonObject2.get("translations");
	            jsonObject3 = (JSONObject) jsonArray.get(0);
	            
	            
	        } catch (URISyntaxException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (ParseException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        
	        String r = (String) jsonObject3.get("translatedText");
	        return r;
	    }


	
	
}
