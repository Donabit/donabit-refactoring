	//글자수 100자 제한
    const chdesc = document.getElementById('chdesc')
    chdesc.addEventListener('keyup', maxText);
    function maxText(){
    	if(chdesc.value.length > 100) {
    		chdesc.value = chdesc.value.substr(0, 100);
    	}
    }
    
    //이미지 업로드 미리보기
	const uploadInput = document.getElementById('uploadInput');
	uploadInput.addEventListener('change', (e) => {
    	const uploadImage = document.getElementById('uploadImage');
    	uploadImage.src = URL.createObjectURL(e.target.files[0]);
    	uploadImage.onload = function() {
    		URL.revokeObjectURL(uploadImage.src) 
    	}
   	});
	
	//달력 시작일 > 오늘, 만료일 > 시작일(활성화 포함)
	const chsdate = document.getElementById('chsdate');
	const chedate = document.getElementById('chedate');
		
	function getToday(){
		const date = new Date();
		const year = date.getFullYear();
		const month = ("0" + (1 + date.getMonth())).slice(-2);
		const day = ("0" + date.getDate()).slice(-2);
		return year + "-" + month + "-" + day;
	}

	chsdate.min = getToday();
	
	chsdate.addEventListener('change', (event) => {
		chedate.disabled = false;
		chedate.min = event.target.value;
	});
    
	//성공횟수 자동 입력
	const chmaxp = document.getElementsByName('chmaxp');
	const chsuccess = document.getElementsByName('chsuccess');
	const chdonate = document.getElementById('chdonate');
	
	chsuccess.forEach(sitem => sitem.addEventListener('click', function(sevent){
		chdonate.value = chmaxp[0].value * sevent.target.value;
		chmaxp.forEach(pitem => pitem.addEventListener('click', function(pevent){
			chdonate.value = sevent.target.value * pevent.target.value;			
		}))
	}))
	
	chmaxp.forEach(pitem => pitem.addEventListener('click', function(pevent){
		chdonate.value = chsuccess[0].value * pevent.target.value;
		chsuccess.forEach(sitem => sitem.addEventListener('click', function(sevent){
			chdonate.value = sevent.target.value * pevent.target.value;			
		}))
	}))
	
	