jQuery(document).ready(function () {
    if(jQuery("#schedule_description").length > 0){
        tinymce.init({
            selector: "textarea#schedule_description",
            theme: "modern",
            height:100,
            setup : function(ed) {
                ed.on("keyup", function(e, evt) {
                    questionEditor(e);
                });
            },                     
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
            ]
        });
    }





    jQuery( "#schedule_exam" ).autocomplete ({
        source: function( request, response ) {
          
            jQuery.ajax({
                url: filter_ajaxurl,
                type: 'POST',
                dataType: "json",
                showAutocompleteOnFocus : true,
                autoFocus: true,
                selectFirst: true,
                data: {
                    action: 'search_exam',
                    search_key: request.term
                },
                success: function( data ) {
                    response(jQuery.map( data.result, function( item ) {
                        return {
                            id    : item.id,
                            value : item.exam_name,
                        }
                    }));
                }
            });
        },
        minLength: 2,
        select: function( event, ui ) {
            jQuery('.exam_id').val(ui.item.id);
            jQuery('#schedule_exam').attr('readonly', true);
            jQuery('.button-readonly').css('display', 'block');

            processingSchedulerFilter(ui.item.id);
        }
    });

    jQuery('.button-readonly').on('click', function(){
        var selector = jQuery(this).parent();

        jQuery('#schedule_exam').attr('readonly', false);
        jQuery('.exam_id').val(0);
        jQuery('#schedule_exam').val('').focus();
        jQuery(this).css('display', 'none');
    });





});


    
function processingSchedulerFilter(exam_id) {
    jQuery.ajax({
        url: filter_ajaxurl,
        type: 'POST',
        dataType: "json",
        data: {
            action: 'get_scheduler_data',
            exam_id: exam_id
        },
        success: function( data ) {
            
        }
    });
}



