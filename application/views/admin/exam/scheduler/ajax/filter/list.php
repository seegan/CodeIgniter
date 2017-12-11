<div class="row">
    <div class="col-lg-12">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Schedule Name</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Result Date</th>
                    <th>Offered As</th>
                    <th>Result As</th>
                    <th>Schedule To</th>
                    <th>Schedule Status</th>
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
                    <td><?php echo $list->schedule_name; ?></td>
                    <td><?php echo $list->start_date; ?></td>
                    <td><?php echo $list->end_date; ?></td>
                    <td><?php echo $list->result_date; ?></td>
                    <td><?php echo ($list->offered_as == 'paid') ? ucfirst($list->offered_as).' ('.$list->offer_cost.')' : 'Free';  ?></td>
                    <td><?php echo ucfirst($list->result_as); ?></td>
                    <td><?php echo ($list->schedule_to == 1) ? 'All' : 'Selected'; ?></td>
                    <td><?php echo $list->schedule_status; ?></td>
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