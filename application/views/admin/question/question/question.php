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
                                    <h4 class="page-title">Question List</h4>
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
                                                        <a class="nav-link" href="<?php echo base_url('admin/subject') ?>">Subject</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="<?php echo base_url('admin/subject/topic') ?>">Topic</a>
                                                    </li>
                                                    <!-- <li class="nav-item">
                                                        <a class="nav-link" href="<?php //echo base_url('admin/question/category') ?>">Category</a> -->
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link active" href="<?php echo base_url('admin/question') ?>">Question</a>
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
                                                                                <div class="col-lg-3 col-md-4">
                                                                                    <div class="form-group row">
                                                                                        <div class="col-12">
                                                                                            <select class="form-control select2 question_subject" name="subject">
                                                                                                <option disabled>Select Subject</option>
                                                                                                <option value="0">All Subjects</option>
                                                                                                <?php 
                                                                                                    if($subjects) {
                                                                                                        foreach ($subjects as $subject) {
                                                                                                            echo "<option value='".$subject->id."'>".ucfirst($subject->subject)."</option>";
                                                                                                        }
                                                                                                    }
                                                                                                ?>
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-3 col-md-4">
                                                                                    <div class="form-group row">
                                                                                        <div class="col-12">
                                                                                            <select class="form-control select2 question_topic" name="topic" id="question_topic">
                                                                                                <option disabled>Select Topic</option>
                                                                                                <option value="0">All Topics</option>
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-3 col-md-4">
                                                                                    <div class="form-group row">
                                                                                        <div class="col-12">
                                                                                            <select class="form-control select2 question_type" name="type" id="question_type">
                                                                                                <option disabled>Question Type</option>
                                                                                                <option value="0">All Types</option>
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-3 col-md-4">
                                                                                    <div class="form-group row">
                                                                                        <div class="col-12">
                                                                                            <select class="form-control select2" name="language">
                                                                                                <option disabled>Select Language</option>
                                                                                                <option value="-">All Languages</option>
                                                                                                <?php
                                                                                                    $language_list = getLanguageList('en');
                                                                                                    foreach ($language_list as $key => $language) {
                                                                                                        if($language['selected'] == true) {
                                                                                                            echo "<option selected value='".$key."'>".$language['language']."</option>";
                                                                                                        } else {
                                                                                                            echo "<option value='".$key."'>".$language['language']."</option>";
                                                                                                        }
                                                                                                    }
                                                                                                ?>
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-3 col-md-4">
                                                                                    <div class="form-group row">
                                                                                        <div class="col-12">
                                                                                            <select class="form-control select2" name="year">
                                                                                                <option disabled>Select Year</option>
                                                                                                <option value="0">All Year</option>
                                                                                                <?php 
                                                                                                    $year_list = getYearList(date('Y')) ;
                                                                                                    foreach ($year_list as $year) {
                                                                                                        if($year['selected'] == true) {
                                                                                                            echo "<option selected>".$year['year']."</option>";
                                                                                                        } else {
                                                                                                            echo "<option>".$year['year']."</option>";
                                                                                                        }
                                                                                                    }
                                                                                                ?>
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-3 col-md-4">
                                                                                    <div class="form-group row">
                                                                                        <div class="col-12">
                                                                                            <select class="form-control select2" name="difficulty" style="text-transform: capitalize;">
                                                                                                <option disabled>Select Difficulty</option>
                                                                                                <option value="0">All Level</option>
                                                                                            <?php
                                                                                                $difficulty_list = getDifficultyList();
                                                                                                foreach ($difficulty_list as $key => $difficulty) {
                                                                                                    if($difficulty['selected'] == true) {
                                                                                                        echo "<option selected value='".$key."'>".$difficulty['difficulty']."</option>";
                                                                                                    } else {
                                                                                                        echo "<option value='".$key."'>".$difficulty['difficulty']."</option>";
                                                                                                    }
                                                                                                }
                                                                                            ?>
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-4">
                                                                                    <div class="form-group row">
                                                                                        <div class="col-12">
                                                                                            <input type="text" name="question"  class="form-control" placeholder="Search Question">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-2">
                                                                                    <div class="form-group row">
                                                                                        <div class="col-12">
                                                                                            <a class="btn btn-primary btn-custom waves-effect w-md waves-light m-b-5 question_search" style="color:#fff;width: 100%;">Search&nbsp;<i class="ti-search"></i></a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                            </div>


                                                                        </div>
                                                                        <div class="col-md-12 col-lg-2">
                                                                            <div class="action-group">
                                                                                <button type="button" class="btn btn-primary btn-custom waves-effect w-md waves-light m-b-5 doubleClick" data-doubleatt=".double-add-topic" data-singleatt="<?php echo base_url('admin/question/add'); ?>">Add</button>
                                                                                <button style="display:none;" type="button" class="btn btn-primary btn-custom waves-effect w-md waves-light m-b-5 double-add-topic" data-toggle="modal" data-target=".bs-example-modal-lg">Add</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="clearfix"></div>
                                                            </div>
                                                            <input type="hidden" class="filter_action" value="question_filter">
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="question_filter">
                                                    <?php $this->load->view('admin/question/question/ajax/filter/list') ?>
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
                fgfdgfdgfd
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->            