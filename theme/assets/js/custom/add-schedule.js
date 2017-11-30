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


        var batchSel = document.getElementById("question_batchs"); 
        batchSel.length = 1;
        jQuery("#question_batchs").change();
        populateMultiSelect("#question_batchs");

    });


    //On change Btch Multi select Populate batch filter on model
    jQuery('#question_batchs').on('change', function(){
        var selected_batchs = jQuery("#question_batchs option:selected").map(function() {
            return { key : jQuery(this).val(), value : jQuery(this).text() };
        }).toArray();

        var selected_batch_ids = jQuery("#question_batchs option:selected").map(function() {
            if(jQuery(this).val() !== '') {
                return jQuery(this).val();
            }
        }).toArray();

        if(selected_batch_ids == '') {
            selected_batch_ids = '-1';
        }


        var filterBatchSel = document.getElementById("batchs_filter"); 
        filterBatchSel.length = 1
        jQuery("#batchs_filter").change();
        filterBatchSel.options[filterBatchSel.options.length] = new Option('All Batchs', selected_batch_ids);
        if(1 == 1) {
            for (var batch in selected_batchs) {
                if (typeof selected_batchs[batch].key !== "undefined" &&  selected_batchs[batch].key  !== "") {
                    filterBatchSel.options[filterBatchSel.options.length] = new Option(selected_batchs[batch].value, selected_batchs[batch].key);
                }
            }
        }
        jQuery("#batchs_filter").change();



    })








    //Scheduler Add Students
    jQuery('.candidate_search').on('click', function(){

       var filter_action   = jQuery('.filter_action').val();
        var container_class = '.'+filter_action;
        jQuery.ajax({
            type: "POST",
            url: filter_ajaxurl,
            data: {
                action : filter_action,
                data : jQuery('.filter-section :input').serialize(),
                action_from : 'page_filter',
            },
            success: function (data) { 
                jQuery(container_class).html(data);
                populateCheckAfterAjax();
            }
        });

    });

    jQuery('body').on('click', 'a.questions.page-link', function() {
        var attr = jQuery(this).attr("href");
        var string = parseUrl(attr).search;
        string = getPathFromUrl(string);

        var filter_action   = jQuery('.filter_action').val();
        var container_class = '.'+filter_action;
        jQuery.ajax({
            type: "POST",
            url: filter_ajaxurl,
            data: {
                action : filter_action,
                data : string,
                action_from : 'page_link',
            },
            success: function (data) { 
                jQuery(container_class).html(data);
                populateCheckAfterAjax();
            }
        });
        return false;
    });





    //Model Close
    jQuery('.close-selected-question').on('click', function() {
        jQuery('.selected-questions-model').find('.close').click()
    });
    jQuery('.close-select-question').on('click', function() {
        jQuery('.questions-model').find('.close').click()
    });

    jQuery('#model_submit').on('click', function() {
        jQuery('.selected-questions-model').find('.close').click();
        jQuery('.questions-model').find('.close').click();
    });












});


function processingSchedulerFilter(exam_id) {
    jQuery.ajax({
        url: filter_ajaxurl,
        type: "POST",
        dataType: "json",
        data: {
            action: "get_scheduler_data",
            exam_id: exam_id
        },
        success: function( data ) {
            var batchs = data.result;
            var batchSel = document.getElementById("question_batchs"); 
            batchSel.length = 1;

            jQuery("#question_batchs").change();
            if(data.success) {
                for (var batch in batchs) {
                    if (typeof  batchs[batch].batch_id  !== "undefined") {
                        batchSel.options[batchSel.options.length] = new Option(batchs[batch].batch_name, batchs[batch].batch_id);
                    }
                }
            }
            jQuery("#question_batchs").change();
            populateMultiSelect("#question_batchs");

        }
    });
}



