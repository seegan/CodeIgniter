<h4 class="header-title m-t-0 text-center">New Schedule</h4>

<form method="POST" action="<?php echo base_url('admin/exam/add') ?>">

    <div class="form-group row">
        <label class="col-4 col-form-label text-right"></label>
        <div class="col-7">
        <?php
            if(validation_errors() != false) {
        ?>
            <div class="alert alert-danger alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <?php echo validation_errors(); ?>
            </div>
        <?php
            }
        ?>
        </div>
    </div>
    <div class="form-group row">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Schedule Name<span class="text-danger">*</span></label>
        <div class="col-7">
            <input type="text" required class="form-control" name="exam_name" placeholder="Exam Name" value="<?php echo set_value('test_name'); ?>">
        </div>
    </div> 
    <div class="row form-group">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Description<span class="text-danger">*</span></label>
        <div class="col-7">
            <textarea id="schedule_description" name="schedule_description"></textarea>
        </div>
    </div>                           
    <div class="form-group row">
        <label for="inputEmail3" class="col-4 col-form-label text-right"></label>
        <div class="col-7">
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label style="margin-bottom:0;">Start Date<span class="text-danger">*</span></label>
                        <input type="text" placeholder="" required="" class="form-control" name="username">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label style="margin-bottom:0;">End Date<span class="text-danger">*</span></label>
                        <input type="text" placeholder="" required="" class="form-control" name="username">
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    <div class="form-group row">
        <label for="inputEmail3" class="col-4 col-form-label text-right"></label>
        <div class="col-7">
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label style="margin-bottom:0;">Start Time<span class="text-danger">*</span></label>
                        <input type="text" placeholder="" required="" class="form-control" name="username">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label style="margin-bottom:0;">End Time<span class="text-danger">*</span></label>
                        <input type="text" placeholder="" required="" class="form-control" name="username">
                    </div>
                </div>
                
            </div>
        </div>
    </div>   
    <div class="form-group row">
        <label for="inputEmail3" class="col-4 col-form-label text-right"></label>
        <div class="col-7">
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label style="margin-bottom:0;">Result Date<span class="text-danger">*</span></label>
                        <input type="text" placeholder="" required="" class="form-control" name="username">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label style="margin-bottom:0;">Result Time<span class="text-danger">*</span></label>
                        <input type="text" placeholder="" required="" class="form-control" name="username">
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    <div class="form-group row">
        <label for="inputEmail3" class="col-4 col-form-label text-right"></label>
        <div class="col-7">
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label style="margin-bottom:0;">Offer As<span class="text-danger">*</span></label>
                        <div style="margin-top: 18px;">
                            <div class="radio radio-success form-check-inline">
                                <input type="radio" id="offer_as1" value="paid" name="offer_as" checked="">
                                <label for="offer_as1"> Paid </label>
                            </div>
                            <div class="radio radio-success form-check-inline">
                                <input type="radio" id="offer_as2" value="free" name="offer_as">
                                <label for="offer_as2"> Free </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label style="margin-bottom:0;">Cost<span class="text-danger">*</span></label>
                        <input type="text" placeholder="" required="" class="form-control" name="username">
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    <div class="form-group row">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Result</label>
        <div class="col-7">
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <div style="margin-top: 5px;">
                            <div class="radio radio-success form-check-inline">
                                <input type="radio" id="publish_result1" value="auto" name="publish_result" checked="">
                                <label for="publish_result1"> Auto Result </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <div style="margin-top: 5px;">

                            <div class="radio radio-success form-check-inline">
                                <input type="radio" id="publish_result2" value="manual" name="publish_result">
                                <label for="publish_result2"> Manual Result </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row form-group">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Choose Exam<span class="text-danger">*</span></label>
        <div class="col-7">
            <div class="block-readonly">
                <input type="text" required class="form-control" placeholder="Search Exam" value="<?php echo set_value('schedule_exam'); ?>" id="schedule_exam">
                <button type="button" class="btn btn-icon waves-effect waves-light btn-danger m-b-5 remove-circle button-readonly"><i class="fa fa-remove"></i></button>
            </div>
            <input type="hidden" class="exam_id" name="exam_id" value="0">
        </div>
    </div> 
    <div class="row form-group">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Total Marks<span class="text-danger">*</span></label>
        <div class="col-7">
            <input type="text" required class="form-control" name="total_marks" placeholder="Total Marks" value="<?php echo set_value('total_marks'); ?>">
        </div>
    </div>
    <div class="row form-group">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Questions<span class="text-danger">*</span></label>
        <div class="col-7">
            <button type="button" class="btn btn-danger btn-custom waves-effect w-md waves-light m-b-5 select-question" data-toggle="modal" data-target=".questions-model">Add Questions &nbsp; <i class="mdi mdi-library-plus"></i></button>
        </div>
    </div> 




    <div class="form-group row">
        <label for="webSite" class="col-4 col-form-label text-right"></label>
        <div class="col-7">
            <button type="submit" class="btn btn-primary waves-effect waves-light">
                Create
            </button>
            <button type="reset"
                    class="btn btn-secondary waves-effect m-l-5">
                Cancel
            </button>
        </div>
    </div>







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
                        <div class="form-group text-right m-b-0">
                            <div style="margin-top:30px;">
                                <button type="button" class="btn btn-secondary btn-custom waves-effect w-md waves-light m-b-5 close-select-question">Cancel</button>
                                <button type="button" class="btn btn-success btn-custom waves-effect w-md waves-light m-b-5 selected-question" data-toggle="modal" data-target=".selected-questions-model">Selected Questions &nbsp; <i class="mdi mdi-arrow-right-bold"></i></button>                              
                            </div>
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
                                                <th style="width: 200px;">Right Marks</th>
                                                <th style="width: 200px;">Wrong Marks</th>
                                                <th style="width: 200px;">Time (In Secs)</th>
                                            </tr>
                                        </thead>
                                        <tbody class="selected_question_block">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="form-group text-right m-b-0">
                            <div style="margin-top:30px;">
                                <button type="button" class="btn btn-info btn-custom waves-effect w-md waves-light m-b-5 close-selected-question"><i class="mdi mdi-arrow-left-bold"></i>Back To Questions &nbsp; </button> 

                                <button type="button" class="btn btn-success btn-custom waves-effect w-md waves-light m-b-5"> Submit </button> 


                                                             
                            </div>
                        </div>

                    </div>
                </div>
                <!-- end row -->

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->





</form>