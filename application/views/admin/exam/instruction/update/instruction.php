<?php
$instruction_name = ($instruction && isset($instruction['instruction_name'])) ? $instruction['instruction_name'] : '';
$instruction_description = ($instruction && isset($instruction['instruction'])) ? $instruction['instruction'] : '';
?>
    <h4 class="header-title m-t-0 text-center">Update Instruction</h4>

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
        <label for="inputEmail3" class="col-4 col-form-label text-right">Instruction Name<span class="text-danger">*</span></label>
        <div class="col-7">
            <input type="text" required class="form-control" name="instruction_name" placeholder="Instruction Name" value="<?php echo set_value('instruction_name') ? set_value('instruction_name') : $instruction_name; ?>">
        </div>
    </div>
    <div class="row form-group">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Instruction Description<span class="text-danger">*</span></label>
        <div class="col-7">
            <textarea id="instruction" name="instruction"><?php echo set_value('instruction') ? set_value('instruction') : $instruction_description; ?></textarea>
        </div>
    </div>




    <div class="form-group row">
        <label for="webSite" class="col-4 col-form-label text-right"></label>
        <div class="col-7">
            <button type="submit" class="btn btn-primary waves-effect waves-light">
                Update
            </button>
            <button type="reset"
                    class="btn btn-secondary waves-effect m-l-5">
                Cancel
            </button>
        </div>
    </div>