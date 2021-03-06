jQuery(document).ready(function(){
    jQuery('#network_tab_follower').live('click', function(event) {        
         $('img', this).attr('src', function(i, oldSrc) {
          return oldSrc == '/assets/network_img2.png' ? '/assets/network_img3.png' : '/assets/network_img2.png';
         });
         jQuery('.social_user').toggle('show');
         return false;
    });
    
    jQuery('#network_tab_following').live('click', function(event) {        
         $('img', this).attr('src', function(i, oldSrc) {
          return oldSrc == '/assets/network_img2.png' ? '/assets/network_img3.png' : '/assets/network_img2.png';
         });         
         jQuery('.socail_share').toggle('show');
         return false;
    });
    
    jQuery('#network_tab_connected').live('click', function(event) {        
         $('img', this).attr('src', function(i, oldSrc) {
          return oldSrc == '/assets/network_img2.png' ? '/assets/network_img3.png' : '/assets/network_img2.png';
         });         
         jQuery('.connt_user').toggle('show');
         return false;
    });    
    jQuery('.txt').live('click', function(event) {        
         jQuery('.uiMenu').toggle('show');
         return false;
    }); 
    
    jQuery('.uiButtonText').live('click', function(event) {        
         jQuery('.uiMenucover').toggle('show');
         return false;
    });  
   
    jQuery('#get_quote_form').live('click', function(event) {        
         jQuery('.Quote_form').toggle('show');
         return false;
    });   
    
    jQuery('#srh-checkbox').live('click', function(event) {
        if($(this).is(':checked')){
            $("#port_sub_check_box2-"+this.value).attr('src','/assets/checked.png');
            $("#srch-field-name-"+this.value).css("color","#69893F")
        }
        else
        {
            $("#port_sub_check_box2-"+this.value).attr('src',"/assets/uncheck.png");
            $("#srch-field-name-"+this.value).css("color","#AEAEAE")
   }
   
    });
 
    jQuery('#job_ads_srch').live('click', function(event) {        
          var btn_text = $(this).html();
          //alert(btn_text);
          //event.stopPropagation();
          if(btn_text == 'Search People, Business Here')
          {
             $(this).html('Search Jobs, Advertisements Here');
             $('#srch_profile').show('50');
             $('#srch_job').hide('50');
            $('#srch_profile').val('');
             $('#srch_job').val('');             
             //alert('kk');
          
          }
          else if (btn_text == 'Search Jobs, Advertisements Here')
          {
             $('#srch_profile').hide('50');
             $('#srch_job').show('50');
            $('#srch_profile').val('');
             $('#srch_job').val('');                
            $(this).html('Search People, Business Here');
            return false;
          }
          else
          {
             $('#srch_profile').hide('50');
             $('#srch_job').show('50');
            $('#srch_profile').val('');
             $('#srch_job').val('');                
            $(this).html('Search People, Business Here');
            return false;
          }


    });  
   


    jQuery('#popular_portfolio_link').live('click', function(event) {
      $('#recent_portfolio_link').removeClass('active');
      $('#comment_portfolio_link').removeClass('active');
      $(this).addClass('active');
      $('#popular_portfolio').show('slow');
      $('#recent_portfolio').hide('slow');
      $('#commented_portfolio').hide('slow');
      $('#popular_portfolio_link').css("background","#FFFFFF")
      $('#recent_portfolio_link').css("background","#E6E6E6")
      $('#comment_portfolio_link').css("background","#E6E6E6")
      $('#popular_portfolio_link').css("color","#43474D")
      $('#recent_portfolio_link').css("color","#43474D")
      $('#comment_portfolio_link').css("color","#43474D")      
    }); 
    
    jQuery('#recent_portfolio_link').live('click', function(event) {
      $('#popular_portfolio_link').removeClass('active');
      $('#comment_portfolio_link').removeClass('active');
        $(this).addClass('active');    
      $('#popular_portfolio').hide('slow');
      $('#recent_portfolio').show('slow');
      $('#commented_portfolio').hide('slow');
      $('#popular_portfolio_link').css("background","#E6E6E6")
      $('#recent_portfolio_link').css("background","#FFFFFF")
      $('#comment_portfolio_link').css("background","#E6E6E6") 
      $('#popular_portfolio_link').css("color","#43474D")
      $('#recent_portfolio_link').css("color","#43474D")
      $('#comment_portfolio_link').css("color","#43474D")            
    });     
    
    jQuery('#comment_portfolio_link').live('click', function(event) {
      $('#popular_portfolio_link').removeClass('active');
      $('#recent_portfolio_link').removeClass('active');
        $(this).addClass('active');    
      $('#popular_portfolio').hide('slow');
      $('#recent_portfolio').hide('slow');
      $('#commented_portfolio').show('slow');
      $('#popular_portfolio_link').css("background","#E6E6E6")
      $('#recent_portfolio_link').css("background","#E6E6E6")
      $('#comment_portfolio_link').css("background","#FFFFFF")  
      $('#popular_portfolio_link').css("color","#43474D")
      $('#recent_portfolio_link').css("color","#43474D")
      $('#comment_portfolio_link').css("color","#43474D")   
    });      
    

    jQuery('#bnss_agenda_link').live('click', function(event) {
      $('#bnss_summary').hide('slow');
      $('#bnss_services').hide('slow');
      $('#bnss_about').hide('slow');
      $('#bnss_agenda').show('slow');
      $('#bnss_summary_link').css("background","#fff")
      $('#bnss_summary_link').css("color","#69873F")     
      $('#bnss_services_link').css("background","#fff")
      $('#bnss_services_link').css("color","#69873F")  
      $('#bnss_about_link').css("background","#fff")
      $('#bnss_about_link').css("color","#69873F")  
      $('#bnss_agenda_link').css("background","#69873F")
      $('#bnss_agenda_link').css("color","#FFFFFF")                    
    });

    jQuery('#bnss_services_link').live('click', function(event) {
      $('#bnss_summary').hide('slow');
      $('#bnss_services').show('slow');
      $('#bnss_about').hide('slow');
      $('#bnss_agenda').hide('slow');
      $('#bnss_summary_link').css("background","#fff")
      $('#bnss_summary_link').css("color","#69873F")     
      $('#bnss_services_link').css("background","#69873F")
      $('#bnss_services_link').css("color","#FFFFFF")  
      $('#bnss_about_link').css("background","#fff")
      $('#bnss_about_link').css("color","#69873F")  
      $('#bnss_agenda_link').css("background","#fff")
      $('#bnss_agenda_link').css("color","#69873F")       
    });
    
    jQuery('#bnss_about_link').live('click', function(event) {
      $('#bnss_summary').hide('slow');
      $('#bnss_services').hide('slow');
      $('#bnss_about').show('slow');
      $('#bnss_agenda').hide('slow');
      $('#bnss_summary_link').css("background","#fff")
      $('#bnss_summary_link').css("color","#69873F")     
      $('#bnss_services_link').css("background","#fff")
      $('#bnss_services_link').css("color","#69873F")  
      $('#bnss_about_link').css("background","#69873F")
      $('#bnss_about_link').css("color","#FFFFFF")  
      $('#bnss_agenda_link').css("background","#fff")
      $('#bnss_agenda_link').css("color","#69873F")       
    });

    jQuery('#bnss_summary_link').live('click', function(event) {
      $('#bnss_summary').show('slow');
      $('#bnss_services').hide('slow');
      $('#bnss_about').hide('slow');
      $('#bnss_agenda').hide('slow');
      $('#bnss_summary_link').css("background","#69873F")
      $('#bnss_summary_link').css("color","#FFFFFF")     
      $('#bnss_services_link').css("background","#fff")
      $('#bnss_services_link').css("color","#69873F")  
      $('#bnss_about_link').css("background","#fff")
      $('#bnss_about_link').css("color","#69873F")  
      $('#bnss_agenda_link').css("background","#fff")
      $('#bnss_agenda_link').css("color","#69873F")         
    });
    
	    /*$(".mobile_menu_btn").click(function(){
	      $("#man_nav").toggleClass("mobile_menu");
	    });*/
            $(".mobile_menu_btn").click(function(){
	      $("#man_nav").slideToggle();
	    });

    
    jQuery('#affiliation_status').live('click', function(event) {
        if($(this).is(':checked')){
            
            $(".aff_end_period").hide();
            $("#affiliation_end_date").val('');
            $("#aff_work_status").show();
        }
        else
        {
            $(".aff_end_period").show();
            $("#aff_work_status").hide();
   }
   
    });    
    
 
    jQuery('#sub_srh-checkbox').live('click', function(event) {
        if($(this).is(':checked')){
            $("#port_sub_check_box2-"+this.value).attr('src','/assets/checked.png');
            $("#srch-field-name-"+this.value).css("color","#69893F")
        }
        else
        {
            $("#port_sub_check_box2-"+this.value).attr('src',"/assets/uncheck.png");
            $("#srch-field-name-"+this.value).css("color","#AEAEAE")
   }
   
    });


      jQuery('#location_old_country_id').live('change', function(event) {
        var cunt_data = $(this).val()
        if(cunt_data == 0)
        {
         $('#new_country_name').show();
         $('#new_state_name').show();
         $('#new_city_name').show();
         $('#new_pin_code').show();
         $('#street_address').show();
         $('#longitude_address').show();
         $('#latitude_address').show();
         $('#address_status').show();
         $('#country_save_btn').show();
         $('#state_name').hide();
         $('#user_city_name').hide();
         $('#user_pin_code').hide();
         $('#form_country_container').show();
         
        }
        else if(cunt_data == 'null')
        {
          $('#new_country_name').hide();
          $('#new_state_name').hide();
         $('#new_city_name').hide();
         $('#new_pin_code').hide();
         $('#street_address').hide();
         $('#longitude_address').hide();
         $('#latitude_address').hide();
         $('#address_status').hide();
         $('#country_save_btn').hide();          
          $('#state_name').hide();
          $('#location_country_id').val('');
          $('#user_city_name').hide();
          $('#user_pin_code').hide();
          
        }
        else 
        {
          $.get("/countries/"+ cunt_data+ ".js", {}, function(data) {
        }); 
          $('#new_country_name').hide();
          $('#new_state_name').hide();
         $('#new_city_name').hide();
         $('#new_pin_code').hide();
         $('#street_address').hide();
         $('#longitude_address').hide();
         $('#latitude_address').hide();
         $('#address_status').hide();
         $('#country_save_btn').hide();          
          $('#state_name').show();
          $('#location_country_id').val('');
          $('#user_city_name').hide();
          $('#user_pin_code').hide();
        
        }
           
      });

  
      jQuery('#location_old_state_id').live('change', function(event) {
        var cunt_data = $(this).val()
        if(cunt_data == 0)
        {
         $('#new_state_name').show();
         $('#new_city_name').show();
         $('#new_pin_code').show();
         $('#street_address').show();
         $('#longitude_address').show();
         $('#latitude_address').show();
         $('#address_status').show();
         $('#country_save_btn').show();
         $('#user_city_name').hide();
         $('#user_pin_code').hide();
         
        }
        else if(cunt_data == 'null')
        {
          $('#new_state_name').hide();
         $('#new_city_name').hide();
         $('#new_pin_code').hide();
         $('#street_address').hide();
         $('#longitude_address').hide();
         $('#latitude_address').hide();
         $('#address_status').hide();
         $('#country_save_btn').hide();          
          $('#user_city_name').hide();
          $('#user_pin_code').hide();
        
        }
        
        else 
        {
           $.get("/states/"+ cunt_data+ ".js", {}, function(data) {
        }); 
        
          $('#new_state_name').hide();
         $('#new_city_name').hide();
         $('#new_pin_code').hide();
         $('#street_address').hide();
         $('#longitude_address').hide();
         $('#latitude_address').hide();
         $('#address_status').hide();
         $('#country_save_btn').hide();          
          $('#state_name').show();
          $('#user_city_name').show();
          $('#user_pin_code').hide();
        
        }
           
      });  
  
 
      jQuery('#location_old_city_id').live('change', function(event) {
        var cunt_data = $(this).val()
        if(cunt_data == 0)
        {
         $('#new_city_name').show();
         $('#new_pin_code').show();
         $('#street_address').show();
         $('#longitude_address').show();
         $('#latitude_address').show();
         $('#address_status').show();
         $('#country_save_btn').show();
         $('#user_pin_code').hide();
        }
        
        else if(cunt_data == 'null')
        { 
         $('#new_city_name').hide();
         $('#new_pin_code').hide();
         $('#street_address').hide();
         $('#longitude_address').hide();
         $('#latitude_address').hide();
         $('#address_status').hide();
         $('#country_save_btn').hide();
         $('#country_save_btn').hide();
         $('#user_pin_code').hide();
        }
        else 
        {
           $.get("/cities/"+ cunt_data+ ".js", {}, function(data) {
        }); 
         $('#new_city_name').hide();
         $('#new_pin_code').hide();
         $('#street_address').hide();
         $('#longitude_address').hide();
         $('#latitude_address').hide();
         $('#address_status').hide();
         $('#country_save_btn').hide();
         $('#country_save_btn').hide();
         $('#user_pin_code').show();          
        
        }
           
      });  


      jQuery('#location_old_pin_id').live('change', function(event) {
        var cunt_data = $(this).val()
        if(cunt_data == 0)
        {
         $('#new_pin_code').show();
         $('#street_address').show();
         $('#longitude_address').show();
         $('#latitude_address').show();
         $('#address_status').show();
         $('#country_save_btn').show();
        }
        
        else if(cunt_data == 'null')
        { 
        
         $('#new_pin_code').hide();
         $('#street_address').hide();
         $('#longitude_address').hide();
         $('#latitude_address').hide();
         $('#address_status').hide();
         $('#country_save_btn').hide();               
        
        }        
        else 
        {
          $('#new_pin_code').hide();
         $('#street_address').show();
         $('#longitude_address').show();
         $('#latitude_address').show();
         $('#address_status').show();
         $('#country_save_btn').show();       
        
        }
           
      }); 
 
      jQuery("#new_location").submit(function(event){
          var new_country_name = $("#location_new_country")
          var new_state_name = $("#location_new_state")
          var new_city_name = $("#location_new_city")
          var new_pin_name = $("#location_new_pin")
          var new_street_name = $("#location_street_address")
            country = new_country_name.val();
            state = new_state_name.val();
            city = new_city_name.val();
            pin = new_pin_name.val();
            street = new_street_name.val();        
        var country_id = $("#location_old_country_id").val();
        if(country_id == 0)
        { 
            if( country == "")
            {
              alert("Please Enter the Country Name")
              return false;
            }
            else if( state == "")
            {
              alert("Please Enter the State/Province Name")
              return false;
            }
            else if( city == "")
            {
              alert("Please Enter the City Name")
              return false;
            }
//            else if( pin == "")
//            {
//              alert("Please Enter the Pin/zipcode")
//              return false;
//            }                                    
//            else if( street == "")
//            {
//              alert("Please Enter the Street Address")
//              return false;
//            }
          else
          {
              return true;  
          }
       
        }
        var state_id = $("#location_old_state_id").val();
        if(state_id == 0)
        { 

            if( state == "")
            {
              alert("Please Enter the State/Province Name")
              return false;
            }
            else if( city == "")
            {
              alert("Please Enter the City Name")
              return false;
            }
//            else if( pin == "")
//            {
//              alert("Please Enter the Pin/zipcode")
//              return false;
//            }                                    
//            else if( street == "")
//            {
//              alert("Please Enter the Street Address")
//              return false;
//            }
          else
          {
              return true;  
          }
       
        }
        
        var city_id = $("#location_old_city_id").val();
        if(city_id == 0)
        { 
           if( city == "")
            {
              alert("Please Enter the City Name")
              return false;
            }
//            else if( pin == "")
//            {
//              alert("Please Enter the Pin/zipcode")
//              return false;
//            }                                    
//            else if( street == "")
//            {
//              alert("Please Enter the Street Address")
//              return false;
//            }
          else
          {
              return true;  
          }
       
        }        
        
        var pin_id = $("#location_old_pin_id").val();
//        if(pin_id == 0)
//        { 
//           if( pin == "")
//            {
//              alert("Please Enter the Pin/zipcode")
//              return false;
//            }                                    
//            else if( street == "")
//            {
//              alert("Please Enter the Street Address")
//              return false;
//            }
//          else
//          {
//              return true;  
//          }
//       
//        }        
        
         });  


    
});







