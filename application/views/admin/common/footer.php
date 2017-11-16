
        </div>
        <!-- END wrapper -->


    
        <script>
            var resizefunc = [];
        </script>

        <!-- Plugins  -->
        <script src="<?php echo base_url(); ?>theme/assets/js/jquery.min.js"></script>
        <script src="<?php echo base_url(); ?>theme/assets/js/popper.min.js"></script><!-- Popper for Bootstrap -->
        <script src="<?php echo base_url(); ?>theme/assets/js/bootstrap.min.js"></script>
        <script src="<?php echo base_url(); ?>theme/assets/js/detect.js"></script>
        <script src="<?php echo base_url(); ?>theme/assets/js/fastclick.js"></script>
        <script src="<?php echo base_url(); ?>theme/assets/js/jquery.slimscroll.js"></script>
        <script src="<?php echo base_url(); ?>theme/assets/js/jquery.blockUI.js"></script>
        <script src="<?php echo base_url(); ?>theme/assets/js/waves.js"></script>
        <script src="<?php echo base_url(); ?>theme/assets/js/wow.min.js"></script>
        <script src="<?php echo base_url(); ?>theme/assets/js/jquery.nicescroll.js"></script>
        <script src="<?php echo base_url(); ?>theme/assets/js/jquery.scrollTo.min.js"></script>
        <script src="<?php echo base_url(); ?>jsplugins/switchery/switchery.min.js"></script>
        


        <script src="<?php echo base_url(); ?>jsplugins/footable/js/footable.all.min.js"></script>
        <!--FooTable Example-->
        <script src="<?php echo base_url(); ?>theme/assets/pages/jquery.footable.js"></script>


        <script src="<?php echo base_url(); ?>jsplugins/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url(); ?>jsplugins/multiselect/js/jquery.multi-select.js"></script>
        <script type="text/javascript" src="<?php echo base_url(); ?>jsplugins/jquery-quicksearch/jquery.quicksearch.js"></script>
        <script src="<?php echo base_url(); ?>jsplugins/select2/select2.min.js" type="text/javascript"></script>
        <script src="<?php echo base_url(); ?>jsplugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js" type="text/javascript"></script>
        <script src="<?php echo base_url(); ?>jsplugins/bootstrap-inputmask/bootstrap-inputmask.min.js" type="text/javascript"></script>
    
        <!-- Date Range Picker -->
        <script src="<?php echo base_url(); ?>jsplugins/moment/moment.js"></script>
        <script src="<?php echo base_url(); ?>jsplugins/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
        <script src="<?php echo base_url(); ?>jsplugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
        <script src="<?php echo base_url(); ?>jsplugins/bootstrap-daterangepicker/daterangepicker.js"></script>
        
        <script src="<?php echo base_url(); ?>theme/assets/pages/jquery.form-advanced.init.js"></script>

        <script src="<?php echo base_url(); ?>theme/assets/js/jquery.core.js"></script>
        <script src="<?php echo base_url(); ?>theme/assets/js/jquery.app.js"></script>
        

        <?php
            // Add any javascripts
            if( isset( $javascripts ) )
            {
                foreach( $javascripts as $js )
                {
                    echo '<script src="' . $js . '"></script>' . "\n";
                }
            }

            if( isset( $final_foot ) )
            {
                echo $final_foot;
            }
        ?>

        <script type="text/javascript">
            jQuery(".question_subject").on("change", function(){
                var cat_id = jQuery(this).val();

                var topicSel = document.getElementById("question_topic"); 
                var typeSel = document.getElementById("question_type"); 
                topicSel.length = 1
                typeSel.length = 1


                jQuery.ajax({ 
                    type: "POST", 
                    url: "<?php echo base_url("admin/question/getQuestionOptions") ?>", 
                    data: { cat_id: cat_id }, 
                    dataType: 'json',
                    success: function (data) {

                        var topics = data.topics;
                        var types = data.types;
                        
                        jQuery('#question_topic').change();
                        if(data.topic_success) {
                            for (var topic in topics) {
                                topicSel.options[topicSel.options.length] = new Option(topics[topic].topic, topics[topic].id);
                            }
                        }

                        jQuery('#question_type').change();
                        if(data.type_success) {
                            for (var type in types) {
                                typeSel.options[typeSel.options.length] = new Option(types[type].question_type, types[type].id);
                            }
                        }

                    }
                });
            });
        </script>



<script>
    jQuery(document).ready(function () {
        jQuery('.repeater').repeater({
            initEmpty: false,
            defaultValues: {
                'text-input': 'foo'
            },
            show: function () {
                loadTinymce();
                jQuery(this).slideDown();
            },
            hide: function (deleteElement) {
                jQuery(this).slideUp(deleteElement);
            },
            ready: function (setIndexes) {
                loadTinymce();
            },
            isFirstItemUndeletable: true
        })
    });

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


</script>


        <script src="<?php echo base_url(); ?>theme/assets/js/custom.js"></script>


        <!-- Counter Up  -->
<!--         <script src="<?php echo base_url(); ?>jsplugins/waypoints/lib/jquery.waypoints.min.js"></script>
        <script src="<?php echo base_url(); ?>jsplugins/counterup/jquery.counterup.min.js"></script> -->

        <!--Morris Chart-->
<!-- 		<script src="<?php echo base_url(); ?>jsplugins/morris/morris.min.js"></script>
		<script src="<?php echo base_url(); ?>jsplugins/raphael/raphael-min.js"></script> -->

        <!-- Page js  -->
<!--         <script src="<?php echo base_url(); ?>theme/assets/pages/jquery.dashboard.js"></script> -->

        <!-- Custom main Js -->
<!--         <script src="<?php echo base_url(); ?>theme/assets/js/jquery.core.js"></script>
        <script src="<?php echo base_url(); ?>theme/assets/js/jquery.app.js"></script> -->

        
<!--         <script type="text/javascript">
            jQuery(document).ready(function($) {
                $('.counter').counterUp({
                    delay: 100,
                    time: 1200
                });
            });
        </script> -->
    </body>
</html>