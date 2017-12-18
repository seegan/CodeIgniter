<?php
$schedule_name = ($schedule && isset($schedule['schedule_name'])) ? $schedule['schedule_name'] : '';
$description = ($schedule && isset($schedule['description'])) ? $schedule['description'] : '';
$start_date = ($schedule && isset($schedule['start_date'])) ? machine_to_man_date($schedule['start_date']) : '';
$start_time = ($schedule && isset($schedule['start_date'])) ? machine_to_man_time($schedule['start_date']) : '';
$end_date = ($schedule && isset($schedule['end_date'])) ? machine_to_man_date($schedule['end_date']) : '';
$end_time = ($schedule && isset($schedule['end_date'])) ? machine_to_man_time($schedule['end_date']) : '';
$result_date = ($schedule && isset($schedule['result_date'])) ? machine_to_man_date($schedule['result_date']) : '';
$result_time = ($schedule && isset($schedule['result_date'])) ? machine_to_man_time($schedule['result_date']) : '';

$offered_as = ($schedule && isset($schedule['offered_as'])) ? $schedule['offered_as'] : 'free';
$offer_cost = ($schedule && isset($schedule['offer_cost'])) ? $schedule['offer_cost'] : 0.00;
$result_as = ($schedule && isset($schedule['result_as'])) ? $schedule['result_as'] : 'auto';
$schedule_to = ($schedule && isset($schedule['schedule_to'])) ? $schedule['schedule_to'] : 1;

$exam_id = isset($schedule['exam_id']) ? $schedule['exam_id'] : 0;
$exam_name = isset($exam['exam_name']) ? $exam['exam_name'] : false;

$selected_batchs = array();
$selected_batch_ids = implode(',', array_keys($selected_batchs));
?>

