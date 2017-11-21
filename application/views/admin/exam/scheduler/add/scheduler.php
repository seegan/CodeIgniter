<h4 class="header-title m-t-0 text-center">New Subject</h4>

<form method="POST" action="<?php echo base_url('admin/candidate/add') ?>">

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
                    <input type="text" placeholder="" required class="form-control" name="username">
                </div>
                <div class="form-group">
                    <label>Enrollment No<span class="text-danger">*</span></label>
                    <input type="text" placeholder="" required class="form-control" name="enroll_no">
                </div>
                <div class="form-group">
                    <label>Password<span class="text-danger">*</span></label>
                    <input type="text" placeholder="" required class="form-control" name="passwd">
                </div>
                <div class="form-group">
                    <label>Confirm Password<span class="text-danger">*</span></label>
                    <input type="text" placeholder="" required class="form-control" name="repasswd">
                </div>
                <div class="form-group m-b-0">
                    <label>Name<span class="text-danger">*</span></label>
                    <input type="text" placeholder="" required class="form-control" name="name">
                </div>
                <div class="form-group m-b-0">
                    <label>Registration Date<span class="text-danger">*</span></label>
                    <input type="text" placeholder="" required class="form-control" name="registration_date">
                </div>
                <div class="form-group m-b-0">
                    <label>Email<span class="text-danger">*</span></label>
                    <input type="text" placeholder="" required class="form-control" name="email">
                </div>
                <div class="form-group m-b-0">
                    <label>Mobile Number<span class="text-danger">*</span></label>
                    <input type="text" placeholder="" required class="form-control" name="mobile">
                </div>
                <div class="form-group m-b-0">
                    <label>Branch<span class="text-danger">*</span></label>

                    <select class="form-control select2 branch_name" required name="branch_name" >
                        <option value="0">Select Branch</option>
                        <?php 
                            if($branchs) {
                                foreach ($branchs as $branch) {
                                    echo "<option value='".$branch->id."'>".ucfirst($branch->name)."</option>";
                                }
                            }
                        ?>
                    </select>


                </div>                
                <div class="form-group m-b-0">
                    <label>Course / Batch<span class="text-danger">*</span></label>
                    <select class="form-control select2 batch_name" required name="batch_name" id="batch_name">
                        <option value="0">Select Batch</option>
                    </select>
                </div>                
            </div>
        </div>

        <div class="col-md-6">
            <div class="p-20">

                <div class="form-group">
                    <label>Date Of Birth</label>
                    <input type="text" placeholder="" class="form-control" name="birth_date">
                </div>
                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="text" placeholder="" class="form-control" name="phone">
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <textarea placeholder="" class="form-control" name="address"></textarea>
                </div>
                <div class="form-group m-b-0">
                    <label>Enquiry Medium</label>
                    <input type="text" placeholder="" class="form-control" name="enquiry_from">
                </div>
                <div class="form-group m-b-0">
                    <label>How did you hear about us?</label>
                    <input type="text" placeholder="" class="form-control" name="hear_from">
                </div>
                <div class="form-group m-b-0">
                    <label>Guardian Name</label>
                    <input type="text" placeholder="" class="form-control" name="guardian_name">
                </div>
                <div class="form-group m-b-0">
                    <label>Guardian Mobile No</label>
                    <input type="text" placeholder="" class="form-control" name="guardian_mobile">
                </div>
                <div class="form-group">
                    <label>Gender</label>
                    <div style="line-height: 10px;padding-top: 15px;">
                        <div class="radio radio-success form-check-inline" style="line-height: 20px;">
                            <input type="radio" id="inlineRadio1" value="Male" name="gender" checked="">
                            <label for="inlineRadio1" style="padding:0;margin:0;"> Male </label>
                        </div>
                        <div class="radio radio-success form-check-inline" style="line-height: 20px;">
                            <input type="radio" id="inlineRadio2" value="Female" name="gender">
                            <label for="inlineRadio2" style="padding:0;margin:0;"> Female </label>
                        </div>
                    </div>
                </div>                
                <div class="form-group m-b-0">
                    <label>Activation</label>
                    <div style="line-height: 10px;padding-top: 15px;">
                        <div class="radio radio-success form-check-inline" style="line-height: 20px;">
                            <input type="radio" id="inlineRadio3" value="Active" name="activation" checked="">
                            <label for="inlineRadio3" style="padding:0;margin:0;"> Active </label>
                        </div>
                        <div class="radio radio-success form-check-inline" style="line-height: 20px;">
                            <input type="radio" id="inlineRadio4" value="InActive" name="activation">
                            <label for="inlineRadio4" style="padding:0;margin:0;"> Inactive </label>
                        </div>
                    </div>
                </div>
                <div class="form-group m-b-0">
                    <label>Send Mail</label>
                    <div>
                        <div class="checkbox checkbox-success">
                            <input id="checkbox3" type="checkbox" name="send_mail" value="1">
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