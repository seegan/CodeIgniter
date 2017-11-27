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
                <tr class="question_avail" data-questionid="<?php echo $list->id; ?>">
                    <td scope="row"><?php echo $start++; ?>
                        <input type="checkbox" class="checked_question" value="<?php echo $list->id; ?>">
                        <input type="hidden" class="right_mark" value="<?php echo $list->right_mark; ?>">
                        <input type="hidden" class="wrong_mark" value="<?php echo $list->negative_mark; ?>">
                        <input type="hidden" class="question_time" value="<?php echo $list->question_time; ?>">
                        <input type="hidden" class="question_title" value="<?php echo $list->question; ?>">
                    </td>
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