<h4 class="header-title m-t-0 text-center">New Schedule</h4>
<form method="POST" action="">

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
            <input type="text" required class="form-control" name="schedule_name" placeholder="Schedule Name" value="<?php echo set_value('schedule_name') ? set_value('schedule_name') : $schedule_name; ?>">
        </div>
    </div> 
    <div class="row form-group">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Description<span class="text-danger">*</span></label>
        <div class="col-7">
            <textarea id="schedule_description" name="schedule_description"><?php echo set_value('schedule_description') ? set_value('schedule_description') : $description; ?></textarea>
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
                            <input type="text" class="form-control date_pic" placeholder="Date Month Year" name="start_date" value="<?php echo set_value('start_date') ? set_value('start_date') : $start_date; ?>">
                            <span class="input-group-addon bg-primary b-0 text-white"><i class="ion-calendar"></i></span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label style="margin-bottom:0;">End Date<span class="text-danger">*</span></label>
                        <div class="input-group">
                            <input type="text" class="form-control date_pic" placeholder="Date Month Year" name="end_date" value="<?php echo set_value('end_date') ? set_value('end_date') : $end_date; ?>">
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
                            <input type="text" required="" class="form-control time_pic" name="start_time" value="<?php echo set_value('start_time') ? set_value('start_time') : $start_time; ?>">
                            <span class="input-group-addon bg-primary b-0 text-white"><i class="fa fa-clock-o" aria-hidden="true"></i></span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label style="margin-bottom:0;">End Time<span class="text-danger">*</span></label>
                        <div class="input-group">
                            <input type="text" required="" class="form-control time_pic" name="end_time" value="<?php echo set_value('end_time') ? set_value('end_time') : $end_time; ?>">
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
                            <input type="text" class="form-control date_pic" placeholder="Date Month Year" name="result_date" value="<?php echo set_value('result_date') ? set_value('result_date') : $result_date; ?>">
                            <span class="input-group-addon bg-primary b-0 text-white"><i class="ion-calendar"></i></span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label style="margin-bottom:0;">Result Time<span class="text-danger">*</span></label>
                        <div class="input-group">
                            <input type="text" required="" class="form-control time_pic" name="result_time" value="<?php echo set_value('result_time') ? set_value('result_time') : $result_time; ?>">
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
                                <input type="radio" id="offer_as1" value="paid" name="offer_as" <?php echo ($offered_as && $offered_as =='paid') ? 'checked' : ''; ?>>
                                <label for="offer_as1"> Paid </label>
                            </div>
                            <div class="radio radio-success form-check-inline">
                                <input type="radio" id="offer_as2" value="free" name="offer_as" <?php echo ($offered_as && $offered_as =='free') ? 'checked' : ''; ?>>
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
                            <input id="demo2" type="text" name="exam_cost" class="form-control" style="display: block;" value="<?php echo ($offer_cost) ? $offer_cost : 0.00; ?>">
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
                                <input type="radio" id="publish_result1" value="auto" name="result_as" <?php echo ($result_as && $result_as =='auto') ? 'checked' : '';  ?>>
                                <label for="publish_result1"> Auto Result </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <div style="margin-top: 5px;">

                            <div class="radio radio-success form-check-inline">
                                <input type="radio" id="publish_result2" value="manual" name="result_as" <?php echo ($result_as && $result_as =='manual') ? 'checked' : '';  ?>>
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
            
                <input type="text" required class="form-control" placeholder="Search Exam" value="<?php echo set_value('schedule_exam') ? set_value('schedule_exam') : $exam_name; ?>" id="schedule_exam">
                <button type="button" class="btn btn-icon waves-effect waves-light btn-danger m-b-5 remove-circle button-readonly" style="display:block;"><i class="fa fa-remove"></i></button>
            </div>
            <input type="hidden" class="exam_id" name="exam_id" value="<?php echo $exam_id; ?>">
        </div>
    </div>
    <div class="row form-group">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Schedule To Batchs<span class="text-danger">*</span></label>
        <div class="col-7">
            <select name="exam_batchs[]" class="multi-select" required multiple="" id="question_batchs" >
                <option disabled selected value=""> -- Selected Batchs -- </option>
                <?php
                if($eligible_batchs) {
                    foreach ($eligible_batchs as $batch_value) {
                        $checked = array_search($batch_value->batch_id, array_column($schedule_batchs, 'batch_id'));
                        if($checked !== false) {
                            $selected = 'selected';
                            $selected_batchs[$batch_value->batch_id]['batch_id'] = $batch_value->batch_id;
                            $selected_batchs[$batch_value->batch_id]['batch_name'] = $batch_value->batch_name;
                        } else {
                            $selected = '';
                        }
                        echo "<option ".$selected." value='".$batch_value->batch_id."'> ".$batch_value->batch_name." </option>";
                    }
                }

                $selected_batch_ids = implode(',', array_keys($selected_batchs));
                ?>
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
                                    <option value="1" <?php echo ($schedule_to && $schedule_to == 1) ? 'selected' : '';  ?>>All Candidate</option>
                                    <option value="2" <?php echo ($schedule_to && $schedule_to == 2) ? 'selected' : ''; ?>>Selected Candidate</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <div style="margin-top: 5px;">
                            <?php 
                                $display = ($schedule_to && $schedule_to == 1) ? 'none' : 'block';
                            ?>
                            <div class="radio radio-success form-check-inline select-candidate-btn" style="display:<?php echo $display; ?>">
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
                                                                    <option value="<?php echo $selected_batch_ids; ?>">All Batchs</option>
                                                                    <?php
                                                                        if($selected_batchs && count($selected_batchs) > 0) {
                                                                            foreach ($selected_batchs as $s_batch) {
                                                                                echo "<option value='".$s_batch['batch_id']."''>".$s_batch['batch_name']."</option>";
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
                                            <div class="col-lg-12 col-md-12">
                                                <div class="form-group row">
                                                    <div class="col-12">
                                                        Input Controls
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-md-12">
                                                <div class="form-group row">
                                                    <div class="col-12">
                                                        Input Controls
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
                                            <?php
                                                if($schedule_candidates) {
                                                    foreach ($schedule_candidates as $candidates) {
                                            ?>
                                                <tr data-selcandidateid="<?php echo $candidates['user_id'] ?>" data-selbatchid="<?php echo $candidates['batch_id'] ?>">
                                                    <td class="selected_sno">
                                                        <button data-selremoveid="<?php echo $candidates['user_id'] ?>" class="btn btn-icon waves-effect waves-light btn-danger m-b-5 remove-circle"><i class="fa fa-remove"></i></button>
                                                        <input type="hidden" name="selected_candidate[<?php echo $candidates['user_id'] ?>][candidate_id]" value="<?php echo $candidates['user_id'] ?>">
                                                    </td>
                                                    <td><?php echo $candidates['name'] ?></td>
                                                    <td><?php echo $candidates['enrollment_no'] ?></td>
                                                    <td><?php echo $candidates['branch_id'] ?></td>
                                                    <td><?php echo $candidates['batch_id'] ?></td>
                                                    <td><?php echo $candidates['mobile'] ?></td>
                                                    <td><?php echo $candidates['gender'] ?></td>
                                                    <td><?php echo $candidates['registration_date'] ?></td>
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