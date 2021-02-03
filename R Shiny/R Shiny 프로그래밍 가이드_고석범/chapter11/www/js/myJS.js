$(document).on('shiny:connected', function() {
    Shiny.onInputChange("myText", "Hello");
});
