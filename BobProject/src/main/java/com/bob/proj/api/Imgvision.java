package com.bob.proj.api;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.ImageSource;
import com.google.cloud.vision.v1.WebDetection;
import com.google.protobuf.ByteString;

public class Imgvision {
	
	
	public static void main(String[] args) {
		
		try {
			detectWebDetections("src/main/java/com/bob/proj/api/75978670_1_1509707881_w640.jpg");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	
	private static Image pathImage(String filePath) throws IOException {
       Image image;

        if (filePath.startsWith("gs://")) { // GCS에서 이미지를 가져올때 image 생성
            ImageSource imgSource = ImageSource.newBuilder().setGcsImageUri(filePath).build();
            image = Image.newBuilder().setSource(imgSource).build();
        }
        else { // 로컬에서 이미지를 가져올때 image 생성
            ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));
            image = Image.newBuilder().setContent(imgBytes).build();
        }

        return image;
    }
	
	public static List<String> detectWebDetections(String filePath) throws Exception {
	    List<AnnotateImageRequest> requests = new ArrayList<>();

	    Image image = pathImage(filePath);
	    List<String> list = new ArrayList<String>();
	    Feature feat = Feature.newBuilder().setType(Feature.Type.WEB_DETECTION).build();
	    AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(image).build();
	    requests.add(request);

	    try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
	        BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
	        List<AnnotateImageResponse> responses = response.getResponsesList();

	        for (AnnotateImageResponse res : responses) {            

	           
	            WebDetection annotation = res.getWebDetection();
	            System.out.println("Entity:Id:Score");
	            System.out.println("===============");

	            for (WebDetection.WebEntity entity : annotation.getWebEntitiesList()) {
	                System.out.println(entity.getDescription());
	            }
	            for( int i = 0 ; i < 5; i++) {
	            	
	            	list.add(annotation.getWebEntitiesList().get(i).getDescription());
	            }
	            System.out.println(annotation.getWebEntitiesList().get(0).getDescription());            

	       
	        }
	    }
	    	return list;
	}
}
