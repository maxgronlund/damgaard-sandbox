

var imgwidth;
var imgheight;

$(function($) {
	$.fn.fullBg = function(){
		var bgImg = $(this);
		
		bgImg.addClass('fullBg');
		
		function resizeImg() {
			imgwidth = bgImg.width();							// 1
			imgheight = bgImg.height();
			
			var winwidth = $(window).width();					// 2
			var winheight = $(window).height();
				
			var widthratio = winwidth/imgwidth;				// 2
			var heightratio = winheight/imgheight;
			
			var widthdiff = heightratio*imgwidth;
			var heightdiff = widthratio*imgheight;
			
			var sizeX = 0;
			var sizeY = 0;
			
			if(heightdiff>winheight) {
				
					sizeX =  winwidth;
					sizeY = heightdiff;
				
			} else {
					sizeX =  widthdiff;
					sizeY =  winheight;	
			}
			
			bgImg.css({
				width: 100 + sizeX+'px',
				height: 50 + sizeY+'px'
			});
		} 
		resizeImg();
		
		$(window).resize(function() {
			resizeImg();
		}); 
	};
})




