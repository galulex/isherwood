$( document ).on('turbolinks:load', function() {
  $(function(){

    var $container = $('#masonry-container');

    $container.imagesLoaded(function(){
      $container.masonry({
        itemSelector: '.box',
        columnWidth: '.box'
      });
    });

    $container.infinitescroll({
      navSelector  : 'nav.pagination',
      nextSelector : 'nav.pagination a[rel=next]',
      itemSelector : '.box'
    },
      function( newElements ) {
        var $newElems = $( newElements ).css({ opacity: 0 });
        $newElems.imagesLoaded(function(){
          $newElems.animate({ opacity: 1 });
          $container.masonry( 'appended', $newElems, true );
        });
      }
    );
  });
})
