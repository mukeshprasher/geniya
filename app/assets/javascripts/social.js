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
          $('#form_country_container').show();
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
 
  
    
    
});







