jQuery(document).ready(function () {

    if(jQuery("#main_question").length > 0){
        tinymce.init({
            selector: "textarea#main_question",
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
                
                if(data.topic_success) {
                    topicSel.options[topicSel.options.length] = new Option('All Topics', '-');
                    for (var topic in topics) {
                        topicSel.options[topicSel.options.length] = new Option(topics[topic].topic, topics[topic].id);
                    }
                }
                jQuery("#question_topic").change();

                if(data.type_success) {
                    typeSel.options[typeSel.options.length] = new Option('All Types', '-');
                    for (var type in types) {
                        typeSel.options[typeSel.options.length] = new Option(types[type].question_type, types[type].id);
                    }
                }
                jQuery("#question_type").change();
            }
        });
    });



    jQuery('.question_search').on('click', function(){


       var filter_action   = jQuery('.filter_action').val();
        var container_class = '.'+filter_action;

        jQuery.ajax({
            type: "POST",
            url: filter_ajaxurl,
            data: {
                action : filter_action,
                data : jQuery('.filter-section :input').serialize()
            },
            success: function (data) { 
                jQuery(container_class).html(data);
            }
        });

    })

});