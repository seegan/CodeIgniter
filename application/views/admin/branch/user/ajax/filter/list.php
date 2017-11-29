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
                    <th>User Name</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
            <?php
            if($user_list['result']) {
                $start = $user_list['start_count'] + 1;;
                foreach ($user_list['result'] as $list) {
            ?>
                <tr>
                    <th scope="row"><?php echo $start++; ?></th>
                    <td><?php echo $list->username; ?></td>
                    <td><?php echo $list->email; ?></td>
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
            <?php echo $user_list['pagination']; ?>
        </nav>
    </div>
    <div class="col-lg-4">
        <?php echo $user_list['status_txt']; ?>
    </div>
</div>