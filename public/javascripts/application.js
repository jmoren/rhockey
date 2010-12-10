// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
    $('.info').tipsy({gravity: 'w', fade: true});
    // Setting up the suggestion box
    $("#name_field").inputTip({
    // Text displayed when the input passes the validation
      goodText: "it looks good!",
      // Text displayed when the input doesn't pass the validation
      badText: "it looks too short!",
      invalidText: "it looks an ivalid text. Only letters please!",
      // Text displayed as a tip when the input field is focused
      tipText: "Here, just input something",
      longText: "it looks too long, max is 20",
      /* Function called to validate the input. It should fire "callback" with the following parameters
      *  First parameter:
      *  - 0: validation failed
      *  - 1: validation succeeded
      *  - 2: show the tip text
      * Second parameter: optional text to display instead of the standard text */
      validateText: function(inputValue, callback) {
        // Checking if the input field contains text.
        var textRegexp = /^[a-zA-Z ]*$/;
        if (inputValue.length > 3)
          if (textRegexp.test(inputValue))
            if (inputValue.length > 20)
              callback(5);
            else
              callback(1);
          else
            callback(4);
        else
          callback(0);
      },
                // True if the validation should be performed on every key/up event (false by default)
                validateInRealTime: true
            });
            $("#lastname_field").inputTip({
                // Text displayed when the input passes the validation
                goodText: "it looks good!",
                // Text displayed when the input doesn't pass the validation
                badText: "it looks too short!",
                invalidText: "it looks an ivalid text. Only letters please!",
                longText: "it looks too long, max is 20",
                // Text displayed as a tip when the input field is focused
                tipText: "Here, just input something",
                /* Function called to validate the input. It should fire "callback" with the following parameters
                *  First parameter:
                *  - 0: validation failed
                *  - 1: validation succeeded
                *  - 2: show the tip text
                * Second parameter: optional text to display instead of the standard text */
                validateText: function(inputValue, callback) {
                    // Checking if the input field contains text.
                    var textRegexp = /^[a-zA-Z ]*$/;
                    if (inputValue.length > 3)
                      if (textRegexp.test(inputValue))
                        if (inputValue.length > 20)
                          callback(5);
                        else
                          callback(1);
                      else
                        callback(4);
                    else           
                      callback(0);
                    
                    //if (textRegexp.test(inputValue) && (inputValue.length > 0)) callback(1);
                    //else callback(4);
                  },
                // True if the validation should be performed on every key/up event (false by default)
                validateInRealTime: true
            });

            // Setting up the suggestion box
            $("#email_field").inputTip({
                // Text displayed when the input passes the validation
                goodText: "nice email!",
                // Text displayed when the input doesn't pass the validation
                badText: "it doesn't look like an email!",
                // Text displayed as a tip when the input field is focused
                tipText: "Type an email address",
                // Text displayed when the mail  is being used by another player or coach
                emailInUse: "This email is being used yet, choose another please",
                /* Function called to validate the input. It should fire "callback" with the following parameters
                *  First parameter:
                *  - 0: validation failed
                *  - 1: validation succeeded
                *  - 2: show the tip text
                * Second parameter: optional text to display instead of the standard text */
                validateText: function(inputValue, callback) {
                // Checking if the input field contains text.
                    var emailRegexp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                    if (emailRegexp.test(inputValue)) callback(1);
                    else callback(0);
                },
                // True if the validation should be performed on every key/up event (false by default)
                validateInRealTime: true
            });
          //hideFlash();
        });
function hideFlash() {
  var flash_div = $(".flash");
  setTimeout(function() { flash_div.fadeOut(2000, function() { flash_div.html(""); flash_div.hide(); })}, 2500);
}