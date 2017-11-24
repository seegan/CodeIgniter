

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
                                                        <a class="nav-link active" href="<?php echo base_url('admin/candidate') ?>">Candidate</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="<?php echo base_url('admin/subject/topic') ?>">Topic</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="<?php echo base_url('admin/question/category') ?>">Category</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="<?php echo base_url('admin/question') ?>">Question</a>
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
                                                                <a href="<?php echo base_url('admin/exam/add'); ?>" class="btn btn-primary btn-custom waves-effect w-md waves-light m-b-5 double-add-candidate" style="color:#fff;">New</a>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-lg-2">
                                                        <label class="form-inline m-b-20">Show
                                                            <select id="demo-show-entries" class="form-control input-sm">
                                                                <option value="5">5</option>
                                                                <option value="10">10</option>
                                                                <option value="15">15</option>
                                                                <option value="20">20</option>
                                                            </select>
                                                            entries
                                                        </label>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <div class="input-daterange input-group m-b-20" id="date-range">
                                                            <input type="text" class="form-control" name="start" />
                                                            <span class="input-group-addon bg-primary b-0 text-white">to</span>
                                                            <input type="text" class="form-control" name="end" />
                                                        </div>
                                                    </div> 
                                                </div>


                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <table id="demo-foo-accordion" class="table m-b-0 table-bordered toggle-arrow-tiny" data-page-size="20">
                                                            <thead>
                                                                <tr>
                                                                    <th data-toggle="true"> First Name </th>
                                                                    <th> Last Name </th>
                                                                    <th data-hide="phone"> Job Title </th>
                                                                    <th data-hide="all"> DOB </th>
                                                                    <th data-hide="all"> Status </th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>Isidra</td>
                                                                    <td>Boudreaux</td>
                                                                    <td>Traffic Court Referee</td>
                                                                    <td>22 Jun 1972</td>
                                                                    <td><span class="badge label-table badge-success">Active</span></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Shona</td>
                                                                    <td>Woldt</td>
                                                                    <td>Airline Transport Pilot</td>
                                                                    <td>3 Oct 1981</td>
                                                                    <td><span class="badge label-table badge-default">Disabled</span></td>
                                                                </tr>
                                                            </tbody>
                                                            <tfoot>
                                                                <tr class="active">
                                                                    <td colspan="5">
                                                                        <div class="text-right">
                                                                            <ul class="pagination pagination-split justify-content-end footable-pagination m-t-10"></ul>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tfoot>
                                                        </table>
                                                    </div>
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