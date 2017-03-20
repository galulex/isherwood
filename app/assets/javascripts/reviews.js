$( document ).on('turbolinks:load', function() {
    $(function(){
    $("[data-behavior='autocomplete']").atwho({ at:"@", limit: 5, 'data': "/users.json" });
});
})