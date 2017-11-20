                                    <h4 class="header-title m-t-0 text-center">New Branch</h4>
                                    <form method="POST" action="<?php echo base_url('admin/branch/batch/add') ?>">
                                        <div class="form-group row">
                                            <label for="inputEmail3" class="col-4 col-form-label text-right">Branch Name<span class="text-danger">*</span></label>
                                            <div class="col-7">
                                                <select class="form-control select2 branch_name" required name="branch_name" >
                                                    <option>Select Branch</option>
                                                    <?php 
                                                        if($branchs) {
                                                            foreach ($branchs as $branch) {
                                                                echo "<option value='".$branch->id."'>".ucfirst($branch->name)."</option>";
                                                            }
                                                        }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputEmail3" class="col-4 col-form-label text-right">Batch Name<span class="text-danger">*</span></label>
                                            <div class="col-7">
                                                <input type="text" required class="form-control" placeholder="Batch Name" name="batch_name">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="hori-pass1" class="col-4 col-form-label text-right">Available Subjects<span class="text-danger">*</span></label>
                                            <div class="col-7">
                                                <select name="subjects[]" class="multi-select" required multiple="" id="batch_subjects" >
                                                    <option disabled selected value=""> -- Selected Subjects -- </option>
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