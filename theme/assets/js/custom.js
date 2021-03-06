
jQuery.fn.single_double_click = function(single_click_callback, double_click_callback, timeout) {

  return this.each(function(){
    var clicks = 0, self = this;
    jQuery(this).click(function(event){
      clicks++;
      if (clicks == 1) {
        setTimeout(function(){
          if(clicks == 1) {
            single_click_callback.call(self, event);
          } else {
            double_click_callback.call(self, event);
          }
          clicks = 0;
        }, timeout || 200);
      }
    });
  });
}  


jQuery("button.doubleClick").single_double_click(function (e) {
	var double_class= jQuery(this).data('singleatt');
	location.href = double_class;
}, function () {
	var double_class= jQuery(this).data('doubleatt');
	jQuery(double_class).click();
});
























var countryStateInfo = {
  "India": {
    "Assam": {
      "Dispur": ["1"],
      "Guwahati" : ["1"]
    },
    "Gujarat": {
      "Vadodara" : ["1"],
      "Surat" : ["1"]
    },
    "Tamilnadu": {
      "Chennai" : ["1"],
      "Coimbatore" : ["1"],
      "Madurai" : ["1"],
      "Tiruchirappalli" : ["1"],
      "Salem" : ["1"],
      "Tirunelveli" : ["1"],
      "Tiruppur" : ["1"],
      "Ranipet" : ["1"],
      "Nagercoil" : ["1"],
      "Thanjavur" : ["1"],
      "Vellore" : ["1"],
      "Kancheepuram" : ["1"],
      "Erode" : ["1"],
      "Tiruvannamalai" : ["1"],
      "Pollachi" : ["1"],
      "Rajapalayam" : ["1"],
      "Sivakasi" : ["1"],
      "Pudukkottai" : ["1"],
      "Neyveli" : ["1"],
      "Nagapattinam" : ["1"],
      "Viluppuram" : ["1"],
      "Tiruchengode" : ["1"],
      "Vaniyambadi" : ["1"],
      "Theni Allinagaram" : ["1"],
      "Udhagamandalam" : ["1"],
      "Aruppukkottai" : ["1"],
      "Paramakudi" : ["1"],
      "Arakkonam" : ["1"],
      "Virudhachalam" : ["1"],
      "Srivilliputhur" : ["1"],
      "Tindivanam" : ["1"],
      "Virudhunagar" : ["1"],
      "Karur" : ["1"],
      "Valparai" : ["1"],
      "Sankarankovil" : ["1"],
      "Tenkasi" : ["1"],
      "Palani" : ["1"],
      "Pattukkottai" : ["1"],
      "Tirupathur" : ["1"],
      "Ramanathapuram" : ["1"],
      "Udumalaipettai" : ["1"],
      "Gobichettipalayam" : ["1"],
      "Thiruvarur" : ["1"],
      "Thiruvallur" : ["1"],
      "Panruti" : ["1"],
      "Namakkal" : ["1"],
      "Thirumangalam" : ["1"],
      "Vikramasingapuram" : ["1"],
      "Nellikuppam" : ["1"],
      "Rasipuram" : ["1"],
      "Tiruttani" : ["1"],
      "Nandivaram Guduvancheri" : ["1"],
      "Periyakulam" : ["1"],
      "Pernampattu" : ["1"],
      "Vellakoil" : ["1"],
      "Sivaganga" : ["1"],
      "Vadalur" : ["1"],
      "Rameshwaram" : ["1"],
      "Tiruvethipuram" : ["1"],
      "Perambalur" : ["1"],
      "Usilampatti" : ["1"],
      "Vedaranyam" : ["1"],
      "Sathyamangalam" : ["1"],
      "Puliyankudi" : ["1"],
      "Nanjikottai" : ["1"],
      "Thuraiyur" : ["1"],
      "Sirkali" : ["1"],
      "Tiruchendur" : ["1"],
      "Periyasemur" : ["1"],
      "Sattur" : ["1"],
      "Vandavasi" : ["1"],
      "Tharamangalam" : ["1"],
      "Tirukkoyilur" : ["1"],
      "Oddanchatram" : ["1"],
      "Palladam" : ["1"],
      "Vadakkuvalliyur" : ["1"],
      "Tirukalukundram" : ["1"],
      "Uthamapalayam" : ["1"],
      "Surandai" : ["1"],
      "Sankari" : ["1"],
      "Shenkottai" : ["1"],
      "Vadipatti" : ["1"],
      "Sholingur" : ["1"],
      "Tirupathur" : ["1"],
      "Manachanallur" : ["1"],
      "Viswanatham" : ["1"],
      "Polur" : ["1"],
      "Panagudi" : ["1"],
      "Uthiramerur" : ["1"],
      "Thiruthuraipoondi" : ["1"],
      "Pallapatti" : ["1"],
      "Ponneri" : ["1"],
      "Lalgudi" : ["1"],
      "Natham" : ["1"],
      "Unnamalaikadai" : ["1"],
      "P.N.Patti" : ["1"],
      "Tharangambadi" : ["1"],
      "Tittakudi" : ["1"],
      "Pacode" : ["1"],
      "O' Valley" : ["1"],
      "Suriyampalayam" : ["1"],
      "Sholavandan" : ["1"],
      "Thammampatti" : ["1"],
      "Namagiripettai" : ["1"],
      "Peravurani" : ["1"],
      "Parangipettai" : ["1"],
      "Pudupattinam" : ["1"],
      "Pallikonda" : ["1"],
      "Sivagiri" : ["1"],
      "Punjaipugalur" : ["1"],
      "Padmanabhapuram" : ["1"],
      "Thirupuvanam" : ["1"],
    }
  }
}


