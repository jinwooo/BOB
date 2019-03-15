package com.bob.proj.api;

import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.WebDetection;
import com.bob.proj.model.dto.ImgVisionDto;
import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.protobuf.ByteString;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

public class GoogleVisionApiTester {
	
	public static void main(String[] args) {
		
		try {
	
			String imageFilePath = "src/main/java/com/bob/proj/api/si.jpg";
			
			List<AnnotateImageRequest> requests = new ArrayList<>();
		
			ByteString imgBytes = ByteString.readFrom(new FileInputStream(imageFilePath));
		
			Image img = Image.newBuilder().setContent(imgBytes).build();
			Feature feat = Feature.newBuilder().setType(Type.WEB_DETECTION).build();
			AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
			requests.add(request);
		
			try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
				BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			    List<AnnotateImageResponse> responses = response.getResponsesList();
		
			    for (AnnotateImageResponse res : responses) {
			    	
			    	 WebDetection annotation = res.getWebDetection();
			        for (WebDetection.WebEntity entity : annotation.getWebEntitiesList()) {
		                System.out.println(entity.getDescription());
		            }
		            for( int i = 0 ; i < 5; i++) {
		            		System.out.println(annotation.getWebEntitiesList().get(i).getDescription());
		            }
		            System.out.println(annotation.getWebEntitiesList().get(0).getDescription());            

		
			      
			    	// For full list of available annotations, see http://g.co/cloud/vision/docs
			    	/*for (EntityAnnotation annotation : res.getTextAnnotationsList()) {
				    	  
						//System.out.printf("Text: %s\n", annotation.getDescription());
						//System.out.printf("Position : %s\n", annotation.getBoundingPoly());
					}*/
			    }
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}