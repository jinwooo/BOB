package com.bob.proj.api;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bob.proj.model.dto.ImgVisionDto;
import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.ImageSource;
import com.google.cloud.vision.v1.WebDetection;
import com.google.protobuf.ByteString;

@Service
public class Imgvision {
	
	private Ttest test;
	
	private static Image pathImage(String filePath) throws IOException {
       Image image;

        if(filePath.startsWith("http")){
        	 // 로컬에서 이미지를 가져올때 image 생성
        	 ImageSource test1 = ImageSource.newBuilder().setImageUri(filePath).build();
        	 image = Image.newBuilder().setSource(test1).build();
        	
        }else {
            ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));
            image = Image.newBuilder().setContent(imgBytes).build();
        }
       

        return image;
    }
	
	public List<ImgVisionDto> detectWebDetections(String filePath) throws Exception {
	    List<AnnotateImageRequest> requests = new ArrayList<>();

	    Image image = pathImage(filePath);
	    List<ImgVisionDto> list = new ArrayList<ImgVisionDto>();
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
	            	ImgVisionDto dto = new ImgVisionDto();
	            		dto.setImgname(annotation.getWebEntitiesList().get(i).getDescription());
	            		System.out.println(annotation.getWebEntitiesList().get(i).getDescription());
	            		
	            	list.add(dto);
	            }
	            System.out.println(annotation.getWebEntitiesList().get(0).getDescription());            

	       
	        }
	    }
	    	return list;
	}
}