window.onload = function () {
  
  if(document.getElementById("countySel") !== null) {
  //Get html elements
    var countySel = document.getElementById("countySel");
    var stateSel = document.getElementById("stateSel"); 
    var citySel = document.getElementById("citySel");
   
    //Load countries
    for (var country in countryStateInfo) {
      countySel.options[countySel.options.length] = new Option(country, country);
    }
    
    //County Changed
    countySel.onchange = function () {
       
       stateSel.length = 1; // remove all options bar first
       citySel.length = 1; // remove all options bar first
       jQuery('#stateSel').change();
       jQuery('#citySel').change();
       
       if (this.selectedIndex < 1)
         return; // done
       
       for (var state in countryStateInfo[this.value]) {
         stateSel.options[stateSel.options.length] = new Option(state, state);
       }
    }
    
    //State Changed
    stateSel.onchange = function () {    
       
       citySel.length = 1; // remove all options bar first
       jQuery('#citySel').change();

       if (this.selectedIndex < 1)
         return; // done
       
       for (var city in countryStateInfo[countySel.value][this.value]) {
         citySel.options[citySel.options.length] = new Option(city, city);
       }
    }    
  }
  
  
}




function questionEditor(data) {
    if(jQuery('#question_type').val() == 3) {

        var text = tinymce.get('main_question').getBody().innerHTML; 
        var numbers_txt = [];                   
        numbers_txt = text.match(/\{([A-Z])\}/gi);
        numbers = (!numbers_txt) ? [] : numbers_txt;

        var numbers = numbers.map(function (e) {
            return getOptionKey(e);
        });

        var ans_data = [];
        if(jQuery('.blank_num').length > 0) {
            ans_data = jQuery('.blank_num').map(function () {
                return jQuery(this).attr("data-blanknum");
            }).toArray();
        }

        var diffe = ( (ans_data).diff(numbers) ); 
        diffe = (!diffe) ? [] : diffe;
        diffe.forEach(function(n){
            jQuery('[data-blanknum="'+n+'"]').remove();
        });

        if(numbers && numbers.length > 0 ) {


            numbers.forEach(function(num) {

                var txt = "<div class=\'col-lg-4 blank_num\'  data-blanknum=\'"+num+"\'><label class=\'col-form-label text-right\'>Answer : "+num+" </label><input type=\'text\' class=\'form-control search-input\' autocomplete=\'off\' name=\'blank_ans["+num+"]\'></div>";

                if(jQuery('[data-blanknum="'+num+'"]').length == 0) {
                    jQuery('.fill_blank_options').append(txt);
                }
                
            });
        } else {
            jQuery('.blank_num').remove();
        }                  
    }

}

function loadRepeter(){
    jQuery('.repeater').repeater({
        show: function () {
            jQuery(this).slideDown();
            loadTinymce();
            assignNameData();
        },
        hide: function (deleteElement) {
            jQuery(this).slideUp(deleteElement);
        },
        ready: function (setIndexes) {
            loadTinymce();
        },
        isFirstItemUndeletable: true
    });                
}



