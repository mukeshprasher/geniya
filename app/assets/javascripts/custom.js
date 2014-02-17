$(function() {
  var toDoOnload;
  toDoOnload = function() {
    $('.datepicker, .datetimepicker').append('<span class="add-on"><i data-time-icon="icon-time" data-date-icon="icon-calendar"></i></span>')

    $('.datetimepicker').datetimepicker({
      format: 'yyyy-MM-dd HH:mm:ss'
    });

    $('.datepicker').datetimepicker({
      format: 'yyyy-MM-dd',
      pickTime: false
    });

  };

  $(document).ready(toDoOnload);
  $(document).on('page:load', toDoOnload);
});




