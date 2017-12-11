<?php
    $candidate_branch = ( $candidate_branch && $candidate_branch->branch_id ) ? $candidate_branch->branch_id : 0;
    $candidate_batch = ( $candidate_batch && $candidate_batch->batch_id ) ? $candidate_batch->batch_id : 0;
    $candidate_gender = ( $candidate_data && $candidate_data->gender ) ? $candidate_data->gender : 'Male';
    $send_mail = ( $candidate_data && $candidate_data->send_mail ) ? $candidate_data->send_mail : 0;
    $candidate_active = ( $candidate_data && $candidate_data->banned ) ? $candidate_data->banned : 0;

?>
<h4 class="header-title m-t-0 text-center">New Subject</h4>
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

    <div class="row">
        <div class="col-md-6">
            <div class="p-20">
                <div class="form-group">
                    <label>User ID<span class="text-danger">*</span></label>
                    <input type="text" placeholder="" class="form-control" readonly="" value="<?php echo $candidate_data->username; ?>">
                </div>
                <div class="form-group m-b-0">
                    <label>Email<span class="text-danger">*</span></label>
                    <input type="text" placeholder="" class="form-control" readonly=""  value="<?php echo $candidate_data->email; ?>">
                </div>
                <div class="form-group">
                    <label>Enrollment No<span class="text-danger">*</span></label>
                    <input type="text" placeholder="" required class="form-control" name="enroll_no" value="<?php echo set_value('username') ? set_value('enroll_no') : $candidate_data->enrollment_no; ?>">
                </div>
                <div class="form-group">
                    <label>Password<span class="text-danger">*</span></label>
                    <input type="password" placeholder="" required class="form-control" name="passwd" value="<?php echo set_value('passwd') ? set_value('passwd') : $candidate_data->ref_pass; ?>">
                </div>
                <div class="form-group">
                    <label>Confirm Password<span class="text-danger">*</span></label>
                    <input type="password" placeholder="" required class="form-control" name="repasswd" value="<?php echo set_value('repasswd') ? set_value('repasswd') : $candidate_data->ref_pass; ?>">
                </div>
                <div class="form-group m-b-0">
                    <label>Name<span class="text-danger">*</span></label>
                    <input type="text" placeholder="" required class="form-control" name="name" value="<?php echo set_value('name') ? set_value('name') : $candidate_data->name; ?>">
                </div>
                <div class="form-group m-b-0">
                    <label>Registration Date<span class="text-danger">*</span></label>
                    <input type="text" placeholder="" required class="form-control date_pic" name="registration_date" value="<?php echo set_value('registration_date') ? set_value('registration_date') : machine_to_man_date($candidate_data->registration_date); ?>">
                </div>
                <div class="form-group m-b-0">
                    <label>Mobile Number<span class="text-danger">*</span></label>
                    <input type="text" placeholder="" required class="form-control" name="mobile" value="<?php echo set_value('mobile') ? set_value('mobile') : $candidate_data->mobile; ?>">
                </div>
                <div class="form-group m-b-0">
                    <label>Branch<span class="text-danger">*</span></label>

                    <select class="form-control select2 branch_name" required name="branch_name"  value="">
                        <option value="0">Select Branch</option>
                        <?php 
                            if($branchs) {
                                foreach ($branchs as $branch) {
                                    $active = ($candidate_branch && $candidate_branch == $branch->id) ? 'selected' : '';
                                    echo "<option ".$active." value='".$branch->id."'>".ucfirst($branch->name)."</option>";
                                }
                            }
                        ?>
                    </select>

                </div>                
                <div class="form-group m-b-0">
                    <label>Course / Batch<span class="text-danger">*</span></label>
                    <select class="form-control select2 batch_name" required name="batch_name" id="batch_name">
                        <option value="0">Select Batch</option>
                        <?php 
                            if($batchs) {
                                foreach ($batchs as $batch) {
                                    $active = ($candidate_batch && $candidate_batch == $batch->id) ? 'selected' : '';
                                    echo "<option ".$active." value='".$batch->id."'>".ucfirst($batch->batch_name)."</option>";
                                }
                            }
                        ?>
                    </select>
                </div>                
            </div>
        </div>
        <div class="col-md-6">
            <div class="p-20">
                <div class="form-group">
                    <label>Date Of Birth</label>
                    <input type="text" placeholder="" class="form-control date_pic" name="birth_date" value="<?php echo set_value('birth_date') ? set_value('birth_date') : machine_to_man_date($candidate_data->birth_date); ?>">
                </div>
                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="text" placeholder="" class="form-control" name="phone" value="<?php echo ( set_value('phone') ) ? set_value('phone') : $candidate_data->phone; ?>">
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <textarea placeholder="" class="form-control" name="address"><?php echo set_value('address') ? set_value('address') : $candidate_data->address; ?></textarea>
                </div>
                <div class="form-group m-b-0">
                    <label>Enquiry Medium</label>
                    <input type="text" placeholder="" class="form-control" name="enquiry_from" value="<?php echo set_value('enquiry_from') ? set_value('enquiry_from') : $candidate_data->enquiry_from; ?>">
                </div>
                <div class="form-group m-b-0">
                    <label>How did you hear about us?</label>
                    <input type="text" placeholder="" class="form-control" name="hear_from" value="<?php echo set_value('hear_from') ? set_value('hear_from') : $candidate_data->hear_from; ?>">
                </div>
                <div class="form-group m-b-0">
                    <label>Guardian Name</label>
                    <input type="text" placeholder="" class="form-control" name="guardian_name" value="<?php echo set_value('guardian_name') ? set_value('guardian_name') : $candidate_data->guardian_name; ?>">
                </div>
                <div class="form-group m-b-0">
                    <label>Guardian Mobile No</label>
                    <input type="text" placeholder="" class="form-control" name="guardian_mobile" value="<?php echo set_value('guardian_mobile') ? set_value('guardian_mobile') : $candidate_data->guardian_mobile; ?>">
                </div>
                <div class="form-group">
                    <label>Gender</label>
                    <div style="line-height: 10px;padding-top: 15px;">
                        <div class="radio radio-success form-check-inline" style="line-height: 20px;">
                            <input type="radio" id="inlineRadio1" value="Male" name="gender" <?php echo ($candidate_gender == 'Male') ? 'checked' : ''; ?>>
                            <label for="inlineRadio1" style="padding:0;margin:0;"> Male </label>
                        </div>
                        <div class="radio radio-success form-check-inline" style="line-height: 20px;">
                            <input type="radio" id="inlineRadio2" value="Female" name="gender" <?php echo ($candidate_gender == 'Female') ? 'checked' : ''; ?>>
                            <label for="inlineRadio2" style="padding:0;margin:0;"> Female </label>
                        </div>
                    </div>
                </div>                
                <div class="form-group m-b-0">
                    <label>Activation</label>
                    <div style="line-height: 10px;padding-top: 15px;">
                        <div class="radio radio-success form-check-inline" style="line-height: 20px;">
                            <input type="radio" id="inlineRadio3" name="activation" value="0" <?php echo ($candidate_active == 0) ? 'checked' : ''; ?>>
                            <label for="inlineRadio3" style="padding:0;margin:0;"> Active </label>
                        </div>
                        <div class="radio radio-success form-check-inline" style="line-height: 20px;">
                            <input type="radio" id="inlineRadio4" name="activation" value="1" <?php echo ($candidate_active == 1) ? 'checked' : ''; ?>>
                            <label for="inlineRadio4" style="padding:0;margin:0;"> Inactive </label>
                        </div>
                    </div>
                </div>
                <div class="form-group m-b-0">
                    <label>Send Mail</label>
                    <div>
                        <div class="checkbox checkbox-success">
                            <input id="checkbox3" type="checkbox" name="send_mail" value="1" <?php echo ($send_mail == 1) ? 'checked' : ''; ?>>
                            <label for="checkbox3">
                                Visible
                            </label>
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
</form>