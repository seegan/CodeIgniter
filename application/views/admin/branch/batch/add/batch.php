                                    <h4 class="header-title m-t-0 text-center">New Branch</h4>
                                    <form method="POST" action="<?php echo base_url('admin/branch/batch/add') ?>">
                                        <div class="form-group row">
                                            <label for="inputEmail3" class="col-4 col-form-label text-right">Batch Name<span class="text-danger">*</span></label>
                                            <div class="col-7">
                                                <input type="text" required class="form-control" placeholder="Batch Name" name="name">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="inputEmail3" class="col-4 col-form-label text-right">Branch Admin<span class="text-danger">*</span></label>
                                            <div class="col-7">
                                                <select class="form-control select2" name="branch_admin">
                                                    <option>Select Admin</option>
                                                    <?php 
                                                        if($branch_users) {
                                                            foreach ($branch_users as $users) {
                                                                echo "<option value='".$users->user_id."'>".ucfirst($users->username)."</option>";
                                                            }
                                                        }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="hori-pass1" class="col-4 col-form-label text-right">Address<span class="text-danger">*</span></label>
                                            <div class="col-7">
                                                <input type="text" placeholder="Address" required class="form-control" name="address">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="webSite" class="col-4 col-form-label text-right">Country</label>
                                            <div class="col-7">
                                                <select class="form-control select2" id="countySel" name="country">
                                                    <option>Select Country</option>
                                                </select>

                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="webSite" class="col-4 col-form-label text-right">State</label>
                                            <div class="col-7">
                                                <select class="form-control select2" id="stateSel" name="state">
                                                    <option>Select State</option>
                                                </select>

                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="webSite" class="col-4 col-form-label text-right">City</label>
                                            <div class="col-7">
                                                <select class="form-control select2" id="citySel" name="city">
                                                    <option>Select City</option>
                                                </select>

                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="hori-pass1" class="col-4 col-form-label text-right">Zip Code<span class="text-danger">*</span></label>
                                            <div class="col-7">
                                                <input type="text" placeholder="Zip Code" required class="form-control" name="zip">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="hori-pass1" class="col-4 col-form-label text-right">Phone No<span class="text-danger">*</span></label>
                                            <div class="col-7">
                                                <input type="text" placeholder="Phone Number" required class="form-control" name="phone">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="hori-pass1" class="col-4 col-form-label text-right">Contact Person<span class="text-danger">*</span></label>
                                            <div class="col-7">
                                                <input type="text" placeholder="Contact Person Name" required class="form-control" name="contact_person">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="hori-pass1" class="col-4 col-form-label text-right">Mobile No<span class="text-danger">*</span></label>
                                            <div class="col-7">
                                                <input type="text" placeholder="Mobile Number" required class="form-control" name="mobile">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="hori-pass1" class="col-4 col-form-label text-right">Available Subjects<span class="text-danger">*</span></label>
                                            <div class="col-7">
                                                <select name="subjects[]" class="multi-select" multiple="" id="my_multi_select3" >
                                                    <?php 
                                                        if($subjects) {
                                                            foreach ($subjects as $subject) {
                                                                echo '<option value="'.$subject->id.'">'.$subject->subject.'</option>';
                                                            }
                                                        }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>



                                        <div class="form-group row">
                                            <label for="webSite" class="col-4 col-form-label text-right"></label>
                                            <div class="col-7">
                                                <button type="submit" class="btn btn-primary waves-effect waves-light">
                                                    Register
                                                </button>
                                                <button type="reset"
                                                        class="btn btn-secondary waves-effect m-l-5">
                                                    Cancel
                                                </button>
                                            </div>
                                        </div>
                                    </form>