jQuery(document).ready(function () {

    jQuery(".branch_name").on("change", function(){

        var branch_id = jQuery(this).val();

        var batchSel = document.getElementById("batch_name"); 
        batchSel.length = 1

        jQuery.ajax({ 
            type: "POST",
            url: site_url+"admin/branch/batch/getBatchByBranch", 
            data: { branch_id: branch_id }, 
            dataType: "json",
            success: function (data) {

                var batchs = data.batchs;
                
                batchSel.options[batchSel.options.length] = new Option('All Batchs', '0'); 
                jQuery("#batch_name").change();
                if(data.batch_success) {
                    for (var batch in batchs) { 
                        if (typeof  batchs[batch].id  !== "undefined") {
                            batchSel.options[batchSel.options.length] = new Option(batchs[batch].batch_name, batchs[batch].id);
                        }
                        
                    }
                }
                jQuery("#batch_name").change();
            }
        });
    });




    jQuery('.candidate_search').on('click', function(){

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