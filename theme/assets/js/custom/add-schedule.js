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


    jQuery('.block-readonly .remove-circle').on('click', function(){
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
            if(jQuery(this).val() !== "") {
                return { key : jQuery(this).val(), value : jQuery(this).text() };  
            }
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

        removeSelectedCandidate(selected_batch_ids);
    });





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



    //When Select or De-select Students
    jQuery('body').on('change', '.checked_candidate' ,function(){
        var candidate_id = jQuery(this).val();
        var selector = jQuery(this).parent().parent();
        if(jQuery(this).is(':checked')) {
            var username = selector.find('.username').val();
            var enrollment_no = selector.find('.enrollment_no').val();
            var branch_id = selector.find('.branch_id').val();
            var batch_id = selector.find('.batch_id').val();
            var mobile = selector.find('.mobile').val();
            var gender = selector.find('.gender').val();
            var registration_date = selector.find('.registration_date').val();

            addCandidate(candidate_id, username ,enrollment_no ,branch_id ,batch_id ,mobile ,gender ,registration_date);
        } else {
            removeCandidate(candidate_id);
        }
    });


    jQuery('body').on('click', '.selected_sno .remove-circle', function(){
        var remove_id = jQuery(this).attr('data-selremoveid');
        removeQuestion(remove_id);
    });



    jQuery('.select-candidate').on('click', function() {
        selectCandidateReset();
    });

    //Model Close
    jQuery('.close-selected-candidate').on('click', function() {
        jQuery('.selected-candidate-model').find('.close').click()
    });
    jQuery('.close-select-candidate').on('click', function() {
        jQuery('.questions-model').find('.close').click()
    });

    jQuery('#model_submit').on('click', function() {
        jQuery('.selected-candidate-model').find('.close').click();
        jQuery('.questions-model').find('.close').click();
    });










    jQuery('.candidate_selection').on('change', function () {
        if( jQuery("option:selected", this).val() == 2 ) {
            jQuery('.select-candidate-btn').css('display','block');
        } else {
            jQuery('.select-candidate-btn').css('display','none');
        }
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


function addCandidate(candidate_id, username ,enrollment_no ,branch_id ,batch_id ,mobile ,gender ,registration_date) {

    var total_selected = (jQuery('.selected_candidate_block tr').length + 1 );
    var tr_block = "<tr data-selcandidateid="+candidate_id+" data-selbatchid="+batch_id+"><td class='selected_sno'><button data-selremoveid="+candidate_id+" class='btn btn-icon waves-effect waves-light btn-danger m-b-5 remove-circle'><i class='fa fa-remove'></i></button><input type='hidden' name='selected_candidate["+candidate_id+"][candidate_id]' value='"+candidate_id+"'></td><td>"+username+"</td><td>"+enrollment_no+"</td><td>"+branch_id+"</td><td>"+batch_id+"</td><td>"+mobile+"</td><td>"+gender+"</td><td>"+registration_date+"</td></tr>";

    if(jQuery('.selected_candidate_block').find('[data-selcandidateid="'+candidate_id+'"]').length  <= 0) {
        jQuery('.selected_candidate_block').append(tr_block);
    }

}

function removeCandidate(candidate_id) {
    if(jQuery('.selected_candidate_block').find('[data-selcandidateid="'+candidate_id+'"]').length  > 0) {
        jQuery('.selected_candidate_block').find('[data-selcandidateid="'+candidate_id+'"]').remove();
    }
    if(jQuery('[data-candidateid="'+candidate_id+'"]').find('.checked_candidate').is(':checked')) {
        jQuery('[data-candidateid="'+candidate_id+'"]').find('.checked_candidate').prop('checked', false); 
    }
}


function populateCheckAfterAjax() {
    jQuery('.candidate_scheduler_filter tbody .candidate_avail').each(function(){

        var candidate_id = jQuery(this).attr('data-candidateid');
        if(jQuery('.selected_candidate_block').find('[data-selcandidateid="'+candidate_id+'"]').length  > 0) {
            jQuery(this).find('.checked_candidate').prop('checked', true);
        }

    });
}


function selectCandidateReset() {
    jQuery('select.question_subject, .candidate_gender, .candidate_year, .ppage').prop('selectedIndex',1);
    jQuery('select.question_subject, .candidate_gender, .candidate_year, .ppage').change();

    jQuery('.candidate_scheduler_filter').html('');
    jQuery('.search_question,username, .enrollment_no, .contact_no, .user_email').val('');
}


function removeSelectedCandidate(batchs) {
    jQuery('.selected_candidate_block tr').each(function(){
        var this_batch = jQuery(this).attr('data-selbatchid');
        var batch_in = batchs.indexOf(this_batch);
        if(batch_in == -1) {
            jQuery(this).remove();
        }
    });
}