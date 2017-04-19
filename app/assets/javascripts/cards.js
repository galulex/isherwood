$( document ).on('turbolinks:load', function() {
  var $container = $('#masonry-container');
  $container.masonry({
    itemSelector: '.box',
    isAnimated: true
  });

  $container.infinitescroll({
    navSelector  : 'nav.pagination',
    nextSelector : 'nav.pagination a[rel=next]',
    itemSelector : '.box',
    bufferPx     : 250,
    speed: 0
  },
    function( newElements ) {
      var $newElems = $( newElements );
      $container.masonry( 'appended', $newElems );
    }
  );
})

$(window).resize(function() {
  $('#masonry-container').masonry({
    itemSelector: '.box',
    isAnimated: true
  }, 'reload');
});
