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
                    <th>Description</th>
                    <th style="width:200px;">Action</th>
                </tr>
            </thead>
            <tbody>
            <?php
            if($subject_list['result']) {
                $start = $subject_list['start_count'] + 1;;
                foreach ($subject_list['result'] as $list) {
            ?>
                <tr>
                    <th scope="row"><?php echo $start++; ?></th>
                    <td><?php echo $list->subject; ?></td>
                    <td><?php echo $list->description; ?></td>
                    <td>
                        <a class="btn btn-icon waves-effect waves-light btn-info m-b-5" href="<?php echo base_url('admin/subject/update').'/'.$list->id; ?>"> <i class="fa fa-keyboard-o"></i> </a>
                        <!-- <button class="btn btn-icon waves-effect waves-light btn-danger m-b-5"> <i class="fa fa-remove"></i> </button> -->
                    </td>
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
            <?php echo $subject_list['pagination']; ?>
        </nav>
    </div>
    <div class="col-lg-4">
        <?php echo $subject_list['status_txt']; ?>
    </div>
</div>