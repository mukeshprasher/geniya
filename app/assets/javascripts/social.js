$(function() {
  var toDoOnloadComment;
  toDoOnloadComment = function() {
  
  
  $("#followersuser").click(function(){
    $(".social_user").show("slow");
    $(".socail_share").hide("slow");
  
  });
  
    $("#followinguser").click(function(){
    $(".social_user").hide("slow");
    $(".socail_share").show("slow");
  
  });
  
  
  }
  $(document).ready(toDoOnloadComment);
  $(document).on('page:load', toDoOnloadComment);
});
