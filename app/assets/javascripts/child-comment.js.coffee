jQuery ->
  # Create a comment
  comments = ->
    $(".child-comment-form")
      .on "ajax:beforeSend", (evt, xhr, settings) ->
        $(this).find('textarea')
          .addClass('uneditable-input')
          .attr('disabled', 'disabled');
      .on "ajax:success", (evt, data, status, xhr) ->
        $(this).find('textarea')
          .removeClass('uneditable-input')
          .removeAttr('disabled', 'disabled')
          .val('');

  # Delete a comment
  
  $(document)
    .ready comments
    .on "page:load", comments
    

