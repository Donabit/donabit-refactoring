$(document).ready(function(){
	$("header").css("transition", "all 0.15s linear");
	//스크롤 효과
	$("header").mouseover( function(){
		$(this).css("background", "white");
		$(this).css("box-shadow", "0px 1px 1px 1px rgba(0, 0, 0, 0.1)");
	})
	$("header").mouseleave( function(){
		$(this).css("background", "transparent");
		$(this).css("box-shadow", "unset");
	})
	
    $(window).scroll(function(){
      let scroll = $(window).scrollTop();
	  
      if (scroll > 65) {
        $("header").css("background", "white");
        $("header").css("box-shadow", "0px 1px 1px 1px rgba(0, 0, 0, 0.1)");
        $("header").mouseleave( function(){
			$(this).css("background", "white");
			$(this).css("box-shadow", "0px 1px 1px 1px rgba(0, 0, 0, 0.1)");
		})
      }
      else{
        $("header").css("background" , "transparent");
        $("header").css("box-shadow", "unset");
        $("header").mouseleave( function(){
			$(this).css("background", "transparent");
			$(this).css("box-shadow", "unset");
		})
      }
    })
  })