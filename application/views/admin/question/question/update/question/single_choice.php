<?php
$answer_choice = $question[$question_id]['answer_option'];
$options = $question[$question_id]['options'];
$answer_option = searchInsideArray ($options, 'question_id', 'option_id', $question_id, $answer_choice);
$option_key = $options[$answer_option]['option_key'];
?>

<div class="col-sm-12">
    <div class="row match_folowing_example">
        <div class="row">
            <div class="col-lg-12 correct_option">
                Correct Answer :
                <div class="radio radio-success form-check-inline" data-option="A">
                    <input type="radio" id="inlineRadio-a" value="A" name="validoption" <?php echo ($option_key && $option_key == 'A') ? 'checked' : '';  ?>>
                    <label for="inlineRadio-a"> A </label>
                </div>
                <div class="radio radio-success form-check-inline" data-option="B">
                    <input type="radio" id="inlineRadio-b" value="B" name="validoption" <?php echo ($option_key && $option_key == 'B') ? 'checked' : '';  ?>>
                    <label for="inlineRadio-b"> B </label>
                </div>
                <div class="radio radio-success form-check-inline" data-option="C">
                    <input type="radio" id="inlineRadio-c" value="C" name="validoption" <?php echo ($option_key && $option_key == 'C') ? 'checked' : '';  ?>>
                    <label for="inlineRadio-c"> C </label>
                </div>
                <div class="radio radio-success form-check-inline" data-option="D">
                    <input type="radio" id="inlineRadio-d" value="D" name="validoption" <?php echo ($option_key && $option_key == 'D') ? 'checked' : '';  ?>>
                    <label for="inlineRadio-d"> D </label>
                </div>
            </div>
        </div>
    </div>
    <div class="row match_folowing_options">


        <div class="repeater">
            <div data-repeater-list="single_choice" class="row">

            <?php
                if($options) {
                    $i = 0; 
                    foreach ($options as $option_value) {
            ?>
                <div data-repeater-item class="col-lg-6 options">
                    <div class="option_box">
                        <div>
                            <label for="radio">
                                Option : <span class="option-txt"><?php echo $option_value['option_key'] ?></span>
                            </label>
                            <?php 
                                if($i == 0) {
                            ?>
                                <div class="float-right">
                                    <button type="button" data-repeater-delete class="btn btn-icon waves-effect waves-light btn-danger m-b-5"> <i class="fa fa-remove"></i> </button>
                                </div>
                            <?php
                                }
                            ?>
                        </div>
                        <textarea class="option_editor" name="choice_data"><?php echo $option_value['option_val'] ?></textarea>
                    </div>
                </div>
            <?php
                        $i++;
                    }
                }
            ?>
            </div>
            <div style="margin-top: 20px">
                <button type="button" data-repeater-create class="btn btn-sm btn-success">Add More Option</button>
            </div>
        </div>

    </div>
</div>