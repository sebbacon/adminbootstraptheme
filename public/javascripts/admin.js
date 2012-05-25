(function() {
  (function($) {
    $(document).ready(function() {
      return $('.locales a:first').tab('show');
    });
    $('.toggle-hidden').live('click', function() {
      $(this).parents('td').find('div:hidden').show();
      return false;
    });
    return $('#request_hidden_user_explanation_reasons input').live('click', function() {
      var info_request_id, reason;
      $('#request_hidden_user_explanation').show();
      info_request_id = $('#hide_request_form').attr('info_request_id');
      reason = $(this).val();
      return $.ajax("/hidden_user_explanation?reason=" + reason + "&info_request_id=" + info_request_id, {
        type: "GET",
        dataType: "text",
        error: function(data, textStatus, jqXHR) {
          return $('#request_hidden_user_explanation_field').attr("value", "Error: " + textStatus);
        },
        success: function(data, textStatus, jqXHR) {
          return $('#request_hidden_user_explanation_field').attr("value", data);
        }
      });
    });
  })(jQuery);
}).call(this);
