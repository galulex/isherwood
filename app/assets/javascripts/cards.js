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
    speed        : 0
  },
    function( newElements ) {
      var target = document.getElementById('infscr-loading');
      var spinner = new Spinner({lines: 12, radius: 15, color: "#000"}).spin(target);
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
