function show_reply_box(comment_id){
  //var comment_id=this.id.split("-")[1]
  $(".child-comment-form-"+comment_id).show();
  //console.log($(".child-comment-form-"+comment_id).html())
  $('.child_comment_reply_textarea_'+comment_id).focus();

  $(this).attr('disabled','disabled');
}




$(function() {
  var toDoOnloadComment;
  toDoOnloadComment = function() {
//    $(".comment-reply").click(function() {
//      alert('dv')
//      var comment_id=this.id.split("-")[1]
//      $(".child-comment-form-"+comment_id).show();
//      //console.log($(".child-comment-form-"+comment_id).html())
//      $('.child_comment_reply_textarea_'+comment_id).focus();

//      $(this).attr('disabled','disabled');
////      $('#child_comment_reply_textarea_'+comment_id).live("keypress", function(e) {
////         var code = (e.keyCode ? e.keyCode : e.which);
////         if (code == 13 && e.shiftKey) {
////            var content = this.value;
////            //var caret = getCaret(this);
////            this.value = content + "\n"
////            //this.value = content.substring(0,caret)+"\n"+content.substring(caret,content.length-1);
////            $(this).attr('rows', parseInt($(this).attr('rows')) + 1)
////            e.preventDefault();
////            e.stopPropagation();
////         }
////         else if (code == 13) {
////            e.preventDefault();
////            e.stopPropagation();
////            $(this).closest('form').submit();
////            $(this).attr('rows', 1)
////         }
////      });
//    });
    
//    $(".comment-delete").click(function(){
//     var delcomment = confirm("Do you want to delete this comment ?");
//     if(delcomment == true)
//     {
//     var delete_comment_id=this.id.split("-")[2]
//       $("#comment-"+delete_comment_id).hide('slow');
//       return true;
//     }
//     else
//       {$("#comment-"+delete_comment_id).show();
//       return false;}
//     });

      $(".menu_btn").click(function(e) {
          e.stopPropagation();
          $(".main_menu").slideToggle("50");
          $(".search_option").slideUp("50");
      });   

		  $('.slider1').bxSlider({
			slideWidth: 200,
			minSlides: 2,
			maxSlides: 6,
			auto: true
		  });

      $(".dropdownbutton").click(function(e) {
        e.stopPropagation();
          $(".search_option").slideToggle("50");
           $(".main_menu").slideUp("50");
      });   

  $('html').on('click', function(e) {

  $('#atwho-ground-srch_job ul').hide('slow');
   $('.main_menu').slideUp('50');
   $('.search_option').slideUp('50');
  })
 
    $(".ads_box-delete").click(function(){
     var delcomment = confirm("Do you want to delete this Advertisement ?");
     if(delcomment == true)
     {
     var delete_comment_id=this.id.split("-")[2]
       $("#ads_box-"+delete_comment_id).hide('slow');
       return true;
     }
     else
       {$("#ads_box-"+delete_comment_id).show();
       return false;}
     }); 

    $(".portfolio_box-delete").click(function(){
     var delcomment = confirm("Do you want to delete this Portfolio ?");
     if(delcomment == true)
     {
     var delete_comment_id=this.id.split("-")[2]
       $("#portfolio_box-"+delete_comment_id).hide('slow');
       return true;
     }
     else
       {$("#portfolio_box-"+delete_comment_id).show();
       return false;}
     });  

// feedback deletes

    $(".feedback_box-delete").click(function(){
     var delcomment = confirm("Do you want to delete this reply ?");
     if(delcomment == true)
     {
     var delete_comment_id=this.id.split("-")[2]
       $("#feedback_box-"+delete_comment_id).hide('slow');
       return true;
     }
     else
       {$("#feedback_box-"+delete_comment_id).show();
       return false;}
     });  


// remove notifications from header

    $('#message-notice-menu').click(function(){
      $("#message-notice-menu #notification_count").hide();
    });

    $('#fat-menu').click(function(){
      $("#fat-menu #notification_count").hide();
    });

    $('#network-notice-menu').click(function(){
      $("#network-notice-menu #notification_count").hide();

    });

// delete the business page categories

    $(".menucat_box-delete").click(function(){
     var delcomment = confirm("Do you want to delete this Category ?");
     if(delcomment == true)
     {
     var delete_comment_id=this.id.split("-")[2]
       $("#menucat_box-"+delete_comment_id).hide('slow');
       return true;
     }
     else
       {$("#menucat_box-"+delete_comment_id).show();
       return false;}
     });  


// delete the business page menu_items

    $(".menuitem_box-delete").click(function(){
     var delcomment = confirm("Do you want to delete this Item ?");
     if(delcomment == true)
     {
     var delete_comment_id=this.id.split("-")[2]
       $("#menuitem_box-"+delete_comment_id).hide('slow');
       return true;
     }
     else
       {$("#menuitem_box-"+delete_comment_id).show();
       return false;}
     });  
  
 
//    
//    $(".affiliation-delete").click(function(){
//     var delcomment = confirm("Do you want to delete this Affiliation ?");
//     if(delcomment == true)
//     {
//     var delete_comment_id=this.id.split("-")[2]
//       $("#current_company-"+delete_comment_id).hide('slow');
//       return true;
//     }
//     else
//       {$("#current_company-"+delete_comment_id).show();
//       return false;}
//     });



//    $(".address-delete").click(function(){
//     var delcomment = confirm("Do you want to delete Address ?");
//     if(delcomment == true)
//     {
//     var delete_comment_id=this.id.split("-")[2]
//       $("#current_address-"+delete_comment_id).hide('slow');
//       return true;
//     }
//     else
//       {$("#current_address-"+delete_comment_id).show();
//       return false;}
//     });     
//     
    
    $(".video_box-delete").click(function(){
     var delcomment = confirm("Do you want to delete?");
     if(delcomment == true)
     {
     var delete_comment_id=this.id.split("-")[2]
       $("#video_box-"+delete_comment_id).hide('slow');
       return true;
     }
     else
       {$("#video_box-"+delete_comment_id).show();
       return false;}
     }); 
     
     
// delete images from uploads 
 
// $("#close").click(function() {
//  alert('hello')
//});
    
//    
//				 $(document).keyup(function(e) {
//				   if (e.keyCode == 27)
//				  {
//	           alert('hello')
//			  }
//				});	   



    
    $(".upload-delete").click(function(){
     var delupload = confirm("Do you want to delete?");
     if(delupload == true)
     {
     var delete_upload_id=this.id.split("-")[2]
       $("#alb-upload-"+delete_upload_id).hide('slow');
       return true;
     }
     else
       {$("#alb-upload-"+delete_upload_id).show();
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
    
 
/// for submit comment through enter press

  $('.comment_text_area').live("keypress", function(e) {
     var code = (e.keyCode ? e.keyCode : e.which);
     if (code == 13 && e.shiftKey) {
        var content = this.value;
        //var caret = getCaret(this);
        this.value = content + "\n"
        //this.value = content.substring(0,caret)+"\n"+content.substring(caret,content.length-1);
        $(this).attr('rows', parseInt($(this).attr('rows')) + 1)
        e.preventDefault();
        e.stopPropagation();
     }
     else if (code == 13) {
        e.preventDefault();
        e.stopPropagation();
        $(this).closest('form').submit();
        $(this).attr('rows', 1)
     }
  });
 
 
// $('#comment_body').keyup(function (event) {
//       if (event.keyCode == 13 && event.shiftKey) {
//           var content = this.value;
//           var caret = getCaret(this);
//           this.value = content.substring(0,caret)+"\n"+content.substring(carent,content.length-1);
//           event.stopPropagation();
//           
//      }else if(event.keyCode == 13)
//      {
//          event.preventDefault();
//          event.stopPropagation();
//          $('#new_comment').submit();
//      }
//});
 
  function getCaret(el) { 
    if (el.selectionStart) { 
      return el.selectionStart; 
    } else if (document.selection) { 
      el.focus(); 

      var r = document.selection.createRange(); 
      if (r == null) { 
        return 0; 
      } 

      var re = el.createTextRange(), 
          rc = re.duplicate(); 
      re.moveToBookmark(r.getBookmark()); 
      rc.setEndPoint('EndToStart', re); 

      return rc.text.length; 
    }  
    return 0; 
  }

 
////// for album Page slider 
 
				$("area[rel^='prettyPhoto']").prettyPhoto();
				
				$(".gallery:first a[rel^='prettyPhoto']").prettyPhoto({animation_speed:'normal',theme:'light_square',slideshow:3000, autoplay_slideshow: true});
				$(".gallery:gt(0) a[rel^='prettyPhoto']").prettyPhoto({animation_speed:'fast',slideshow:10000, hideflash: true});
		
				$("#custom_content a[rel^='prettyPhoto']:first").prettyPhoto({
					custom_markup: '<div id="map_canvas" style="width:260px; height:265px"></div>',
					changepicturecallback: function(){ initialize(); }
				});

				$("#custom_content a[rel^='prettyPhoto']:last").prettyPhoto({
					custom_markup: '<div id="bsap_1259344" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6"></div><div id="bsap_1237859" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6" style="height:260px"></div><div id="bsap_1251710" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6"></div>',
					changepicturecallback: function(){ _bsap.exec(); }
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
         if((this.files[0].size/2048/2048) > (1)){ // Max Photo Size 1MB
          alert("Picture is too big ! Maximum 2MB");
          $("#cover_img").val('');
          return false;
         }
         
         else{
          var fr = new FileReader;
    fr.onload = function() {
        var img = new Image;
        img.onload = function() {
          if (img.width<="400" || img.height<="100"){
          alert("Please choose an image that's at least 400 pixels wide and at least 150 pixels tall.");
          $("#cover_img").val('');
          return false;
          }
        $("#loading_img_quote").show();
        //$('#profile_cover_upload_modal_body').append('<img src="/assets/loader.gif" alt="loading" />')
        $('#cover_img_form').submit(); //better ways to do it ^^
//        $('.modal-scrollable').hide('slow');
//        $('.modal-backdrop.fade.in').hide();
//        $('.modal-backdrop.fade.in').disable();
        };
        img.src = fr.result;
    };
    fr.readAsDataURL(this.files[0]);
         }    
    
    });

/// Feature Image

    $("#user_feature_img").change(function (e) {
     var OrgFile = (this.files[0].name),
         FileName = OrgFile,
         FileExtension = FileName.split('.').pop().toLowerCase();
         
         if(FileName.indexOf(".")==-1 || FileExtension != "jpg" && FileExtension != "jpeg" && FileExtension != "png" && FileExtension != "gif" ){ // Curstom File Extension
          alert("This isn't a Photo !");
          $("#user_feature_img").val('');
          return false;
         }
         else
         if((this.files[0].size/1024/1024) > (1)){ // Max Photo Size 1MB
          alert("You Photo is too big !");
          $("#user_feature_img").val('');
          return false;
         }
         
         else{
          var fr = new FileReader;
    fr.onload = function() {
        var img = new Image;
        img.onload = function() {
          if (img.width<="100" || img.height<="250"){
          alert("Please choose an image that's at least 100 pixels wide and at least 250 pixels tall.");
          $("#cover_img").val('');
          return false;
          }
        $('#loading_img_for_feature_img').show();
        //$('#profile_cover_upload_modal_body').append('<img src="/assets/loader.gif" alt="loading" />')
        $('#feature_img_form').submit(); //better ways to do it ^^
//        $('.modal-scrollable').hide('slow');
//        $('.modal-backdrop.fade.in').hide();
//        $('.modal-backdrop.fade.in').disable();
        };
        img.src = fr.result;
    };
    fr.readAsDataURL(this.files[0]);
         }    
    
    });




    $("#album_cover").change(function (e) {
     var OrgFile = (this.files[0].name),
         FileName = OrgFile,
         FileExtension = FileName.split('.').pop().toLowerCase();
         
         if(FileName.indexOf(".")==-1 || FileExtension != "jpg" && FileExtension != "jpeg" && FileExtension != "png" && FileExtension != "gif" ){ // Curstom File Extension
          alert("This isn't a Photo !");
          $("#album_cover").val('');
          return false;
         }
         else
         if((this.files[0].size/1024/1024) > (1)){ // Max Photo Size 1MB
          alert("You Photo is too big !");
          $("#album_cover").val('');
          return false;
         }
         
         else{
          var fr = new FileReader;
    fr.onload = function() {
        var img = new Image;
        img.onload = function() {
          if (img.width<="150" || img.height<="150"){
          alert("Please choose an image that's at least 150 pixels wide and at least 150 pixels tall.");
          $("#album_cover").val('');
          return false;
          }
        $('#profile_cover_upload_modal_body').append('<img src="/assets/loader.gif" alt="loading" />')
//        $('.modal-scrollable').hide('slow');
//        $('.modal-backdrop.fade.in').hide();
//        $('.modal-backdrop.fade.in').disable();
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

    
    
    $("#album_img_form").submit(function(){
    var OrgFile = $(this).find("[type=file]");
     FileName = OrgFile.val();
    if (FileName == '')
    {
      alert('Please select the image for your album');
      return false;
    }
    else
    {
      alert('You have successfully added image to your album');
      return true;
    }
    });
    
    
    
    

    
//    $("#cover_img_form").submit(function(){
//    var OrgFile = $(this).find("[type=file]");
//     FileName = OrgFile.val();
//    if (FileName == '')
//    {
//      alert('Please select the image for your Cover photo');
//      return false;
//    }
//    else
//    {
//      alert('You have Successfully added your Cover Photo');
//      return true;
//    }
//    });

    
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
      return true;
    }
    }); 


    $("#new_update").submit(function(){
    var textarea = $("#feed-text")
    var attachment = $("#update_file_attachment")
     text = textarea.val();
     attch = attachment.val();
    if (text == '' && attch == '')
    {
      alert('Status cannot empty');
      return false;
    }
    else
    {
      $(".user_updates_ajax").show();
      return true;
      
    }
    }); 


    $("#edit_user").submit(function(){
    var birthdate = $("#user_birthdate")
     birth = birthdate.val();
    var rxDatePattern = /^(\d{4})(\/|-)(\d{1,2})(\/|-)(\d{1,2})$/;
	  var dtArray = birth.match(rxDatePattern); 
//    var objDate = new Date();
    var fullDate = new Date()
    //Thu May 19 2011 17:25:38 GMT+1000 {}
      
    //convert month to 2 digits
    var twoDigitMonth = ((fullDate.getMonth().length+1) === 1)? (fullDate.getMonth()+1) : '0' + (fullDate.getMonth()+1);
    var twoDigitDate = ((fullDate.getDate().length+1) === 1)? (fullDate.getDate()+1) : '0' + (fullDate.getDate()+1);  
    var currentDate = fullDate.getFullYear() + "-" + twoDigitMonth + "-" + twoDigitDate;
    //alert(currentDate)
    if (birth == '')
    {
      //alert('Please select D.O.B');
      return true;
    }
    else
      if (dtArray == null)
      {
        alert('D.O.B is not in valid format');
        return false;
      }
      else
        if(currentDate<birth)
        {
          alert("Date of Birth is greater than Current date");
          return false;    
        }
        else
        {
          return true;
        }
    });

   

    $("#new_tag").submit(function(){
      $('#loading_img_for_tag').show();  
    });

    $("#new_skill").submit(function(){
      $('#loading_img_for_userskill').show();  
    });

    $("#new_affiliation").submit(function(){
      
      //$('#loading_img_for_useraffiliation').show();  
    });



    $("#new_education").submit(function(){
    var instnamefield = $("#education_institute_name")
    var coursenamefield = $("#education_course_name")
    var startdate = $("#education_start_date")
    var enddate = $("#education_end_date")
     InstName = instnamefield.val();
     CorseName = coursenamefield.val();
     start = startdate.val();
     end = enddate.val();
     
     education_start_date
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
    if(start>=end)
    {
      alert('Start Year is not smaller than End Year');
      return false;
    }    
    
    else
    {
      $('#loading_img_for_usereducation').show();  
      //skillfield.val('');
      //alert('Eduction Successfully added');
      return true;
    }
    });
  
  
// for quote_form

    $("#new_quote").submit(function(){
    var name = $("#quote_name").val();
    var email = $("#quote_email").val();
    var contact = $("#quote_contact").val();
    var message = $("#quote_message").val();
     
    if (name == '')
    {
      alert('Please Enter Your Name');
      return false;
    }
    else
    if(email == '')
    {
          alert('Please Enter Your Email');
      return false;
    }
    else
    if(contact == '')
    {
          alert('Please Enter Contact Information');
      return false;
    }
    else
    if(message == '')
    {
          alert('Please Enter Your Message');
      return false;
    }       
    
    else
    {
      $("#loading_img_quote").show();
      return true;
    }
    });


// for menu_item

    $("#new_menuitem").submit(function(){
    var name = $("#menuitem_name").val();
    var price = $("#menuitem_price").val();
     
    if (name == '')
    {
      alert('Please Enter Item Name');
      return false;
    }
    else
    if(price == '')
    {
          alert('Please Enter Item Price');
      return false;
    }
    else
    {
      return true;
    }
    });



// for feedback reply



    $("#new_feedback_reply").submit(function(){
    var name = $("#feedback_reply_message").val();
     
    if (name == '')
    {
      $('#feedback_reply_message').css("border-color","#FF0000");
      $('#feedback_reply_message').css("box-shadow","0 0 1px #FF0000");
      return false;
    }

    else
    {
      $('#feedback_reply_message').css("border-color","none")
      $('#feedback_reply_message').css("box-shadow","none");
      $('#loading_img_for_feedback').show();
      return true;
    }
    });


    $("#new_feedback").submit(function(){
      $('#loading_img_for_feedback_form').show();
      return true;
    });



// for menus

    $("#new_menucategory").submit(function(){
    var name = $("#menucategory_name").val();
     
    if (name == '')
    {
      alert('Please Enter Menu Name');
      return false;
    }
    else
    {
      return true;
    }
    });
  
 
  $("#video_file_attachment").change(function (e) {
    var target = $(e.target);
    var OrgFile = (this.files[0].name),
    FileName = OrgFile,
    FileExtension = FileName.split('.').pop().toLowerCase();
     if((this.files[0].size/1024/1024) > (10)){ // Max Photo Size 1MB
      alert("Please Upload video below 10 MB");
      $("#video_file_attachment").val('');
      return false;
     } 
    else
    {
      return true;
    }
  }); 
 

    $("#new_video").submit(function(){
    var name = $("#video_name").val();
    var FileName =  $("#video_file_attachment").val();
    var FileExtension = FileName.split('.').pop().toLowerCase();
    if (name == '')
    {
      alert('Please Enter Video Name');
      return false;
    }
//     else
//     if((this.files[0].size/1024/1024) > (1)){ // Max Photo Size 10MB
//      return false;
//     }
    else
    if (FileName == '')
    {
      alert('Please select video to upload');
      return false;
    }   
    else
    if(FileName.indexOf(".")==-1 || FileExtension != "mp4" && FileExtension != "3gp" && FileExtension != "ogg" && FileExtension != "mpeg" && FileExtension != "flv" && FileExtension != "mpg" && FileExtension != "webm" && FileExtension != "mp3" && FileExtension != "wma" && FileExtension != "ogg" && FileExtension != "ogv"){ // Curstom File Extension
      alert("unsupported format, please upload flv, mp4, 3gp, mp3, ogg...");
      $("#video_file_attachment").val('');
      return false;
     }
    else
    {
      $('#loading_img_for_video').show();
      return true;
    }
    });
 

  
    
        $("#new_album").submit(function(){
    var albumnamefield = $("#album_name")
    var albumcover = $("#album_cover")
     albumName = albumnamefield.val();
     album_cover_img = albumcover.val(); 
    if (albumName == '')
    {
      alert('Please Enter Portfolio Name');
      return false;
    }

    else 
    if(album_cover_img == '')
    {
      alert("Please Select the Picture for Album Cover")
      return false;
    
    }
    else
    {
      $('#loading_img_for_album_cover').show();
      //skillfield.val('');
      //alert('Successfully added');
      return true;
    }
    });      





//  for organization for


  $("#new_organization").submit(function(){
    var name = $("#organization_name").val();
    var start_date = $("#organization_start_date").val();
    var d = new Date();
    var month = d.getMonth()+1;
    var day = d.getDate();

    var output = d.getFullYear() + '-' +
        (month<10 ? '0' : '') + month + '-' +
        (day<10 ? '0' : '') + day;    
    if (name == '')
    {
      alert("Please enter the organization name");
      return false;
    }

    else 
    if(start_date == '')
    {
      alert("Please Select the Organization start date")
      return false;
    }
    else
    if(start_date > output)
    {
      alert("Provided date is not valid, please select from current or previous date")
      return false;
    }
    else
    {
      $('#loading_img_for_organization').show();
      return true;
    }
    });  




/// for event form


  $("#new_event").submit(function(){
    var title = $("#event_title").val();
    var start_date = $("#event_start").val();
    var end_date = $("#event_end").val();
    var descr = $("#event_description").val();
    
    var d = new Date();
    var month = d.getMonth()+1;
    var day = d.getDate();

    var output = d.getFullYear() + '-' +
        (month<10 ? '0' : '') + month + '-' +
        (day<10 ? '0' : '') + day;    
    if (title == '')
    {
      alert("Please enter title of event");
      return false;
    }
    else 
    if(descr == '')
    {
      alert("Please enter description of event")
      return false;
    }
    else 
    if(start_date == '')
    {
      alert("Please Select the event start date")
      return false;
    }
    else
    if(start_date < output)
    {
      alert("Provided date is not valid, please select from current or previous date")
      return false;
    }
    else 
    if(end_date == '')
    {
      alert("Please Select the event end date")
      return false;
    }
    else 
    if(start_date > end_date)
    {
      alert("Event end date is not previous from event start date")
      return false;
    }        
    else
    {
      $('#loading_img_for_event').show();
      return true;
    }
    }); 





///////// for Jobs form

    $("#new_advertisement").submit(function(){
    var adtitlefield = $("#advertisement_title")
    var adsloganfield = $("#advertisement_slogan")
    var adlinkfield = $("#advertisement_link")
    var adimagefield = $("#advertisement_file_attachment")
    var re = /(http(s)?:\\)?([\w-]+\.)+[\w-]+[.com|.in|.org]+(\[\?%&=]*)?/
     title = adtitlefield.val();
     slogan = adsloganfield.val();
     link = adlinkfield.val();
     image = adimagefield.val();     
    if (title == '')
    {
      alert('Please Enter Advertisement Title:');
      return false;
    }
    
    else
    if(link == '')
    {
      alert('Please Enter advertisement contact link:');
      return false;
    }
    else
    if(!re.test(link))
    {
      alert('Please Enter Valid advertisement contact link:');
      return false;    
    }
    else
    if(image == '')
    {
      alert('Please Select picture for advertisement cover:');
      return false;
    }
    else
    {
      return true;
    }
    }); 

    
    $("#advertisement_file_attachment").change(function (e) {
     var OrgFile = (this.files[0].name),
         FileName = OrgFile,
         FileExtension = FileName.split('.').pop().toLowerCase();
         
         if(FileName.indexOf(".")==-1 || FileExtension != "jpg" && FileExtension != "jpeg" && FileExtension != "png" && FileExtension != "gif" ){ // Curstom File Extension
          alert("This isn't a Photo !");
          $("#advertisement_file_attachment").val('');
          return false;
         }
         else
         if((this.files[0].size/1024/1024) > (1)){ // Max Photo Size 1MB
          alert("You Photo is too big !");
          $("#advertisement_file_attachment").val('');
          return false;
         }
         
         else{
          var fr = new FileReader;
    fr.onload = function() {
        var img = new Image;
        img.onload = function() {
          if (img.width<="200" || img.height<="150"){
          alert("Please choose an image that's at least 200 pixels wide and at least 150 pixels tall.");
          $("#advertisement_file_attachment").val('');
          return false;
          }
        };
        img.src = fr.result;
    };
    fr.readAsDataURL(this.files[0]);
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
     var target = $(e.target);
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
          $("#featureimg_feature_img").val('');
          return false;
         }         
         
         else{
          var fr = new FileReader;
    fr.onload = function() {
        var img = new Image;
        img.onload = function() {
          if (img.height<="400")
           {
          alert("Please choose an image that's at least 400 pixels tall.");
          $("#profile_img").val('');
          return false;
          }
        $('#loading_img_for_profile').show();
        $('#profile_img_form').submit(); //better ways to do it ^^
//        $('.modal-scrollable').hide('slow');
//        $('.modal-backdrop.fade.in').hide();
        };
            img.src = fr.result;
        
        };
        fr.readAsDataURL(this.files[0]);
          
        
         }    
    
    });  
 



    $("#featureimg_feature_img").change(function (e) {
     var target = $(e.target);
     var OrgFile = (this.files[0].name),
         FileName = OrgFile,
         FileExtension = FileName.split('.').pop().toLowerCase();
         
         if(FileName.indexOf(".")==-1 || FileExtension != "jpg" && FileExtension != "jpeg" && FileExtension != "png" && FileExtension != "gif" ){ // Curstom File Extension
          alert("This isn't a Photo !");
          $("#featureimg_feature_img").val('');
          return false;
         }
         else
         if((this.files[0].size/1024/1024) > (1)){ // Max Photo Size 1MB
          alert("You Photo is too big !");
          $("#featureimg_feature_img").val('');
          return false;
         }
         
         else{
          var fr = new FileReader;
    fr.onload = function() {
        var img = new Image;
        img.onload = function() {
          if (img.width<="50")
           {
          alert("Please choose an image that's at least 300 pixels wide and at least 300 pixels tall.");
          $("#featureimg_feature_img").val('');
          return false;
          }
        $('#loading_img_for_feature_img').show();
        $('#new_featureimg').submit(); //better ways to do it ^^
//        $('.modal-scrollable').hide('slow');
//        $('.modal-backdrop.fade.in').hide();
        };
            img.src = fr.result;
        
        };
        fr.readAsDataURL(this.files[0]);
          
        
         }    
    
    });
 
    
      
 
//       $('#profile_img').change(function(event){
//        var target = $(event.target);

//        if(target.val() != ''){
//          $(target.parents('form').get(0)).submit(); //better ways to do it ^^
//          event.stopPropagation();
//          return false;
//        }
//      });
 
//     $("#profile_img_form").submit(function(){
//    var OrgFile = $(this).find("[type=file]");
//     FileName = OrgFile.val();
//    if (FileName == '')
//    {
//      alert('Please select the image for your Profile photo');
//      return false;
//    }
//    else
//    {
//      alert('You have Successfully added your Profile Photo');
//      return true;
//    }
//    });   


    $(document).ready(function () {
        $(document).ajaxStop(function () {
            $(".user_updates_ajax").hide();
            $("#loading_img_quote").hide();
            $("#loading_img_for_profile").hide();
            $('#loading_img_for_feature_img').hide();
            $('#loading_img_for_album_cover').hide();
            $('#loading_img_for_video').hide();
            $('#loading_img_for_feedback').hide();
            $('#loading_img_for_feedback_form').hide();
            $('#loading_img_for_tag').hide();
            $('#loading_img_for_userskill').hide();
            $('#loading_img_for_usereducation').hide();
            $('#loading_img_for_srhorgn').hide();
            $('#loading_img_for_useraffiliation').hide();
            $("#loading_img_for_feature_img").hide();
            $('#loading_img_for_organization').hide();
            $('#loading_img_for_event').hide();
            
            
        });
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

    //Hover Effect on View Portfolio Banner Hover
       /*$(".view_portfolio").mouseover(function() {
         $(".view_portfolio").css("display","none");
         $(".view_portfolio_on_hover").css("display","inline-block");
        });

       $(".view_portfolio_on_hover").mouseleave(function() {
         $(".view_portfolio").css("display","inline-block");
         $(".view_portfolio_on_hover").css("display","none");
        });   */       

    //Hover Effect on Promote Portfolio Banner Hover
      /* $(".post_portfolio").mouseover(function() {
         $(".post_portfolio").css("display","none");
         $(".post_portfolio_on_hover").css("display","inline-block");
        });

       $(".post_portfolio_on_hover").mouseleave(function() {
         $(".post_portfolio").css("display","inline-block");
         $(".post_portfolio_on_hover").css("display","none");
        });  */            
          
  }
  $(document).ready(toDoOnloadComment);
  $(document).on('page:load', toDoOnloadComment);
});

