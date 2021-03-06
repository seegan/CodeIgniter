

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
                                    <h4 class="page-title">Topic List</h4>
                                    <ol class="breadcrumb float-right">
                                        <li class="breadcrumb-item"><a href="<?php echo base_url('admin/dashboard') ?>">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="<?php echo base_url('admin/branch') ?>">Branch</a></li>
                                        <li class="breadcrumb-item active">User</li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <ul class="nav nav-tabs card-header-tabs">
                                                    <li class="nav-item">
                                                        <a class="nav-link " href="<?php echo base_url('admin/subject') ?>">Subject</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link active" href="<?php echo base_url('admin/subject/topic') ?>">Topic</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <!-- <a class="nav-link" href="<?php //echo base_url('admin/question/category') ?>">Category</a> -->
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="<?php echo base_url('admin/question') ?>">Question</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="<?php echo base_url('admin/question/import') ?>">Import</a>
                                                    </li>                                                    
                                                </ul>
                                            </div>
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="filter-section">
                                                            <div class="page-title-box action-header">
                                                                <div>
                                                                    <div class="row">
                                                                        <div class="col-md-12 col-lg-10">

                                                                            <div class="row">
                                                                                <div class="col-lg-4">
                                                                                    <div class="form-group row">
                                                                                        <div class="col-12">
                                                                                            <input type="text" name="topic_name"  class="form-control" placeholder="Search Topic">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-4">
                                                                                        <select class="form-control select2 question_subject" name="subject_name">
                                                                                            <option disabled>Select Subject</option>
                                                                                            <option value="">All Subjects</option>
                                                                                            <?php 
                                                                                                if($subjects) {
                                                                                                    foreach ($subjects as $subject) {
                                                                                                        echo "<option value='".$subject->subject."'>".ucfirst($subject->subject)."</option>";
                                                                                                    }
                                                                                                }
                                                                                            ?>
                                                                                        </select>
                                                                                </div>

                                                                                <div class="col-lg-2">
                                                                                    <div class="form-group row">
                                                                                        <div class="col-12">
                                                                                            <select class="form-control select2 ppage" name="ppage">
                                                                                                <option disabled="">Data Per Page</option>
                                                                                                <option  value="5">5 Per Page</option>
                                                                                                <option selected="" value="20">20 Per Page</option>
                                                                                                <option value="50">50 Per Page</option>
                                                                                                <option value="100">100 Per Page</option>
                                                                                            </select>                                                                                            
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-2">
                                                                                    <div class="form-group row">
                                                                                        <div class="col-12">
                                                                                            <a class="btn btn-primary btn-custom waves-effect w-md waves-light m-b-5 topic_search" style="color:#fff;width: 100%;">Search&nbsp;<i class="ti-search"></i></a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                       </div>
                                                                        <div class="col-md-12 col-lg-2">
                                                                            <div class="action-group">
                                                                                <button type="button" class="btn btn-primary btn-custom waves-effect w-md waves-light m-b-5 doubleClick" data-doubleatt=".double-add-topic" data-singleatt="<?php echo base_url('admin/subject/topic/add'); ?>">Add</button>
                                                                                <button style="display:none;" type="button" class="btn btn-primary btn-custom waves-effect w-md waves-light m-b-5 double-add-topic" data-toggle="modal" data-target=".bs-example-modal-lg">Add</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="clearfix"></div>
                                                            </div>
                                                            <input type="hidden" class="filter_action" value="topic_filter">
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="topic_filter">
                                                    <?php $this->load->view('admin/subject/topic/ajax/filter/list') ?>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- end row -->






                    </div>
                    <!-- end container -->
                </div>
                <!-- end content -->

            </div>
            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->






<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <?php $this->load->view('admin/subject/topic/add/topic'); ?>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->            