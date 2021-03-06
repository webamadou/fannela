// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery3
// require rails-ujs
//= require jquery_ujs
//= require activestorage
//= require turbolinks
//= require datatables
//= require popper
//= require bootstrap
//= require moment
//= require bootstrap-datetimepicker
//= require bootstrap3-dialog/src/js/bootstrap-dialog.js
//= require_tree .

$(document).ready(function() {
    $('[data-js-animal-form]').on("ajax:success", function(event, data, status, xhr){
        var animal = $(xhr.responseText).hide();
        $('#animals').append(animal);
        animal.fadeIn(2000);
    });

    $('[data-js-animal-id]').on("ajax:success", function(event, data, status, xhr){
        var animal_id = xhr.responseJSON.id;
        $('[data-js-animal-id='+animal_id+']').hide();
    })
});