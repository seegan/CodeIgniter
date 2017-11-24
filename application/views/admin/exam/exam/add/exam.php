<h4 class="header-title m-t-0 text-center">New Exam</h4>

<form method="POST" action="<?php echo base_url('admin/question/category/add') ?>">

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
        <label for="inputEmail3" class="col-4 col-form-label text-right">Test Name<span class="text-danger">*</span></label>
        <div class="col-7">
            <input type="text" required class="form-control" name="category" placeholder="Category" value="<?php echo set_value('category'); ?>">
        </div>
    </div>                                
    <div class="form-group row">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Duration<span class="text-danger">*</span></label>
        <div class="col-7">
            <input type="text" required class="form-control" name="duration" placeholder="Duration" value="<?php echo set_value('description'); ?>">
        </div>
    </div>   
    <div class="row form-group">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Total Questions<span class="text-danger">*</span></label>
        <div class="col-7">
            <input type="text" required class="form-control" name="duration" placeholder="Duration" value="<?php echo set_value('description'); ?>">
        </div>
    </div> 
    <div class="row form-group">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Total Marks<span class="text-danger">*</span></label>
        <div class="col-7">
            <input type="text" required class="form-control" name="duration" placeholder="Duration" value="<?php echo set_value('description'); ?>">
        </div>
    </div> 
    <div class="row form-group">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Description<span class="text-danger">*</span></label>
        <div class="col-7">
            <textarea id="test_description" name="test_description"></textarea>
        </div>
    </div> 
    <div class="row form-group">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Questions<span class="text-danger">*</span></label>
        <div class="col-7">


<!--         <button type="button" class="btn btn-primary btn-custom waves-effect w-md waves-light m-b-5 double-add-topic" data-toggle="modal" data-target=".bs-example-modal-lg">Add</button> -->

<button type="button" class="btn btn-primary btn-custom waves-effect w-md waves-light m-b-5 double-add-topic" data-toggle="modal" data-target=".bs-example-modal-lg">Add</button>

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