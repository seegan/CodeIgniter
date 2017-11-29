            <!-- ========== Left Sidebar Start ========== -->

            <div class="left side-menu">
                <div class="sidebar-inner slimscrollleft">
                    <!--- Divider -->
                    <div id="sidebar-menu">
                        <ul>
                            <li class="menu-title">Main</li>

                            <li>
                                <a href="<?php echo base_url('admin/dashboard') ?>" class="waves-effect waves-primary"><i
                                        class="ti-home"></i><span> Dashboard </span></a>
                            </li>

                            <li class="has_sub">
                                <a href="javascript:void(0);" class="waves-effect waves-primary"><i class="mdi mdi-book-multiple-variant"></i><span> Qustion Bank </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="<?php echo base_url('admin/subject') ?>">Subject</a></li>
                                    <li><a href="<?php echo base_url('admin/subject/topic') ?>">Topic</a></li>
                                    <li><a href="<?php echo base_url('admin/question/category') ?>">Category</a></li>
                                    <li><a href="<?php echo base_url('admin/question') ?>">Question </a></li>
                                </ul>
                            </li>

                            <li class="has_sub">
                                <a href="javascript:void(0);" class="waves-effect waves-primary"><i class="mdi mdi-alarm-check"></i><span> Exam Scheduler </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="<?php echo base_url('admin/exam') ?>">Exam</a></li>
                                    <li><a href="<?php echo base_url('admin/exam/scheduler') ?>">Scheduler</a></li>
                                </ul>
                            </li>

                            <li class="has_sub">
                                <a href="javascript:void(0);" class="waves-effect waves-primary"><i class="fa fa-users"></i><span> Candidates </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="<?php echo base_url('admin/candidate') ?>">Candidates</a></li>
                                    <li><a href="<?php echo base_url('admin/candidate/assign_exam') ?>">Assign to Exam</a></li>
                                    <li><a href="<?php echo base_url('admin/candidate/end_exam') ?>">End Exam</a></li>
                                    <li><a href="<?php echo base_url('admin/candidate/resume_exam') ?>">Resume Exam</a></li>
                                </ul>
                            </li>

                            <li class="has_sub">
                                <a href="javascript:void(0);" class="waves-effect waves-primary"><i class="fa fa-mortar-board"></i><span> Results </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="<?php echo base_url('admin/candidate/result') ?>">Candidate Results</a></li>
                                </ul>
                            </li>

                            <li class="menu-title">System</li>

                            <li class="has_sub">
                                <a href="javascript:void(0);" class="waves-effect waves-primary"><i class="mdi mdi-lan"></i><span> Branchs </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="<?php echo base_url('admin/branch') ?>">Branch</a></li>
                                    <li><a href="<?php echo base_url('admin/branch/batch') ?>">Batch</a></li>
                                    <li><a href="<?php echo base_url('admin/branch/user') ?>">User</a></li>
                                    <li><a href="<?php echo base_url('admin/branch/settings') ?>">Settings</a></li>
                                </ul>
                            </li>

                        </ul>

                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <!-- Left Sidebar End -->