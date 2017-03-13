$( document ).on('turbolinks:load', function() {
$('#review_brand_id').selectize({
    sortField: 'text',
     create: function(input) {
        return {
            value: input,
            text: input
        }
    }
});
})