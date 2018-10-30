            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->                      
            <div class="content-page">
                <!-- Start content -->
                <div class="content">
                    <div class="container-fluid">

                        <!-- Page-Title -->
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="page-title-box">
                                    <h4 class="page-title">Add Instruction</h4>
                                    <ol class="breadcrumb float-right">
                                        <li class="breadcrumb-item"><a href="#">Minton</a></li>
                                        <li class="breadcrumb-item active">Dashboard</li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="page-container">
                                            <form method="POST" action="<?php echo base_url('admin/exam/instruction/add') ?>">
                                                <div class="row">
                                                    <div class="col-lg-8">
                                                        <?php $this->load->view('admin/exam/instruction/add/instruction'); ?>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <?php //$this->load->view('admin/instruction/instruction/add/exam_settings'); ?>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- end row -->
                        </div>


                    </div>
                    <!-- end container -->
                </div>
                <!-- end content -->

            </div>
            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->




