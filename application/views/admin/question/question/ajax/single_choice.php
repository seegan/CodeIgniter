<div class="col-sm-12">
    <div class="row match_folowing_example">
        <div class="row">
            <div class="col-lg-12 correct_option">
                Correct Answer :

                <div class="radio radio-success form-check-inline" data-option="A">
                    <input type="radio" id="inlineRadio-a" value="A" name="validoption" checked="">
                    <label for="inlineRadio-a"> A </label>
                </div>
                <div class="radio radio-success form-check-inline" data-option="B">
                    <input type="radio" id="inlineRadio-b" value="B" name="validoption">
                    <label for="inlineRadio-b"> B </label>
                </div>
                <div class="radio radio-success form-check-inline" data-option="C">
                    <input type="radio" id="inlineRadio-c" value="C" name="validoption">
                    <label for="inlineRadio-c"> C </label>
                </div>
                <div class="radio radio-success form-check-inline" data-option="D">
                    <input type="radio" id="inlineRadio-d" value="D" name="validoption">
                    <label for="inlineRadio-d"> D </label>
                </div>
            </div>
        </div>

    </div>
    <div class="row match_folowing_options">
        


        <div class="repeater">
            <div data-repeater-list="single_choice" class="row">
                <div data-repeater-item class="col-lg-6 options">
                    <div class="option_box">
                        <div>
                            <label for="radio">
                                Option : <span class="option-txt">A</span>
                            </label>
                            <div class="float-right">
                                <button type="button" data-repeater-delete class="btn btn-icon waves-effect waves-light btn-danger m-b-5"> <i class="fa fa-remove"></i> </button>
                            </div>  
                        </div>
                        <textarea class="option_editor" name="choice_data"></textarea>
                        <input data-repeater-delete type="button" value="Delete"/>
                    </div>
                </div>
                <div data-repeater-item class="col-lg-6 options">
                    <div class="option_box">
                        <div>
                            <label for="radio">
                                Option : <span class="option-txt">B</span>
                            </label>                  
                        </div>
                        <textarea class="option_editor" name="choice_data"></textarea>
                    </div>
                </div>
                <div data-repeater-item class="col-lg-6 options">
                    <div class="option_box">
                        <div>
                            <label for="radio">
                                Option : <span class="option-txt">C</span>
                            </label>                  
                        </div>
                        <textarea class="option_editor" name="choice_data"></textarea>
                    </div>
                </div>
                <div data-repeater-item class="col-lg-6 options">
                    <div class="option_box">
                        <div>
                            <label for="radio">
                                Option : <span class="option-txt">D</span>
                            </label>                  
                        </div>
                        <textarea class="option_editor" name="choice_data"></textarea>
                    </div>
                </div>
            </div>
            <div style="margin-top: 20px">
                <button type="button" data-repeater-create class="btn btn-sm btn-success">Add More Option</button>
            </div>
        </div>

    </div>
</div>