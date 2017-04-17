$( document ).on('turbolinks:load', function() {
$(function() {
  return $('.masonry-container').imagesLoaded(function() {
    return $('.masonry-container').masonry({
      itemSelector: '.box ',
      columnWidth: function(containerWidth) {
        if ($(window).width() >= 992) {
          return containerWidth / 3;
        }
      }
    });
  });
});
}) 