jQuery(document).ready(function () {
    jQuery('.exam_search').on('click', function(){


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
    });
});