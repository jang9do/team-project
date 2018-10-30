package com.tj.walb.model;

import org.springframework.web.multipart.MultipartFile;

//　CKEditorを利用する為のVO
public class FileUploadVO {
	 	private String attachPath; //이미지가 저장될 경로　イメージが貯槽する経路
	 
	    private String Filename; //파일이름　ファイルの名前
	 
	    private MultipartFile upload; //　実際のファイルDATA

	 //　GETTER, SETTER
		public String getAttachPath() {
			return attachPath;
		}

		public void setAttachPath(String attachPath) {
			this.attachPath = attachPath;
		}

		public String getFilename() {
			return Filename;
		}

		public void setFilename(String filename) {
			Filename = filename;
		}

		public MultipartFile getUpload() {
			return upload;
		}

		public void setUpload(MultipartFile upload) {
			this.upload = upload;
		}
}
