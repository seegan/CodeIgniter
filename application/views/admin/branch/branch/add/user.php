                                    <h4 class="header-title m-t-0 text-center">New User</h4>




                                    <form method="POST" action="<?php echo base_url('admin/branch/user/add') ?>">

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
                                            <label for="inputEmail3" class="col-4 col-form-label text-right">User Name<span class="text-danger">*</span></label>
                                            <div class="col-7">
                                                <input type="text" required class="form-control" name="username" placeholder="User Name" value="<?php echo set_value('username'); ?>">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="hori-pass1" class="col-4 col-form-label text-right">Password<span class="text-danger">*</span></label>
                                            <div class="col-7">
                                                <input type="password" placeholder="Password" name="passwd" required class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="hori-pass1" class="col-4 col-form-label text-right">Email<span class="text-danger">*</span></label>
                                            <div class="col-7">
                                                <input type="text" placeholder="Email" name="email" required class="form-control" value="<?php echo set_value('email'); ?>">
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