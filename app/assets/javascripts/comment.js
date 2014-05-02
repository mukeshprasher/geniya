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
    
    $("#cover_img").change(function (e) {
     var OrgFile = (this.files[0].name),
         FileName = OrgFile,
         FileExtension = FileName.split('.').pop().toLowerCase();
         
         if(FileName.indexOf(".")==-1 || FileExtension != "jpg" && FileExtension != "jpeg" && FileExtension != "png" && FileExtension != "gif" ){ // Curstom File Extension
          alert("This isn't a Photo !");
          $("#cover_img").val('');
          return false;
         }
         else
         if((this.files[0].size/1024/1024) > (1)){ // Max Photo Size 1MB
          alert("You Photo is too big !");
          $("#cover_img").val('');
          return false;
         }
         
         else{
          var fr = new FileReader;
    fr.onload = function() {
        var img = new Image;
        img.onload = function() {
          if (img.width<="1200" && img.height){
          alert("Please choose an image that's at least 1200 pixels wide and at least 300 pixels tall.");
          $("#cover_img").val('');
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
      alert('You have Successfully added your Profile Photo');
      return true;
    }
    });
    
    $("#cover_img_form").submit(function(){
    var OrgFile = $(this).find("[type=file]");
     FileName = OrgFile.val();
    if (FileName == '')
    {
      alert('Please select the image for your Cover photo');
      return false;
    }
    else
    {
      alert('You have Successfully added your Cover Photo');
      return true;
    }
    });

    
    $("#new_skill").submit(function(){
    var skillfield = $("#skill_name")
     FileName = skillfield.val();
    if (FileName == '')
    {
      alert('Please Enter Your Skills');
      return false;
    }
    else
    {
      //skillfield.val('');
      alert('Your Skill is added to your profile');
      return true;
    }
    }); 

    $("#new_education").submit(function(){
    var instnamefield = $("#education_institute_name")
    var coursenamefield = $("#education_course_name")
     InstName = instnamefield.val();
     CorseName = coursenamefield.val();
    if (InstName == '')
    {
      alert('Please Enter Institute Name');
      return false;
    }
    else
    if(CorseName == '')
    {
          alert('Please Enter Course Name');
      return false;
    }
    else
    {
      //skillfield.val('');
      alert('Eduction Successfully added');
      return true;
    }
    });
    
        $("#new_album").submit(function(){
    var albumnamefield = $("#album_name")
    var albumtitlefield = $("#album_title")
     albumName = albumnamefield.val();
     albumtitle = albumtitlefield.val();
    if (albumName == '')
    {
      alert('Please Enter Portfolio Name');
      return false;
    }
    else
    if(albumtitle == '')
    {
          alert('Please Enter Portfolio Title');
      return false;
    }
    else
    {
      //skillfield.val('');
      alert('Eduction Successfully added');
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
          if (img.width<="400" && img.height)
           {
          alert("Please choose an image that's at least 300 pixels wide and at least 300 pixels tall.");
          $("#profile_img").val('');
          return false;
          }
        };
        img.src = fr.result;
    };
    fr.readAsDataURL(this.files[0]);
         }    
    
    });    
    
  $('#uploadcoverphoto').click(function() {
          $(".uiMenucover").hide('slow');
        });  
    

    
      $('#uploadphoto').click(function() {
          $(".uiMenu").hide('slow');
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

