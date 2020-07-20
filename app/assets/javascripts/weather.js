global$(function() {
  var API_KEY = '84434767bb5c7fed13491116616d979b'
  var city = 'Tokyo';
  var url = 'http://api.openweathermap.org/data/2.5/forecast?q=' + city + ',jp&units=metric&APPID=' + API_KEY;
  $.ajax({
    url: url,
    dataType: "json",
    type: 'GET',
  })
  .done(function(data) {
  })
  .fail(function(data) {
  });
});