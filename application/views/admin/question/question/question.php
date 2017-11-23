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
                                    <h4 class="page-title">User List</h4>
                                    <ol class="breadcrumb float-right">
                                        <li class="breadcrumb-item"><a href="<?php echo base_url('admin/dashboard') ?>">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="<?php echo base_url('admin/branch') ?>">Branch</a></li>
                                        <li class="breadcrumb-item active">User</li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <ul class="nav nav-tabs card-header-tabs">
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="<?php echo base_url('admin/subject') ?>">Subject</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="<?php echo base_url('admin/subject/topic') ?>">Topic</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="<?php echo base_url('admin/question/category') ?>">Category</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link active" href="<?php echo base_url('admin/question') ?>">Question</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="page-title-box action-header">
                                                            <h2 class="text-center">
                                                                <i class="ion-person-add"></i>User
                                                            </h2>
                                                            <div class="action-group">
                                                                <button type="button" class="btn btn-primary btn-custom waves-effect w-md waves-light m-b-5 doubleClick" data-doubleatt=".double-add-topic" data-singleatt="<?php echo base_url('admin/question/add'); ?>">Add</button>
                                                                <button style="display:none;" type="button" class="btn btn-primary btn-custom waves-effect w-md waves-light m-b-5 double-add-topic" data-toggle="modal" data-target=".bs-example-modal-lg">Add</button>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr>

                                                <div class="filter-section">
                                                    <div class="row">
                                                        <div class="col-lg-2">
                                                            <label class="form-inline m-b-20">Show
                                                                <select name="ppage" class="form-control input-sm ppage">
                                                                    <option value="5" <?php echo ($this->paginatefilter->ppage == 5) ? 'selected' : '' ?>>5</option>
                                                                    <option value="10" <?php echo ($this->paginatefilter->ppage == 10) ? 'selected' : '' ?>>10</option>
                                                                    <option value="20" <?php echo ($this->paginatefilter->ppage == 20) ? 'selected' : '' ?>>20</option>
                                                                    <option value="50" <?php echo ($this->paginatefilter->ppage == 50) ? 'selected' : '' ?>>50</option>
                                                                </select>
                                                                entries
                                                            </label>
                                                        </div>

                                                    </div>
                                                  <input type="hidden" name="filter_action" class="filter_action" value="question_filter">
                                                  
                                                </div>
                                                <div class="question_filter">
                                                    <?php $this->load->view('admin/question/question/ajax/filter/list') ?>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- end row -->






                    </div>
                    <!-- end container -->
                </div>
                <!-- end content -->

            </div>
            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->






<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <?php $this->load->view('admin/question/question/add/question'); ?>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->            