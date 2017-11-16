<h4 class="header-title m-t-0 text-center">New Subject</h4>

<form method="POST" action="<?php echo base_url('admin/subject/add') ?>">

    <div class="form-group row">
        <label class="col-4 col-form-label text-right"></label>
        <div class="col-7">
        <?php
            if(validation_errors() != false) {
        ?>
            <div class="alert alert-danger alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <?php echo validation_errors(); ?>
            </div>
        <?php
            }
        ?>
        </div>
    </div>


    <div class="form-group row">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Subject Name<span class="text-danger">*</span></label>
        <div class="col-7">
            <input type="text" required class="form-control" name="subject" placeholder="Subject Name" value="<?php echo set_value('subject'); ?>">
        </div>
    </div>
    <div class="form-group row">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Select Question Type<span class="text-danger">*</span></label>
        <div class="col-7">

            <?php
            if($question_types) {
                foreach ($question_types as $type) {
            ?>
                <div class="checkbox checkbox-success">
                    <input id="checkbox<?php echo $type->id; ?>" type="checkbox" name="question_type[]" value="<?php echo $type->id; ?>">
                    <label for="checkbox<?php echo $type->id; ?>">
                        <?php echo $type->question_type; ?>
                    </label>
                </div>
            <?php
                }
            }
            ?>
        </div>
    </div>



    <div class="form-group row">
        <label for="webSite" class="col-4 col-form-label text-right"></label>
        <div class="col-7">
            <button type="submit" class="btn btn-primary waves-effect waves-light">
                Create
            </button>
            <button type="reset"
                    class="btn btn-secondary waves-effect m-l-5">
                Cancel
            </button>
        </div>
    </div>
</form>