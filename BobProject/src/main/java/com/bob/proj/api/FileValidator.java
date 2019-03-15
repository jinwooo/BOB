package com.bob.proj.api;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.bob.proj.model.dto.ImgVisionDto;

@Service
public class FileValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {

		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {

		ImgVisionDto file = (ImgVisionDto) target;

		if (file.getImgname().length() == 0) {
			
			errors.rejectValue("file", "errorCode", "Please select a file");
		}

	}

}
