$(function() {
  var toDoOnloadComment;
  toDoOnloadComment = function() {
    $(".comment-reply").click(function() {
      var comment_id=this.id.split("-")[1]
      $("#child-comment-form-"+comment_id).show();
    });
    $(".comment-delete").click(function(){
     var delete_comment_id=this.id.split("-")[2]
     $("#comment-"+delete_comment_id).hide();
    });
    $(".child-comment-delete").click(function(){
     var child_comment_delete_id=this.id.split("-")[3]
     $("#child-comment-"+child_comment_delete_id).hide();
    })

  }
  $(document).ready(toDoOnloadComment);
  $(document).on('page:load', toDoOnloadComment);
});

