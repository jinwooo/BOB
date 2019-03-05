package api;

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
			detectWebDetections("src/main/java/api/00502739_20180907.jpg");
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
	
	public static void detectWebDetections(String filePath) throws Exception {
	    List<AnnotateImageRequest> requests = new ArrayList<>();

	    Image image = pathImage(filePath);

	    Feature feat = Feature.newBuilder().setType(Feature.Type.WEB_DETECTION).build();
	    AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(image).build();
	    requests.add(request);

	    try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
	        BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
	        List<AnnotateImageResponse> responses = response.getResponsesList();

	        for (AnnotateImageResponse res : responses) {
	            if (res.hasError()) {
	                System.out.println("Error: " + res.getError().getMessage());
	                return;
	            }

	            // Search the web for usages of the image. You could use these signals later
	            // for user input moderation or linking external references.
	            // For a full list of available annotations, see http://g.co/cloud/vision/docs
	            WebDetection annotation = res.getWebDetection();
	            System.out.println("Entity:Id:Score");
	            System.out.println("===============");

	            for (WebDetection.WebEntity entity : annotation.getWebEntitiesList()) {
	                System.out.println(entity.getDescription());
	            }

	           /* System.out.println("\nPages with matching images: Score\n==");
	            for (WebDetection.WebPage page : annotation.getPagesWithMatchingImagesList()) {
	                System.out.println(page.getUrl() + " : " + page.getScore());
	            }

	            System.out.println("\nPages with partially matching images: Score\n==");
	            for (WebDetection.WebImage webImage : annotation.getPartialMatchingImagesList()) {
	                System.out.println(webImage.getUrl() + " : " + webImage.getScore());
	            }

	            System.out.println("\nPages with fully matching images: Score\n==");
	            for (WebDetection.WebImage webImage : annotation.getFullMatchingImagesList()) {
	                System.out.println(webImage.getUrl() + " : " + webImage.getScore());
	            }*/
	        }
	    }
	}
}
