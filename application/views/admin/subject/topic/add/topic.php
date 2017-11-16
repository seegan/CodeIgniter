<h4 class="header-title m-t-0 text-center">New Subject</h4>

<form method="POST" action="<?php echo base_url('admin/subject/topic/add') ?>">

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
        <label for="inputEmail3" class="col-4 col-form-label text-right">Subject<span class="text-danger">*</span></label>
        <div class="col-7">
            <select class="form-control select2" name="subject">
                <option>Select Subject</option>
                <?php 
                    if($subjects) {
                        foreach ($subjects as $subject) {
                            echo "<option value='".$subject->id."'>".ucfirst($subject->subject)."</option>";
                        }
                    }
                ?>
            </select>
        </div>
    </div>                                
    <div class="form-group row">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Topic<span class="text-danger">*</span></label>
        <div class="col-7">
            <input type="text" required class="form-control" name="topic" placeholder="Topic" value="<?php echo set_value('topic'); ?>">
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