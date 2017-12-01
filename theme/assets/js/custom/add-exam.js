jQuery(document).ready(function () {


    if(jQuery("#test_description").length > 0){
        tinymce.init({
            selector: "textarea#test_description",
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



    jQuery(".question_subject").on("change", function(){
        var cat_id = jQuery(this).val();

        var topicSel = document.getElementById("question_topic"); 
        var typeSel = document.getElementById("question_type"); 
        topicSel.length = 1
        typeSel.length = 1

        jQuery.ajax({ 
            type: "POST", 
            url: site_url+"admin/question/getQuestionOptions", 
            data: { cat_id: cat_id }, 
            dataType: "json",
            success: function (data) {

                var topics = data.topics;
                var types = data.types;
                
                topicSel.options[topicSel.options.length] = new Option('All Topics', '0');
                if(data.topic_success) {
                    for (var topic in topics) {
                        topicSel.options[topicSel.options.length] = new Option(topics[topic].topic, topics[topic].id);
                    }
                }
                jQuery("#question_topic").change();

                typeSel.options[typeSel.options.length] = new Option('All Types', '0');
                if(data.type_success) {
                    for (var type in types) {
                        typeSel.options[typeSel.options.length] = new Option(types[type].question_type, types[type].id);
                    }
                }
                jQuery("#question_type").change();
            }
        });
    });


    //When Search Button Click
    jQuery('.question_search').on('click', function(){

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




    //When Select or De-select Questions
    jQuery('body').on('change', '.checked_question' ,function(){
        var question_id = jQuery(this).val();
        var selector = jQuery(this).parent().parent();
        if(jQuery(this).is(':checked')) {
            var right_mark = selector.find('.right_mark').val();
            var wrong_mark = selector.find('.wrong_mark').val();
            var question_time = selector.find('.question_time').val();
            var question = selector.find('.filter_question').html();
            addQuestion(question_id, question, right_mark, wrong_mark, question_time);
        } else {
            removeQuestion(question_id);
        }
    });

    jQuery('body').on('click', '.selected_sno .remove-circle', function(){
        var remove_id = jQuery(this).attr('data-selremoveid');
        removeQuestion(remove_id);
    });



    jQuery('.select-question').on('click', function() {
        selectQuestionReset();
    });

    //Model Close
    jQuery('.close-selected-question').on('click', function() {
        jQuery('.selected-questions-model').find('.close').click();
    });
    jQuery('.close-select-question').on('click', function() {
        jQuery('.questions-model').find('.close').click();
    });

    jQuery('#model_submit').on('click', function() {
        jQuery('.selected-questions-model').find('.close').click();
        jQuery('.questions-model').find('.close').click();
    });


});



function addQuestion(question_id, question, right_mark, wrong_mark, question_time) {

    var total_selected = (jQuery('.selected_question_block tr').length + 1 );
    var tr_block = "<tr data-selquestionid="+question_id+"><td class='selected_sno'><button data-selremoveid="+question_id+" class='btn btn-icon waves-effect waves-light btn-danger m-b-5 remove-circle'><i class='fa fa-remove'></i></button><input type='hidden' name='selected_question["+question_id+"][question_id]' value='"+question_id+"'></td><td>"+question+"</td><td> <input type='text' name='selected_question["+question_id+"][right_mark]' class='form-control' value='"+right_mark+"'></td><td><input type='text' name='selected_question["+question_id+"][wrong_mark]' class='form-control' value='"+wrong_mark+"'></td><td><input type='text' name='selected_question["+question_id+"][question_time]' class='form-control' value='"+question_time+"'></td></tr>";

    if(jQuery('.selected_question_block').find('[data-selquestionid="'+question_id+'"]').length  <= 0) {
        jQuery('.selected_question_block').append(tr_block);
    }

}

function removeQuestion(question_id) {
    if(jQuery('.selected_question_block').find('[data-selquestionid="'+question_id+'"]').length  > 0) {
        jQuery('.selected_question_block').find('[data-selquestionid="'+question_id+'"]').remove();
    }
    if(jQuery('[data-questionid="'+question_id+'"]').find('.checked_question').is(':checked')) {
        jQuery('[data-questionid="'+question_id+'"]').find('.checked_question').prop('checked', false); 
    }
}

function populateCheckAfterAjax() {
    jQuery('.question_exam_filter tbody .question_avail').each(function(){

        var question_id = jQuery(this).attr('data-questionid');
        if(jQuery('.selected_question_block').find('[data-selquestionid="'+question_id+'"]').length  > 0) {
            jQuery(this).find('.checked_question').prop('checked', true);
        }

    });
}








function selectQuestionReset() {
    jQuery('select.candidate_batch, .question_language, .question_year, .question_difficulty, .search_question, .ppage').prop('selectedIndex',1);
    jQuery('select.candidate_batch, .question_language, .question_year, .question_difficulty, .search_question, .ppage').change();

    jQuery('.question_exam_filter').html('');
    jQuery('.search_question').val('');
}