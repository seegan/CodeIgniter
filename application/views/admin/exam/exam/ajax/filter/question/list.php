<?php
    $language_list = $this->config->item('languages');
    $difficulty = $this->config->item('difficulty');
    $question_type = $this->config->item('question_type');
?>
<div class="row">
    <div class="col-lg-12">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Question</th>
                    <th style="width: 200px;">Subject</th>
                    <th>Topic</th>
                    <th style="width: 200px;">Difficulty</th>
                    <th style="width: 100px;">Year</th>
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
                    <td class="filter_question"><?php echo $list->question; ?></td>
                    <td><?php echo $list->subject; ?></td>
                    <td><?php echo $list->topic; ?></td>
                    <td><?php echo $difficulty[$list->difficulty_level]; ?></td>
                    <td><?php echo $list->year; ?></td>
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