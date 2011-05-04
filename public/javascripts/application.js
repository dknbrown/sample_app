// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

MAX_CHAR_COUNT = 140;
JQuery.ajaxSetup({
  'beforeSend': fuction(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
}

jQuery(document).ready(function() {

    $("#micropost_content").keyup(function() {
        var text =  $("#micropost_content").val()
        var count = MAX_CHAR_COUNT - text.length;
        $("#char_count").text(count);
        if ( text.length > MAX_CHAR_COUNT ) {
          $("#char_count").css('color' , 'red')
          } else {
          $("#char_count").css('color' , 'black')
          }
    });

    $("#follow_form").submit(function(){
        $.post($(this).attr("action"), $(this.serialize(), null, "script")
                return false;
    })


});
