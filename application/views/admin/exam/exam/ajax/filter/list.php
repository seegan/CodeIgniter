<div class="row">
    <div class="col-lg-12">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Exam Name</th>
                    <th>Total Questions</th>
                    <th>Total Mark</th>
                    <th>Exam Duration</th>
                    <th>Created On</th>
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
                    <td><?php echo $list->exam_name; ?></td>
                    <td><?php echo $list->total_questions; ?></td>
                    <td><?php echo $list->total_marks; ?></td>
                    <td><?php echo $list->exam_duration; ?></td>
                    <td><?php echo $list->created_at; ?></td>
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