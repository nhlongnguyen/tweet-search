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
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require_tree .

$(document).ready(function () {
  $('#fetch').click(function () {
    var btn = this;
    var query = $('#search').val();

    $(btn).prop('disabled', true);
    $('#results').html('');
    $('#status').html('Fetching tweets...');

    $.ajax({
      url: '/api/twitter_searches?query=' + query,
      context: document.body,
      method: 'POST'
    }).done(function (result) {
      $.each(result, function (index, tweet) {
        $('#results').append('<li>' + tweet.text + '</li>')
      })
      $(btn).prop('disabled', false);
      $('#status').html('');
    });
  });
});
