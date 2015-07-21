// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// = require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// Keep application.js empty except for the commented out stuff that's in here
// This would go in a 'votes.js' file.
$(document).ready(function(){
  $('.postvote').on('click', '.upvote', function(event){
      event.preventDefault();
      // event.stopPropagation();

      $.ajax({
        url: event.target.href,
        method: 'post',
        data: $(event.target).serialize(),
        dataType: 'json'
      }).success(function(response){
        console.log('ajax!: ', response);
      }).fail(function(response){
        console.log('nope: ', response);
      })
  })

})


