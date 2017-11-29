<?php
    // $language_list = $this->config->item('languages');
    // $difficulty = $this->config->item('difficulty');
    // $question_type = $this->config->item('question_type');
?>
<div class="row">
    <div class="col-lg-12">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Branch Name</th>
                    <th>Address</th>
                    <th>Country</th>
                    <th>State</th>
                    <th>City</th>
                    <th>Phone</th>
                    <th>Mobile</th>
                    <th>Contact Person</th>
                </tr>
            </thead>
            <tbody>
            <?php
            if($branch_list['result']) {
                $start = $branch_list['start_count'] + 1;;
                foreach ($branch_list['result'] as $list) {
            ?>
                <tr>
                    <th scope="row"><?php echo $start++; ?></th>
                    <td><?php echo $list->name; ?></td>
                    <td><?php echo $list->address; ?></td>
                    <td><?php echo $list->country; ?></td>
                    <td><?php echo $list->state; ?></td>
                    <td><?php echo $list->city; ?></td>
                    <td><?php echo $list->phone; ?></td>
                    <td><?php echo $list->mobile; ?></td>
                    <td><?php echo $list->contact_person; ?></td>
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
            <?php echo $branch_list['pagination']; ?>
        </nav>
    </div>
    <div class="col-lg-4">
        <?php echo $branch_list['status_txt']; ?>
    </div>
</div>