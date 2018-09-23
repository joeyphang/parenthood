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
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

document.addEventListener("DOMContentLoaded", function(){
  $('#title').on('keypress', function(e){
   $.ajax({
     url: 'search',
     method: 'GET',
     data: $(this).serialize(),
     dataType: 'json',
     success: function(data){
       let check_workshop_title = document.getElementById("check_workshop_title");
       check_workshop_title.innerHTML = "";

       data.forEach(function(workshop){
         const option = document.createElement("option");

         option.value = workshop.title;
         check_workshop_title.append(option);
       })
     }
   })
 });
})
