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
                    <th>Category</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
            <?php
            if($category_list['result']) {
                $start = $category_list['start_count'] + 1;;
                foreach ($category_list['result'] as $list) {
            ?>
                <tr>
                    <th scope="row"><?php echo $start++; ?></th>
                    <td><?php echo $list->category; ?></td>
                    <td><?php echo $list->description; ?></td>
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
            <?php echo $category_list['pagination']; ?>
        </nav>
    </div>
    <div class="col-lg-4">
        <?php echo $category_list['status_txt']; ?>
    </div>
</div>