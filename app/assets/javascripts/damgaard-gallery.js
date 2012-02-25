//<script type="text/javascript">
$("document").ready(function() {
  
  $('.gallery-preview').hide();
  
  // click on thumb
  $('.gallery-thumb').click(function(e){
    
    // dont open in new winow
    e.preventDefault();

    // get caption
    var photo_caption = $(this).attr('title');
    var photo_fullsize = $(this).attr('href');
    var photo_preview = photo_fullsize.replace('_fullsize', '_preview')
    
    // set link for preview
    $('.gallery-preview').html('<img src="'+photo_fullsize+'"/>');
    $('.gallery_preload_area').html('<img src="'+photo_fullsize+'"/>');
    
    // preload
    $('.gallery_preload_area img').imgpreload(function(){
      // x-fade from thumbs to full view
      $('.gallery-thumb').fadeOut(500, function(){
        $('.gallery-preview').fadeIn(500);
      });
    });

  });
  
  // click on big image
  // fade back to thumbs
  $('.gallery-preview').click(function(e){
    
    $('.gallery-preview').fadeOut(500, function(){
      $('.gallery-thumb').fadeIn(500);
    });
  });
  
  // mouse over effect
  $(".gallery-thumb").mouseover(function() {
     $('.gallery-thumb').children().css('opacity', '1');
     $(this).children().css('opacity', '.4');
  });
  

});


    


