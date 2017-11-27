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
                                    <h4 class="page-title">Add User</h4>
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
                                            <div class="row">
                                                <div class="col-lg-8">
                                                    <?php $this->load->view('admin/exam/exam/add/exam'); ?>
                                                </div>
                                                <div class="col-lg-4">
                                                    <h4 class="header-title m-t-0 text-center">Recently Added</h4>
                                                </div>
                                            </div>
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




<div class="modal fade questions-model" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-full-width">
        <div class="modal-content">
            <div class="modal-header text-center">
                <div style="width:100%;"><h3>Select Questions</h3></div>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">


                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="filter-section">
                                    <div class="page-title-box action-header">
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
                                                                <select class="form-control select2 question_language" name="language">
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
                                                                <select class="form-control select2 question_year" name="year">
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
                                                                <select class="form-control select2 question_difficulty" name="difficulty" style="text-transform: capitalize;">
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
                                                                <input type="text" name="question"  class="form-control search_question" placeholder="Search Question">
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
                                                <div class="form-group row">
                                                    <div class="col-12">
                                                        <select class="form-control select2 ppage" name="ppage">
                                                            <option disabled>Data Per Page</option>
                                                            <option selected value="2">2 Per Page</option>
                                                            <option  value="3">3 Per Page</option>
                                                            <option value="20">20 Per Page</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <button type="button" class="btn btn-danger btn-custom waves-effect w-md waves-light m-b-5 selected-question" data-toggle="modal" data-target=".selected-questions-model">Selected Questions &nbsp; <i class="mdi mdi-library-plus"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <input type="hidden" class="filter_action" value="question_exam_filter">
                                    
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="question_exam_filter">

                        </div>
                    </div>
                </div>
                <!-- end row -->

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->









<div class="modal fade selected-questions-model" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-full-width">
        <div class="modal-content">
            <div class="modal-header text-center">
                <div style="width:100%;"><h3>Selected Questions</h3></div>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">


                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="filter-section">
                                    <div class="page-title-box action-header">
                                        <div class="row">
                                            <div class="col-md-12 col-lg-12">
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-12">
                                                                <input type="text" name="question"  class="form-control search_question" placeholder="Search Question">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-12">
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-12">
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-12">
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-12">
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-12">
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <div class="form-group row">
                                                            <div class="col-12">
                                                                <input type="text" name="question"  class="form-control search_question" placeholder="Search Question">
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
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="selected_question_list">
                            <div class="row">
                                <div class="col-lg-12">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Question</th>
                                                <th style="width: 200px;">Subject</th>
                                                <th>Topic</th>
                                                <th style="width: 200px;">Difficulty</th>
                                            </tr>
                                        </thead>
                                        <tbody class="selected_question_block">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end row -->

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->