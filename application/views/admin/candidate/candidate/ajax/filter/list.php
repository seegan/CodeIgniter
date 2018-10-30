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
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <?php
            if($data_list['result']) {
                $start = $data_list['start_count'] + 1;;
                foreach ($data_list['result'] as $list) {
            ?>
                <tr>
                    <th scope="row"><?php echo $start++; ?></th>
                    <td><?php echo $list->username; ?></td>
                    <td><?php echo $list->enrollment_no; ?></td>
                    <td><?php echo $list->branch_id; ?></td>
                    <td><?php echo $list->batch_id; ?></td>
                    <td><?php echo $list->mobile; ?></td>
                    <td><?php echo $list->gender; ?></td>
                    <td><?php echo $list->registration_date; ?></td>
                    <td>
                        <a class="btn btn-icon waves-effect waves-light btn-info m-b-5" href="<?php echo base_url('admin/candidate/update').'/'.$list->user_id; ?>"> <i class="fa fa-keyboard-o"></i> </a>
                    </td>
                </tr>
            <?php
                }
            }
            ?>
            </tbody>
        </table>
    </div>
    <div class="col-lg-8">
        <nav>
            <?php echo $data_list['pagination']; ?>
        </nav>
    </div>
    <div class="col-lg-4">
        <?php echo $data_list['status_txt']; ?>
    </div>
</div>