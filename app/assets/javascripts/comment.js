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
   
   // for skill form
    
        $("#skill-link").click(function() {
          $(".skill-form").show('slow');
        });  
        
        $("#cancel").click(function() {
          $("#skills").hide('slow');
        });
        
       $("#add").click(function() {
        $(".skill-form").hide('slow');
      // $("#skill_name").val('');
    });
    
    //for education detail form
     
        $("#cancel-edu").click(function() {
          $(".edu-form").hide('slow');
        });

        
        $("#edu-link").click(function() {
          $(".edu-form").show('slow');
        }); 
        
      $("#edu").click(function() {
       $(".edu-form").hide('slow');
       //      $(".skill-form").(this).val('');
      });          
    
    // for advertisements
    
        $("#add-link").click(function() {
          $(".ads-form").show('slow');
        });
        $("#cancel-ads").click(function() {
          $(".ads-form").hide('slow');
        });

      $("#ads").click(function() {
       $(".ads-form").hide('slow');
      });          
        
    // for albums forms    
    
  
      $("#new-album").click(function() {
       $(".album-form").show('slow');
      });
    
    $("#cancel-album").click(function() {
      $(".album-form").hide('slow');
    });

      $("#album-btn").click(function() {
       $(".album-form").hide('slow');
       //      $(".skill-form").(this).val('');
      });    
    
    // for uploads form_for
    
    $("#new-upload").click(function() {
      $(".upload-form").show('slow');
    });    
    
    
    $("#cancel-upload").click(function() {
      $(".upload-form").hide('slow');
    });    

      $("#upload-btn").click(function() {
       $(".upload-form").hide('slow');
       //      $(".skill-form").(this).val('');
      });    
        
       $(".pubBtn").click(function() {
         //alert('hello');
//         $("#feed-text").val('');
//          $("#update_file_attachment").val('');
          });
  }
  $(document).ready(toDoOnloadComment);
  $(document).on('page:load', toDoOnloadComment);
});

