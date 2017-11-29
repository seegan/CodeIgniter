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
                    <th>Batch</th>
                </tr>
            </thead>
            <tbody>
            <?php
            if($batch_list['result']) {
                $start = $batch_list['start_count'] + 1;;
                foreach ($batch_list['result'] as $list) {
            ?>
                <tr>
                    <th scope="row"><?php echo $start++; ?></th>
                    <td><?php echo $list->name; ?></td>
                    <td><?php echo $list->batch_name; ?></td>
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
            <?php echo $batch_list['pagination']; ?>
        </nav>
    </div>
    <div class="col-lg-4">
        <?php echo $batch_list['status_txt']; ?>
    </div>
</div>