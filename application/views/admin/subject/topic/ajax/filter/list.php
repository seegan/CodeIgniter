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
                    <th>Subject</th>
                    <th>Topic</th>
                </tr>
            </thead>
            <tbody>
            <?php
            if($topic_list['result']) {
                $start = $topic_list['start_count'] + 1;;
                foreach ($topic_list['result'] as $list) {
            ?>
                <tr>
                    <th scope="row"><?php echo $start++; ?></th>
                    <td><?php echo $list->subject; ?></td>
                    <td><?php echo $list->topic; ?></td>
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
            <?php echo $topic_list['pagination']; ?>
        </nav>
    </div>
    <div class="col-lg-4">
        <?php echo $topic_list['status_txt']; ?>
    </div>
</div>