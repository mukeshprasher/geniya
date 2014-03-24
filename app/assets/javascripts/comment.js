$(function() {
  var toDoOnloadComment;
  toDoOnloadComment = function() {

    $(".comment-reply").click(function() {
      var comment_id=this.id.split("-")[1]
      $("#child-comment-form-"+comment_id).show();
    });
    $(".comment-delete").click(function(){
     var delcomment = confirm("Do you want to delete this comment ?");
     if(delcomment == true)
     {
     var delete_comment_id=this.id.split("-")[2]
       $("#comment-"+delete_comment_id).hide('slow');
       return true;
     }
     else
       {$("#comment-"+delete_comment_id).show();
       return false;}
     });
    
    $(".child-comment-delete").click(function(){
      var delchildcomment = confirm("Do you want to delete this comment ?");
      if(delchildcomment == true)
      {
        var child_comment_delete_id=this.id.split("-")[3]
        $("#child-comment-"+child_comment_delete_id).hide('slow');
        return true;
      }
      else
      {
       $("#child-comment-"+child_comment_delete_id).show(); 
       return false;
      }
    });
    

  }
  $(document).ready(toDoOnloadComment);
  $(document).on('page:load', toDoOnloadComment);
});

