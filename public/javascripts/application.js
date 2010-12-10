// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
    $('.info').tipsy({gravity: 'w', fade: true});
    //hideflash();
});
function hideFlash() {
  var flash_div = $(".flash");
  setTimeout(function() { flash_div.fadeOut(2000, function() { flash_div.html(""); flash_div.hide(); })}, 2500);
}
 