<h4 class="header-title m-t-0 text-center">New Schedule</h4>

<form method="POST" action="<?php echo base_url('admin/exam/scheduler/add') ?>">

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
            <input type="text" required class="form-control" name="schedule_name" placeholder="Schedule Name" value="<?php echo set_value('schedule_name'); ?>">
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
                        <div class="input-group">
                            <input type="text" class="form-control date_pic" placeholder="Date Month Year" name="start_date">
                            <span class="input-group-addon bg-primary b-0 text-white"><i class="ion-calendar"></i></span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label style="margin-bottom:0;">End Date<span class="text-danger">*</span></label>
                        <div class="input-group">
                            <input type="text" class="form-control date_pic" placeholder="Date Month Year" name="end_date">
                            <span class="input-group-addon bg-primary b-0 text-white"><i class="ion-calendar"></i></span>
                        </div>
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
                        <div class="input-group">
                            <input type="text" required="" class="form-control time_pic" name="start_time">
                            <span class="input-group-addon bg-primary b-0 text-white"><i class="fa fa-clock-o" aria-hidden="true"></i></span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label style="margin-bottom:0;">End Time<span class="text-danger">*</span></label>
                        <div class="input-group">
                            <input type="text" required="" class="form-control time_pic" name="end_time">
                            <span class="input-group-addon bg-primary b-0 text-white"><i class="fa fa-clock-o" aria-hidden="true"></i></span>
                        </div>
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
                        <div class="input-group">
                            <input type="text" class="form-control date_pic" placeholder="Date Month Year" name="result_date">
                            <span class="input-group-addon bg-primary b-0 text-white"><i class="ion-calendar"></i></span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label style="margin-bottom:0;">Result Time<span class="text-danger">*</span></label>
                        <div class="input-group">
                            <input type="text" required="" class="form-control time_pic" name="result_time">
                            <span class="input-group-addon bg-primary b-0 text-white"><i class="fa fa-clock-o" aria-hidden="true"></i></span>
                        </div>
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
                        <div class="input-group bootstrap-touchspin">
                            <span class="input-group-addon bootstrap-touchspin-prefix">&#8377;</span>
                            <input id="demo2" type="text" value="0.00" name="exam_cost" class="form-control" style="display: block;">
                        </div>
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
                                <input type="radio" id="publish_result1" value="auto" name="result_as" checked="">
                                <label for="publish_result1"> Auto Result </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <div style="margin-top: 5px;">

                            <div class="radio radio-success form-check-inline">
                                <input type="radio" id="publish_result2" value="manual" name="result_as">
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
        <label for="inputEmail3" class="col-4 col-form-label text-right">Schedule To Batchs<span class="text-danger">*</span></label>
        <div class="col-7">
            <select name="exam_batchs[]" class="multi-select" required multiple="" id="question_batchs" >
                <option disabled selected value=""> -- Selected Batchs -- </option>
            </select>
        </div>
    </div>
    <div class="form-group row">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Schedule To</label>
        <div class="col-7">
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <div style="margin-top: 5px;">
                            <div class="radio radio-success form-check-inline">
                                <select class="form-control candidate_selection" name="schedule_to">
                                    <option value="1">All Candidate</option>
                                    <option value="2">Selected Candidate</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <div style="margin-top: 5px;">
                            <div class="radio radio-success form-check-inline select-candidate-btn" style="display:none;">
                                <button type="button" class="btn btn-danger btn-custom waves-effect w-md waves-light m-b-5 select-candidate" data-toggle="modal" data-target=".questions-model">Select Candidates &nbsp; <i class="mdi mdi-library-plus"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
                <div style="width:100%;"><h3>Select Candidates</h3></div>
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
                                                                <select class="form-control select2 candidate_batch" id="batchs_filter" name="batch_id">
                                                                    <option disabled>Select Batch</option>
                                                                    <option value="-1">All Batchs</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-12">
                                                                <input type="text" class="form-control username" name="user_name" id="username" placeholder="User Name">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-12">
                                                                <input type="text" class="form-control enrollment_no" name="enrollment_no" id="enrollment_no" placeholder="Enrollment No">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-12">
                                                                <input type="text" class="form-control contact_no" name="contact_no" id="mobile_no" placeholder="Mobile No / Phone No">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-12">
                                                                <input type="text" class="form-control user_email" name="user_email" id="email" placeholder="Email">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4">
                                                        <div class="form-group row">
                                                            <div class="col-12">
                                                                <select class="form-control select2 candidate_gender" name="gender" >
                                                                    <option disabled>Select Year</option>
                                                                    <option value="0">All Gender</option>
                                                                    <option value="Male">Male</option>
                                                                    <option value="Female">Female</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <div class="form-group row">
                                                            <div class="col-12">
                                                                <select class="form-control select2 candidate_year" name="candidate_year">
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
                                                    <div class="col-lg-2">
                                                        <div class="form-group row">
                                                            <div class="col-12">
                                                                <a class="btn btn-primary btn-custom waves-effect w-md waves-light m-b-5 candidate_search" style="color:#fff;width: 100%;">Search&nbsp;<i class="ti-search"></i></a>
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
                                                    <button type="button" class="btn btn-danger btn-custom waves-effect w-md waves-light m-b-5 selected-question" data-toggle="modal" data-target=".selected-candidate-model">Selected Questions &nbsp; <i class="mdi mdi-library-plus"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <input type="hidden" class="filter_action" value="candidate_scheduler_filter">
                                    
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="candidate_scheduler_filter">

                        </div>
                        <div class="form-group text-right m-b-0">
                            <div style="margin-top:30px;">
                                <button type="button" class="btn btn-secondary btn-custom waves-effect w-md waves-light m-b-5 close-select-candidate">Cancel</button>
                                <button type="button" class="btn btn-success btn-custom waves-effect w-md waves-light m-b-5 selected-question" data-toggle="modal" data-target=".selected-candidate-model">Selected Candidates &nbsp; <i class="mdi mdi-arrow-right-bold"></i></button>                              
                            </div>
                        </div>



                    </div>
                </div>
                <!-- end row -->

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->









<div class="modal fade selected-candidate-model" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
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
                        <div class="selected_candidate_list">
                            <div class="row">
                                <div class="col-lg-12">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>User Name</th>
                                                <th>Enrollment No</th>
                                                <th>Branch</th>
                                                <th>Batch</th>
                                                <th>Contact No</th>
                                                <th>Gender</th>
                                                <th>Registration Date</th>
                                            </tr>
                                        </thead>
                                        <tbody class="selected_candidate_block">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="form-group text-right m-b-0">
                            <div style="margin-top:30px;">
                                <button type="button" class="btn btn-info btn-custom waves-effect w-md waves-light m-b-5 close-selected-candidate"><i class="mdi mdi-arrow-left-bold"></i>Back To Questions &nbsp; </button> 
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