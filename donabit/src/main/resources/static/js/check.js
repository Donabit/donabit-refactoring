  //이미지 업로드 미리보기
	const uploadInput = document.getElementById('uploadInput');
	uploadInput.addEventListener('change', (e) => {
    	const uploadImage = document.getElementById('uploadImage');
    	uploadImage.src = URL.createObjectURL(e.target.files[0]);
    	uploadImage.onload = function() {
    		URL.revokeObjectURL(uploadImage.src) 
    	}
   	});