var imgwidth;
var imgheight;

function place_bottom(){
  var top_pos = $(".black-bottom").position().top;
	var win_height = $(window).height();

	$(".black-bottom").css( {
    height: (win_height - top_pos) - 60 +'px'
  });
}


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
    place_bottom();
    
    $(window).resize(function() {
    	resizeImg();
    	place_bottom();
    	
    	
      
    }); 
  };
})

$("document").ready(function() {
  
  var image_url = $('#background').attr('src');
  $('#background').hide();
  
  $('.backdrop_preload_area').html('<img src="'+image_url+'"/>');
  
  $('.backdrop_preload_area img').imgpreload(function(){

    $("#background").fadeIn("slow");
    $("#background").animate({ left: "-100", top: "-50" }, 10000, "swing");
    
    var gmap = $('.google_map a').attr('title');
    
    // load from dom
    var intId = setInterval(load_google_map,200);
    function load_google_map(){
      $('.google_map').delay(2000).html(gmap);
      clearInterval(intId);  
    }
        
        
    
    //$('.google_map').delay(2000).html(gmap);

  });
});