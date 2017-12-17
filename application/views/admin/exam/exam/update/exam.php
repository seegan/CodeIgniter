<?php
$exam_name = ($exam && isset($exam['exam_name'])) ? $exam['exam_name'] : '';
$exam_duration = ($exam && isset($exam['exam_duration'])) ? $exam['exam_duration'] : '';
$total_questions = ($exam && isset($exam['total_questions'])) ? $exam['total_questions'] : '';
$total_marks = ($exam && isset($exam['total_marks'])) ? $exam['total_marks'] : '';
$description = ($exam && isset($exam['description'])) ? $exam['description'] : '';
?>
<h4 class="header-title m-t-0 text-center">New Exam</h4>

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
        <label for="inputEmail3" class="col-4 col-form-label text-right">Exam Name<span class="text-danger">*</span></label>
        <div class="col-7">
            <input type="text" required class="form-control" name="exam_name" placeholder="Exam Name" value="<?php echo set_value('test_name') ? set_value('test_name') : $exam_name; ?>" >
        </div>
    </div>                                
    <div class="form-group row">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Duration<span class="text-danger">*</span></label>
        <div class="col-7">
            <input type="text" required class="form-control" name="exam_duration" placeholder="Duration" value="<?php echo set_value('exam_duration') ? set_value('exam_duration') : $exam_duration; ?>">
        </div>
    </div>   
    <div class="row form-group">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Total Questions<span class="text-danger">*</span></label>
        <div class="col-7">
            <input type="text" required class="form-control" name="total_questions" placeholder="Total Questions" value="<?php echo set_value('total_questions') ? set_value('total_questions') : $total_questions; ?>">
        </div>
    </div> 
    <div class="row form-group">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Total Marks<span class="text-danger">*</span></label>
        <div class="col-7">
            <input type="text" required class="form-control" name="total_marks" placeholder="Total Marks" value="<?php echo set_value('total_marks') ? set_value('total_marks') : $total_marks; ?>">
        </div>
    </div> 
    <div class="row form-group">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Description<span class="text-danger">*</span></label>
        <div class="col-7">
            <textarea id="test_description" name="test_description"><?php echo set_value('test_description') ? set_value('test_description') : $description; ?></textarea>
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
                Update
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
                                                            <option value="10">10 Per Page</option>
                                                            <option value="50">50 Per Page</option>
                                                            <option value="100">100 Per Page</option>
                                                            <option selected value="200">200 Per Page</option>
                                                            <option value="500">500 Per Page</option>
                                                            <option value="1000">1000 Per Page</option>
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
                                            <?php
                                                if($exam_questions) {
                                                    foreach ($exam_questions as $questions) {
                                            ?>
                                                <tr data-selquestionid="<?php echo $questions['question_id'] ?>">
                                                    <td class="selected_sno">
                                                        <button data-selremoveid="<?php echo $questions['question_id'] ?>" class="btn btn-icon waves-effect waves-light btn-danger m-b-5 remove-circle"><i class="fa fa-remove"></i></button>
                                                        <input type="hidden" name="selected_question[<?php echo $questions['question_id'] ?>][question_id]" value="<?php echo $questions['question_id'] ?>">
                                                    </td>
                                                    <td><?php echo $questions['question']; ?></td>
                                                    <td> <input type="text" name="selected_question[<?php echo $questions['question_id'] ?>][right_mark]" class="form-control" value="<?php echo $questions['right_mark']; ?>"></td>
                                                    <td><input type="text" name="selected_question[<?php echo $questions['question_id'] ?>][wrong_mark]" class="form-control" value="<?php echo $questions['negative_mark']; ?>"></td>
                                                    <td><input type="text" name="selected_question[<?php echo $questions['question_id'] ?>][question_time]" class="form-control" value="<?php echo $questions['question_time']; ?>"></td>
                                                </tr>
                                            <?php
                                                    }
                                                }
                                            ?>


                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="form-group text-right m-b-0">
                            <div style="margin-top:30px;">
                                <button type="button" class="btn btn-info btn-custom waves-effect w-md waves-light m-b-5 close-selected-question"><i class="mdi mdi-arrow-left-bold"></i>Back To Questions &nbsp; </button> 
                                <button type="button" class="btn btn-success btn-custom waves-effect w-md waves-light m-b-5" id="model_submit"> Submit </button>                
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