
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