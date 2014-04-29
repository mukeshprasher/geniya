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
    
    
    // cover photo validation
    
    $("#upload_file_attachment").change(function (e) {
     var OrgFile = (this.files[0].name),
         FileName = OrgFile,
         FileExtension = FileName.split('.').pop().toLowerCase();
         
         if(FileName.indexOf(".")==-1 || FileExtension != "jpg" && FileExtension != "jpeg" && FileExtension != "png" && FileExtension != "gif" ){ // Curstom File Extension
          alert("This isn't a Photo !");
          $("#upload_file_attachment").val('');
          return false;
         }
         else
         if((this.files[0].size/1024/1024) > (1)){ // Max Photo Size 1MB
          alert("You Photo is too big !");
          $("#upload_file_attachment").val('');
          return false;
         }
         
         else{
          var fr = new FileReader;
    fr.onload = function() {
        var img = new Image;
        img.onload = function() {
          if ((img.width < 1024) && (img.height < 300)) {
          alert("Please choose an image that's at least 1024 pixels wide and at least 300 pixels tall.");
          $("#upload_file_attachment").val('');
          return false;
          }
        };
        img.src = fr.result;
    };
    fr.readAsDataURL(this.files[0]);
         }    
    
    });
    
//    $("#upload_file_attachment").change(function() {
//    
//    
//});
    
    $("#new_upload").submit(function(){
    var OrgFile = $(this).find("[type=file]");
     FileName = OrgFile.val();
    if (FileName == '')
    {
      alert('Please select the image for your cover photo');
      return false;
    }
    else
    {
      return true;
    }
    });
    
    
    $("#new_update").submit(function(){

    });
    
    
    
    
    $("#profile_img_form").submit(function(){
    var OrgFile = $(this).find("[type=file]");
     FileName = OrgFile.val();
    if (FileName == '')
    {
      alert('Please select the image for your Profile photo');
      return false;
    }
    else
    {
      return true;
    }
    });    
    
    
//      $("#new_upload").submit(function(){
//     var OrgFile = $(this).find("[type=file]"),
//         FileName = OrgFile.val();
//         alert(OrgFile);
//         FileExtension = FileName.split('.').pop().toLowerCase();
//         
//         if(FileName.indexOf(".")==-1 || FileExtension != "jpg" && FileExtension != "jpeg" && FileExtension != "png" && FileExtension != "gif" ){ // Curstom File Extension
//          alert("This isn't a Photo !");
//          return false;
//         }else
//         if((OrgFile[0].files[0].size/1024/1024) > (1)){ // Max Photo Size 1MB
//          alert("You Photo is too big !");
//          return false;
//         }
//         
//         else{
//          alert("every thing Fine :)");
//          return true;
//         }
//   });
    
    
//     $("#upload_file_attachment").change(function () {
//        var that=this;
//        // fadeOut or hide preview
//        p.fadeOut();
//        // prepare HTML5 FileReader
//        var oFReader = new FileReader();
//        oFReader.readAsDataURL(document.getElementById("#upload_file_attachment").files[0]);
//        oFReader.onload = function (oFREvent) {
//            var image = new Image();
//            image.src = oFREvent.target.result;
//            image.onload = function () {
//                if ((this.width > 400) && (this.height)) {
//                    that.value="";
//                    alert("choose another file");
//                }
//                else {
//                    p.attr('src', oFREvent.target.result).fadeIn();
//                }
//                // access image size here & do further implementation
//            };
//        };
//    });
    
    
    $("#profile_img").change(function (e) {
     var OrgFile = (this.files[0].name),
         FileName = OrgFile,
         FileExtension = FileName.split('.').pop().toLowerCase();
         
         if(FileName.indexOf(".")==-1 || FileExtension != "jpg" && FileExtension != "jpeg" && FileExtension != "png" && FileExtension != "gif" ){ // Curstom File Extension
          alert("This isn't a Photo !");
          $("#profile_img").val('');
          return false;
         }
         else
         if((this.files[0].size/1024/1024) > (1)){ // Max Photo Size 1MB
          alert("You Photo is too big !");
          $("#profile_img").val('');
          return false;
         }
         
         else{
          var fr = new FileReader;
    fr.onload = function() {
        var img = new Image;
        img.onload = function() {
          if ((img.width < 198) && (img.height < 198)) {
          alert("Please choose an image that's at least 198 pixels wide and at least 198 pixels tall.");
          $("#profile_img").val('');
          return false;
          }
        };
        img.src = fr.result;
    };
    fr.readAsDataURL(this.files[0]);
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