function assignNameData() {
  var option_arr = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L'];
  var type = jQuery('#question_type').val();

  var option_data = [];
  if(jQuery('.repeater .options').length > 0) {
      option_data = jQuery('.repeater .options').map(function () {
          var option_name = jQuery(this).find('.option_editor').attr('name');
          var option = option_name.match( /[0-9]+/gi );
          option = option[0];
          return option_arr[option];
      }).toArray();
  }

  var ans_data = [];
  if(jQuery('.correct_option .form-check-inline').length > 0) {
      ans_data = jQuery('.correct_option .form-check-inline').map(function () {
          var option_name = jQuery(this).attr('data-option');
          return option_name;
      }).toArray();
  }

  var diffe = ( (ans_data).diff(option_data) ); 

  if(diffe.length > 0) {
    diffe.forEach(function(n){
      jQuery('[data-option="'+n+'"]').remove();
    });
  }

  
  jQuery('.repeater .options').each(function(){
    var option_name = jQuery(this).find('.option_editor').attr('name');
    var option = option_name.match( /[0-9]+/gi );
    option = option[0];

    if(option > 3) {
      jQuery('[data-option="'+option_arr[option]+'"]').remove();
      if(type == 1) {
        var options = '<div class="radio radio-success form-check-inline" data-option="'+option_arr[option]+'"><input type="radio" id="inlineRadio-'+option_arr[option]+'" value="'+option_arr[option]+'" name="validoption" checked=""><label for="inlineRadio-'+option_arr[option]+'"> '+option_arr[option]+' </label></div>';
      }
      if(type == 2) {
        var options = '<div class="checkbox checkbox-success form-check-inline" data-option="'+option_arr[option]+'"><input type="checkbox" id="inlineCheck-'+option_arr[option]+'" value="'+option_arr[option]+'" name="validoption[]"><label for="inlineCheck-'+option_arr[option]+'"> '+option_arr[option]+' </label></div>';
      }
      //console.log(options)
      jQuery('.correct_option').append(options);

      jQuery(this).find('.option-txt').text(option_arr[option]);
    }

  });



/*  jQuery('.repeater .options').each(function(){
    var option_name = jQuery(this).find('.option_editor').attr('name');
    var option = option_name.match( /[0-9]+/gi );
    option = option[0];

    if(option > 3) {
      jQuery('[data-]')
      var options = '<div class="radio radio-success form-check-inline" data-option="'+option_arr[option]+'"><input type="radio" id="inlineRadio-'+option_arr[option]+'" value="'+option_arr[option]+'" name="radioInline" checked=""><label for="inlineRadio-'+option_arr[option]+'"> '+option_arr[option]+' </label></div>';
      console.log(options)
      jQuery('.correct_option').append(options);
    }
    //console.log(option);
  });*/


}

function loadTinymce() {
    if(jQuery(".option_editor").length > 0){

        tinymce.init({
            selector: "textarea.option_editor",
            theme: "modern",
            plugins: [
                        "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
                        "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
                        "save table contextmenu directionality emoticons template paste textcolor autoresize"
                    ],
            toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l      ink image | print preview media fullpage | forecolor backcolor emoticons",
            style_formats: [
                {title: "Bold text", inline: "b"},
                {title: "Red text", inline: "span", styles: {color: "#ff0000"}},
                {title: "Red header", block: "h1", styles: {color: "#ff0000"}},
                {title: "Example 1", inline: "span", classes: "example1"},
                {title: "Example 2", inline: "span", classes: "example2"},
                {title: "Table styles"},
                {title: "Table row 1", selector: "tr", classes: "tablerow1"}
            ],
            autoresize_bottom_margin: 2,
            height:15,
            autoresize_min_height: 15,
            autoresize_max_height: 300,
            menubar: false, statusbar: true, object_resizing: false,
            paste_as_text: true, force_br_newlines: true,
        });

    }
}

            
function getOptionKey(num) {
  return num.replace(/[{}]/g, "");
}












function parseUrl( url ) {
    var a = document.createElement('a');
    a.href = url;
    return a;
}
function getPathFromUrl(url) {
  return url.split(/[?#]/)[1];
}

Array.prototype.diff = function diff(a) {
    return this.filter(function(i) {return a.indexOf(i) < 0;});
};



function populateMultiSelect(sel = '') {
    //advance multiselect start
    jQuery(sel).multiSelect( 'refresh' );    
}



jQuery(document).ready(function () {
  jQuery('.date_pic').datepicker({
      autoclose: true,
      todayHighlight: true,
      format: "dd M yyyy",
      clearBtn: true,
  });


  jQuery('.time_pic').timepicker({ 'timeFormat': 'h:i A' });
});



function calculateQuestionSelectedData() {
    var right_marks = 0;
    var wrong_marks = 0;
    var total_time  = 0;
    var question_count = 0;
    jQuery('.selected_question_block .selected_tr').each(function(){

      right_marks   = right_marks + 1*(jQuery(this).find('.right_mark').val());
      wrong_marks   = wrong_marks + 1*(jQuery(this).find('.wrong_mark').val());
      total_time    = total_time + 1*(convertHmsToSeconds(jQuery(this).find('.question_time').val()));
      question_count++;

    });

    right_marks = (1*right_marks.toFixed(2)); 
    wrong_marks = (1*wrong_marks.toFixed(2));


    jQuery('.exam_duration').val(formatSeconds(total_time));
    jQuery('.total_questions').val(question_count);
    jQuery('.total_marks').val(right_marks);

}


function convertHmsToSeconds(hms) {
    var a = hms.split(':'); // split it at the colons
    var hour = (typeof a[0] !== 'undefined') ? a[0] : 00;
    var min = (typeof a[1] !== 'undefined') ? a[1] : 00;
    var sec = (typeof a[2] !== 'undefined') ? a[2] : 00;
    var seconds = (+hour) * 60 * 60 + (+min) * 60 + (+sec); 
    return seconds;
}

function formatSeconds(seconds)
{
    var date = new Date(1970,0,1);
    date.setSeconds(seconds);
    return date.toTimeString().replace(/.*(\d{2}:\d{2}:\d{2}).*/, "$1");
}