<h4 class="header-title m-t-0 text-center">New Question</h4>

<form method="POST" action="" class="add-question">


<?php
$type_list = $this->config->item('question_type');
$question = $question[$question_id];

$subject = isset($question['subject']) ? getSubjectNameById($question['subject']) : 0;
$topic = isset($question['topic']) ? getTopicNameById($question['topic']) : 0;
$question_type = isset($question['question_type']) ? $question['question_type'] : 1;
$language = isset($question['language']) ? $question['language'] : 'en';
$difficulty = isset($question['difficulty_level']) ? $question['difficulty_level'] : 2;
$year = isset($question['year']) ? $question['year'] : date('Y');



?>



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
                    <select class="form-control select2 question_subject" name="subject" readonly disabled="">
                        <option <?php echo $question['subject']  ?> selected><?php echo ($subject) ? $subject->subject : 'No Subject' ?></option>
                    </select>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4">
            <div class="form-group row">
                <div class="col-12">
                    <label class="col-form-label text-right">Topic<span class="text-danger">*</span></label>
                    <select class="form-control select2 question_topic" name="topic" id="question_topic" readonly disabled="">
                        <option <?php echo $question['topic']  ?> selected><?php echo ($topic) ? $topic->topic : 'No Subject' ?></option>
                    </select>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4">
            <div class="form-group row">
                <div class="col-12">
                    <label class="col-form-label text-right">Question Type<span class="text-danger">*</span></label>
                    <select class="form-control select2 question_type" name="type" id="question_type" readonly disabled="">
                        <option value="<?php echo isset($question_type) ? $question_type : 1; ?>" selected>
                            <?php echo $type_list[$question_type]; ?>
                        </option>
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
                            $language_list = getLanguageList($language);
                            foreach ($language_list as $key => $language) {
                                if($language['selected'] == true) {
                                    echo "<option selected value='".$key."'>".$language['language']."</option>";
                                } else {
                                    echo "<option value='".$key."'>".$language['language']."</option>";
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
                            $year_list = getYearList($year) ;
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
                    <select class="form-control select2" name="difficulty" style="text-transform: capitalize;">
                    <?php
                        $difficulty_list = getDifficultyList($difficulty);
                        foreach ($difficulty_list as $key => $difficulty) {
                            if($difficulty['selected'] == true) {
                                echo "<option selected value='".$key."'>".$difficulty['difficulty']."</option>";
                            } else {
                                echo "<option value='".$key."'>".$difficulty['difficulty']."</option>";
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
                    <input type="text" class="form-control search-input" name="right_mark" autocomplete="off" value="<?php echo isset($question['right_mark']) ? $question['right_mark'] : 0 ?>">
                </div>
                 <div class="col-4">
                    <label class="col-form-label text-right">Negative Mark</label>
                    <input type="text" class="form-control search-input" name="negative_mark" autocomplete="off" value="<?php echo isset($question['negative_mark']) ? $question['negative_mark'] : 0 ?>">
                </div>
                <div class="col-4">
                    <label class="col-form-label text-right">Time(Sec.)</label>
                    <input type="text" class="form-control search-input" name="time" autocomplete="off" value="<?php echo isset($question['question_time']) ? $question['question_time'] : 0 ?>">
                </div>
            </div>
        </div>
        <div class="col-sm-12">
            <div class="form-group row">
                <div class="col-12">
                    <label class="col-form-label text-right">Question<span class="text-danger">*</span></label>
                    <textarea id="main_question" name="main_question"><?php echo isset($question['question']) ? $question['question'] : 0 ?></textarea>
                </div>
            </div>
        </div>

        <div class="option_data col-sm-12">
            <?php
                if(isset($question['question_type'])) {
                    if($question['question_type'] == 1) {
                        echo $this->load->view('admin/question/question/update/question/single_choice', '', TRUE);
                    }
                    if($question['question_type'] == 2) {
                        echo $this->load->view('admin/question/question/update/question/multiple_choice', '', TRUE);
                    }
                    if($question['question_type'] == 3) {
                        echo $this->load->view('admin/question/question/update/question/fill_blank_choice', '', TRUE);
                    }
                    if($question['question_type'] == 4) {
                        echo $this->load->view('admin/question/question/update/question/true_false_choice', '', TRUE);
                    }
                    if($question['question_type'] == 5) {
                        echo $this->load->view('admin/question/question/update/question/match_folowing_choice', '', TRUE);
                    }
                }
            ?>

        </div>
    </div>

    <div class="form-group row">
        <label for="webSite" class="col-5 col-form-label text-right"></label>
        <div class="col-6">
            <button type="submit" class="btn btn-primary waves-effect waves-light">
                Update
            </button>
            <button type="reset"
                    class="btn btn-secondary waves-effect m-l-5">
                Cancel
            </button>
        </div>
    </div>
</form>