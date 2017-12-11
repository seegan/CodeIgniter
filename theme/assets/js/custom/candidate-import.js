jQuery(document).ready(function() { 
	var options = { 
			target:   '#output',   // target element(s) to be updated with server response 
			beforeSubmit:  beforeSubmit,  // pre-submit callback 
			success:       afterSuccess,  // post-submit callback 
			uploadProgress: OnProgress, //upload progress callback 
			resetForm: true,        // reset the form after successful submit
			data: { key1: 'value1', key2: 'value2' }
		}; 
		
	 jQuery('#MyUploadForm').submit(function() { 
			jQuery(this).ajaxSubmit(options);  			
			// always return false to prevent standard browser submit and page navigation 
			return false; 
		}); 
		

	//function after succesful file upload (when server response)
	function afterSuccess($data)
	{
		jQuery('#submit-btn').show(); //hide submit button
		jQuery('#loading-img').hide(); //hide submit button
		jQuery('#progressbox').delay( 1000 ).fadeOut(); //hide progress bar

	}

	//function to check file size before uploading.
	function beforeSubmit(){
	    //check whether browser fully supports all File API
	   if (window.File && window.FileReader && window.FileList && window.Blob)
		{
			
			if( !jQuery('#FileInput').val()) //check empty input filed
			{
				jQuery("#output").html("Are you kidding me?");
				return false
			}
			
			var fsize = jQuery('#FileInput')[0].files[0].size; //get file size
			var ftype = jQuery('#FileInput')[0].files[0].type; // get file type
			

		    var validExts = new Array(".xlsx", ".xls");
		    var fileExt = jQuery('#FileInput').val();
		    fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
		    if(fileExt != '.xlsx') {
		    	jQuery("#output").html("<b>"+ftype+"</b> Unsupported file type!");
		    	return false
		    }
		    
			//Allowed file size is less than 5 MB (1048576)
			if(fsize>5242880) 
			{
				jQuery("#output").html("<b>"+bytesToSize(fsize) +"</b> Too big file! <br />File is too big, it should be less than 5 MB.");
				return false
			}
					
			jQuery('#submit-btn').hide(); //hide submit button
			jQuery('#loading-img').show(); //hide submit button
			jQuery("#output").html("");  
		}
		else
		{
			//Output error to older unsupported browsers that doesn't support HTML5 File API
			jQuery("#output").html("Please upgrade your browser, because your current browser lacks some new features we need!");
			return false;
		}
	}

	//progress bar function
	function OnProgress(event, position, total, percentComplete) {
	    //Progress bar
		jQuery('#progressbox').show();
	    jQuery('#progressbar').width(percentComplete + '%'); //update progressbar percent complete
	    jQuery('#statustxt').html(percentComplete + '%'); //update status text
	    if(percentComplete>50)
	        {
	            jQuery('#statustxt').css('color','#000'); //change status text to white after 50%
	        }
	}

	//function to format bites bit.ly/19yoIPO
	function bytesToSize(bytes) {
	   var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
	   if (bytes == 0) return '0 Bytes';
	   var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
	   return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i];
	}

}); 