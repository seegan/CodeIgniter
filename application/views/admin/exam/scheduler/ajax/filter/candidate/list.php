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
            <tbody>
            <?php
            if($data_list['result']) {
                $start = $data_list['start_count'] + 1;;
                foreach ($data_list['result'] as $list) {
            ?>
                <tr class="candidate_avail" data-candidateid="<?php echo $list->user_id; ?>">
                    <th scope="row">
                        <?php echo $start++; ?>
                        <input type="checkbox" class="checked_candidate" value="<?php echo $list->user_id; ?>">
                        <input type="hidden" class="username" value="<?php echo $list->username; ?>">
                        <input type="hidden" class="enrollment_no" value="<?php echo $list->enrollment_no; ?>">
                        <input type="hidden" class="branch_id" value="<?php echo $list->branch_id; ?>">
                        <input type="hidden" class="batch_id" value="<?php echo $list->batch_id; ?>">
                        <input type="hidden" class="mobile" value="<?php echo $list->mobile; ?>">
                        <input type="hidden" class="gender" value="<?php echo $list->gender; ?>">
                        <input type="hidden" class="registration_date" value="<?php echo $list->registration_date; ?>">
                    </th>
                    <td><?php echo $list->username; ?></td>
                    <td><?php echo $list->enrollment_no; ?></td>
                    <td><?php echo $list->branch_id; ?></td>
                    <td><?php echo $list->batch_id; ?></td>
                    <td><?php echo $list->mobile; ?></td>
                    <td><?php echo $list->gender; ?></td>
                    <td><?php echo $list->registration_date; ?></td>
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