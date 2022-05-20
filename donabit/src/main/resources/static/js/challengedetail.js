//spring security - ajax post 방식으로 요청시 추가
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function (e, xhr, options) {
	xhr.setRequestHeader(header, token);
});


$(document).ready(function () {
	//참여하기 버튼 클릭시
	$(document).on("click", "#participatebtn", function () {
		//$("#participatebtn").click(function () {
		$.ajax({
			url: "/participate", // 호출할 주소
			data: { 'chnumajax': $("#chnumajax").val(), 'nickname': $("#nicknameajax").val() }, // 넘길 데이터
			type: 'get',
			dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
			success: function (list) { // 결과 받기
				console.log(list);
				console.log(list[0].chnum);
				console.log(list[0].nickname);
				var chmaxp = list[0].chmaxp;
				var nickname2 = list[0].nickname2;
				$('#participatebtn').remove();
				$('#recruitprog').remove();
				$('#recruitdivin').remove();
				$("#participate").prepend("<button id ='cancelbtn' type='button'>참가취소</button>");
				$("#divprog").prepend("<progress id='recruitprog2' value='" + nickname2 + "' max='" + chmaxp + "'></progress>");
				$("#recruitdiv").prepend("<div id = recruitdivin2 > " + nickname2 + " / " + chmaxp + "</div>");
				$("#zzz").load("/challengedetail.jsp");
				alert("참가완료");

			},// success
			error: function (jqXHR) {
				alert("failed");
			}// error
		});// ajax
	});//participatebtn click

	//취소하기 버튼 클릭시
	$(document).on("click", "#cancelbtn", function () {
		var con_test = confirm("주의, 해당 챌린지의 경험치와 인증 정보가 리셋됩니다. \n취소하시겠습니까?");
		if (con_test == true) {
			$.ajax({
				url: "/cancel", // 호출할 주소
				data: { 'chnumajax': $("#chnumajax").val(), 'nickname': $("#nicknameajax").val() }, // 넘길 데이터
				type: 'get',
				dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
				success: function (list) { // 결과 받기
					console.log('취소');
					console.log(list);
					console.log(list[0].chnum);
					var chnum = list[0].chnum;
					var chmaxp = list[0].chmaxp;
					var nickname2 = list[0].nickname2;

					$('#cancelbtn').remove();
					$('#recruitprog2').remove();
					$('#recruitdivin2').remove();
					$('#chnumajax').remove();
					$("#participate").prepend("<button id='participatebtn' type='button'>참가하기</button>");
					if (nickname2 == null) {
						$("#recruitdiv").prepend("<div id = recruitdivin > 0 / " + chmaxp + "</div>");
					} else {
						$("#recruitdiv").prepend("<div id = recruitdivin >  " + nickname2 + " / " + chmaxp + "</div>");
					}
					$("#divprog").prepend("<progress id='recruitprog' value='" + nickname2 + "' max='" + chmaxp + "'></progress>");
					$("#participate").prepend("<input type='hidden' id='chnumajax' name='chnumajax' value='" + chnum + "'>");
					// 
					alert("취소완료");
				},// success
				error: function (jqXHR) {
					alert("failed");
				}// error
			});// ajax
		}// confirm true
		else if (con_test == false) {
		}// confirm false
	});// cancelbtn click
});// ready