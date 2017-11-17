<h4 class="header-title m-t-0 text-center">New Question</h4>

<form method="POST" action="<?php echo base_url('admin/question/add') ?>" class="add-question">

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

    <div class="row">
        <div class="col-lg-3 col-md-4">
            <div class="form-group row">
                <div class="col-12">
                    <label class="col-form-label text-right">Subject<span class="text-danger">*</span></label>
                    <select class="form-control select2 question_subject" name="subject">
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
        </div>
        <div class="col-lg-3 col-md-4">
            <div class="form-group row">
                <div class="col-12">
                    <label class="col-form-label text-right">Topic<span class="text-danger">*</span></label>
                    <select class="form-control select2 question_topic" name="topic" id="question_topic">
                        <option>Select Topic</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4">
            <div class="form-group row">
                <div class="col-12">
                    <label class="col-form-label text-right">Question Type<span class="text-danger">*</span></label>
                    <select class="form-control select2 question_type" name="type" id="question_type">
                        <option>Select Subject</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4">
            <div class="form-group row">
                <div class="col-12">
                    <label class="col-form-label text-right">Language</label>
                    <select class="form-control select2" name="language">
                        <?php
                            $language_list = getLanguageList('en');
                            foreach ($language_list as $language) {
                                if($language['selected'] == true) {
                                    echo "<option selected>".$language['language']."</option>";
                                } else {
                                    echo "<option>".$language['language']."</option>";
                                }
                            }
                        ?>
                    </select>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4">
            <div class="form-group row">
                <div class="col-12">
                    <label class="col-form-label text-right">Year</label>
                    <select class="form-control select2" name="year">
                        <?php 
                            $year_list = getYearList(date('Y')) ;
                            foreach ($year_list as $year) {
                                if($year['selected'] == true) {
                                    echo "<option selected>".$year['year']."</option>";
                                } else {
                                    echo "<option>".$year['year']."</option>";
                                }
                            }
                        ?>
                    </select>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4">
            <div class="form-group row">
                <div class="col-12">
                    <label class="col-form-label text-right">Difficulty Level<span class="text-danger">*</span></label>
                    <select class="form-control select2" name="subject" style="text-transform: capitalize;">
                    <?php
                        $difficulty_list = getDifficultyList('medium');
                        foreach ($difficulty_list as $difficulty) {
                            if($difficulty['selected'] == true) {
                                echo "<option selected>".$difficulty['difficulty']."</option>";
                            } else {
                                echo "<option>".$difficulty['difficulty']."</option>";
                            }
                        }
                    ?>
                    </select>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="form-group row">
                <div class="col-4">
                    <label class="col-form-label text-right">Right Mark</label>
                    <input type="text" class="form-control search-input" autocomplete="off">
                </div>
                 <div class="col-4">
                    <label class="col-form-label text-right">Negative Mark</label>
                    <input type="text" class="form-control search-input" autocomplete="off">
                </div>
                <div class="col-4">
                    <label class="col-form-label text-right">Time(Sec.)</label>
                    <input type="text" class="form-control search-input" autocomplete="off">
                </div>
            </div>
        </div>
        <div class="col-sm-12">
            <div class="form-group row">
                <div class="col-12">
                    <label class="col-form-label text-right">Question<span class="text-danger">*</span></label>
                    <textarea id="main_question" name="main_question"></textarea>
                </div>
            </div>
        </div>



        <div class="option_data col-sm-12">
            
        </div>




    </div>

    <div class="form-group row">
        <label for="webSite" class="col-5 col-form-label text-right"></label>
        <div class="col-6">
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