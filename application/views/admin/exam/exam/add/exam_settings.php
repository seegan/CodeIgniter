	<h4 class="header-title m-t-0 text-left">Exam Settings</h4>



	<table class="table">
		<tbody class="settings-group">
			<tr>
				<td><a href="#" data-toggle="modal" data-target=".arrangement-grouping">Arrangement &amp; Grouping</a></td>
				<td><a href="#" data-toggle="modal" data-target=".arrangement-grouping"><i class="fa fa-expand"></i></a></td>
			</tr>
			<tr>
				<td><a href="#" data-toggle="modal" data-target=".test-option">Test Option</a></td>
				<td><a href="#" data-toggle="modal" data-target=".test-option"><i class="fa fa-expand"></i></a></td>
			</tr>
			<tr>
				<td><a href="#" data-toggle="modal" data-target=".time-settings">Time Setting</a></td>
				<td><a href="#" data-toggle="modal" data-target=".time-settings"><i class="fa fa-expand"></i></a></td>
			</tr>
			<tr>
				<td><a href="#" data-toggle="modal" data-target=".end-test">End Test Setting</a></td>
				<td><a href="#" data-toggle="modal" data-target=".end-test"><i class="fa fa-expand"></i></a></td>
			</tr>
			<tr>
				<td><a href="#" data-toggle="modal" data-target=".analytics-setting">Analytics Setting</a></td>
				<td><a href="#" data-toggle="modal" data-target=".analytics-setting"><i class="fa fa-expand"></i></a></td>
			</tr>
			<tr>
				<td><a href="#" data-toggle="modal" data-target=".certificate">Certificate Setting</a></td>
				<td><a href="#" data-toggle="modal" data-target=".certificate"><i class="fa fa-expand"></i></a></td>
			</tr>
		</tbody>
	</table>








<div class="modal fade arrangement-grouping" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-settings">
	    <div class="modal-content">
	        <div class="modal-header text-center">
	            <div style="width:100%;"><h3>Arrangement & Grouping (Random Question)</h3></div>
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	        </div>
	        <div class="modal-body">
	            <div class="card">
	                <div class="card-body">
	                    <div class="row">
	                        <div class="col-lg-12">

	                        	<p style="text-align: center; display: block;" id="OrderBy">Order By</p>
								<div class="graphbox">
									<div class="form-group" id="innercontent">
										<div class="row">
											<div class="col-sm-6">
												Arrange in Sequence
											</div>
											<div class="col-sm-6" style="text-align:center">
												<div class="radio"> 
													<input type="radio" name="settings[grouping][sequence]" id="grouping_sequence0" checked=""> <label for="grouping_sequence0">User Define</label> 
													<input type="radio" name="settings[grouping][sequence]" id="grouping_sequence1" > <label for="grouping_sequence1">Random</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<br>
								<p style="text-align:center">Shuffling</p>
								<div class="graphbox">
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6">
												Allowing Shuffling of Option
											</div>
											<div class="col-sm-6" style="text-align:center">
												<div class="radio"> 
													<input type="radio" name="settings[grouping][shuffling]" id="grouping_shuffling0" checked=""> <label for="grouping_shuffling0">Yes</label> 
													<input type="radio" name="settings[grouping][shuffling]" id="grouping_shuffling1"> <label for="grouping_shuffling1">No</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<br>
								<p style="text-align:center">Timer</p>
								<div class="graphbox">
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6">
												Allow Question Time
											</div>
											<div class="col-sm-6" style="text-align:center">
												<div class="radio"> 
													<input type="radio" name="settings[grouping][time]" id="grouping_time0" checked=""> <label for="grouping_time0">Yes</label> 
													<input type="radio" name="settings[grouping][time]" id="grouping_time1"> <label for="grouping_time1">No</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group text-center" style="margin-top:20px;">
									<div class="col-sm-12">
										<button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
										<button type="reset" class="btn btn-primary waves-effect waves-light">Reset</button>
									</div>
								</div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</div>




<div class="modal fade test-option" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-settings">
	    <div class="modal-content">
	        <div class="modal-header text-center">
	            <div style="width:100%;"><h3>Test Options</h3></div>
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	        </div>
	        <div class="modal-body">
	            <div class="card">
	                <div class="card-body">
	                    <div class="row">
	                        <div class="col-lg-12">
								<p style="text-align:center">Options</p>
								<div class="graphbox">
									<div class="checkbox">
										<input type="checkbox" name="settings[test_option][all_question]" id="ResponseAllQuestions">
										<label for="ResponseAllQuestions">Ask user to respond to all question</label> 
									</div>
									<div class="checkbox"> 
										<input type="checkbox" name="settings[test_option][back_move]" id="AllowBackMove"> <label for="AllowBackMove">Allow back movement(Previous button)</label> 
									</div>
									<div class="checkbox"> 
										<input type="checkbox" name="settings[test_option][next_move]" id="AllowNextMove"> <label for="AllowNextMove">Allow next movement(Next button)</label> 
									</div>
									<div class="checkbox"> 
										<input type="checkbox" name="settings[test_option][allow_save]" id="SaveTest"> <label for="SaveTest">Show Save Test Option</label> 
									</div>
									<div class="checkbox"> 
										<input type="checkbox" name="settings[test_option][review_next]" id="AllowReviewNextMove"> <label for="AllowReviewNextMove">Not Allow Review &amp; Next movement(Review &amp; Next button)</label> 
									</div>
									<div class="checkbox"> 
										<input type="checkbox" name="settings[test_option][show_question_paper]" id="ShowQuestionPaper"> <label for="ShowQuestionPaper">Show Question Paper</label> 
									</div>
									<div class="checkbox"> 
										<input type="checkbox" name="settings[test_option][show_question]" id="ShowSolution"> <label for="ShowSolution">Show solution and correct answer after every attempt</label> 
									</div>
									<div class="checkbox"> 
										<input type="checkbox" name="settings[test_option][show_mark]" id="ShowMark"> <label for="ShowMark">Show Marks/Points for test</label> 
									</div>
									<div class="checkbox"> 
										<input type="checkbox" name="settings[test_option][allow_calculator]" id="ShowCalculator"> <label for="ShowCalculator">Show Calculator</label>
									</div>
									<div class="checkbox"> 
										<input type="checkbox" name="settings[test_option][fullscreen]" id="ShowFullScreen"> <label for="ShowFullScreen">Show Full Screen</label>
									</div>
									<div class="checkbox"> 
										<input type="checkbox" name="settings[test_option][textsize]" id="TextSize"> <label for="TextSize">Allow Text Size</label> 
									</div>
									<div class="checkbox" style="padding-left:0px"> 
										<input type="checkbox" name="settings[test_option][student_report]" id="StudentReport"> <label for="StudentReport">Allow Student Report</label> 
									</div>
									<div class="checkbox" style="padding-left:0px"> 
										<input type="checkbox" name="settings[test_option][language_choice]"  id="selectLanguage"> <label for="selectLanguage">Allow Select Language</label> 
									</div>
									<div class="checkbox"> 
										<input type="checkbox" name="settings[test_option][allow_download]" id="allowdownload"> <label for="allowdownload">Allow Download File</label> 
									</div>
								</div>

								<br>
								<p style="text-align:center">Attempts</p>
								<div class="graphbox">
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6" style="text-align:left">
												Total Attempt Count
											</div>
											<div class="col-sm-6" style="text-align:left;">
												<input type="text" name="settings[test_option][total_attempt]" class="form-control" id="TotalAttempt" value="1">
											</div>
										</div>
									</div>
								</div>

								<br>
								<p style="text-align:center">Mail Notify</p>
								<div class="graphbox">
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6" style="text-align:left">
												Send Mail After Creat Test
											</div>
											<div class="col-sm-6" style="text-align:left;">
												<div class="radio"> 
													<input type="radio" name="settings[test_option][send_mail]" id="Mail" value="1"> <label for="Mail">Yes</label>
													<input type="radio" name="settings[test_option][send_mail]" id="Mail0" checked="" value="0"> <label for="Mail0">No</label>
												</div>
											</div>
										</div>
									</div>
								</div>


								<div class="form-group text-center" style="margin-top:20px;">
									<div class="col-sm-12">
										<button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
										<button type="reset" class="btn btn-primary waves-effect waves-light">Reset</button>
										
									</div>
								</div>


	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</div>




<div class="modal fade time-settings" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-settings">
	    <div class="modal-content">
	        <div class="modal-header text-center">
	            <div style="width:100%;"><h3>Time Settings</h3></div>
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	        </div>
	        <div class="modal-body">
	            <div class="card">
	                <div class="card-body">
	                    <div class="row">
	                        <div class="col-lg-12">

	                        	<p style="text-align: center; display: block;" id="OrderBy">Time Bound</p>
								<div class="graphbox">
									<div class="form-group" id="innercontent">
										<div class="row">
											<div class="col-sm-6">
												End Test With in Time Bound
											</div>
											<div class="col-sm-6" style="text-align:center">
												<div class="radio"> 
													<input type="radio" name="settings[time][time_bound]" id="time_bound0" checked=""> <label for="time_bound0">Yes</label> 
													<input type="radio" name="settings[time][time_bound]" id="time_bound1" > <label for="time_bound1">No</label>
												</div>
											</div>
										</div>
									</div>
								</div>

								<br>

								<p style="text-align:center">Clock Format</p>
								<div class="graphbox">
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6">
												Select Clock Format
											</div>
											<div class="col-sm-6" style="text-align:center">
												<div class="radio"> 
													<input type="radio" name="settings[time][format]" id="time_format0" checked=""> <label for="time_format0">hh:mm:ss</label> 
													<input type="radio" name="settings[time][format]" id="time_format1"> <label for="time_format1">hh:mm</label>
												</div>
											</div>
										</div>
									</div>
								</div>

								<br>

								<p style="text-align:center">Timer</p>
								<div class="graphbox">
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6">
												Allow Question Time
											</div>
											<div class="col-sm-6" style="text-align:center">
												<div class="radio"> 
													<input type="radio" name="settings[grouping][time]" id="grouping_time0" checked=""> <label for="grouping_time0">Yes</label> 
													<input type="radio" name="settings[grouping][time]" id="grouping_time1"> <label for="grouping_time1">No</label>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="form-group text-center" style="margin-top:20px;">
									<div class="col-sm-12">
										<button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
										<button type="reset" class="btn btn-primary waves-effect waves-light">Reset</button>
										
									</div>
								</div>

	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</div>



<div class="modal fade end-test" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-settings">
	    <div class="modal-content">
	        <div class="modal-header text-center">
	            <div style="width:100%;"><h3>End Test Setting</h3></div>
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	        </div>
	        <div class="modal-body">
	            <div class="card">
	                <div class="card-body">
	                    <div class="row">
	                        <div class="col-lg-12">

								<div class="graphbox">
									<div class="form-group" id="innercontent">
										<div class="row">
											<div class="col-sm-6">
												Show Score
											</div>
											<div class="col-sm-6" style="text-align:center">
												<div class="radio"> 
													<input type="radio" name="settings[end_test][show_score]" id="show_score0" checked=""> <label for="show_score0">Yes</label> 
													<input type="radio" name="settings[end_test][show_score]" id="show_score1" > <label for="show_score1">No</label>
												</div>
											</div>
										</div>
									</div>
								</div>

								<br>

								<div class="graphbox">
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6">
												Custom Message
											</div>
											<div class="col-sm-6" style="text-align:center">
												<div class="radio"> 
													<input type="radio" name="settings[end_test][custom_message]" id="custom_message0" checked=""> <label for="custom_message0">Yes</label> 
													<input type="radio" name="settings[end_test][custom_message]" id="custom_message1"> <label for="custom_message1">No</label>
												</div>
											</div>
										</div>
									</div>
								</div>

								<br>

								<p style="text-align:center">Pass/Fail Marks(%)</p>
								<div class="graphbox">
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6">
												Show Pass/Fail on the basis of Marks(%)
											</div>
											<div class="col-sm-6" style="text-align:center">
												<div class="radio"> 
													<input type="radio" name="settings[end_test][mark_basis]" id="mark_basis0" checked=""> <label for="mark_basis0">Yes</label> 
													<input type="radio" name="settings[end_test][mark_basis]" id="mark_basis1"> <label for="mark_basis1">No</label>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="form-group text-center" style="margin-top:20px;">
									<div class="col-sm-12">
										<button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
										<button type="reset" class="btn btn-primary waves-effect waves-light">Reset</button>
										
									</div>
								</div>

	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</div>


<div class="modal fade analytics-setting" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-settings">
	    <div class="modal-content">
	        <div class="modal-header text-center">
	            <div style="width:100%;"><h3>Student Analytics Setting</h3></div>
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	        </div>
	        <div class="modal-body">
	            <div class="card">
	                <div class="card-body">
	                    <div class="row">
	                        <div class="col-lg-12">

	                        	<p style="text-align: center; display: block;">Order By</p>
								<div class="graphbox">
									<div class="form-group">
										<div class="row">
											<div class="col-sm-4" id="">
												Show Student Analytics <br><br>
												<div class="radio"> 
													<input type="radio" name="settings[analytics][show_report]" id="ShowReport" value="1" checked=""> <label for="ShowReport">Yes</label>
													<input type="radio" name="settings[analytics][show_report]" id="ShowReport0" value="0" ><label for="ShowReport0">No</label>
												</div>
											</div>
											<div class="col-sm-8" style="text-align:left; border-left: 2px solid #A1A1A1;">
												Select Student Analytics to show <br><br>
												<div class="checkbox"> 
													<input type="checkbox" value="1" id="ScoreCardReport" name="ScoreCardReport" checked=""><label for="ScoreCardReport">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Test Analysis</label> 
												</div>
												<div class="checkbox"> 
													<input type="checkbox" value="2" id="QuestionWiseReport" name="QuestionWiseReport" checked=""> <label for="QuestionWiseReport">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Questions &amp; Answers</label> 
												</div>
												<div class="checkbox"> 
													<input type="checkbox" value="4" id="TopicReport" name="TopicReport" checked=""> <label for="TopicReport">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Time Taken in Section</label> 
												</div>
												<div class="checkbox"> 
													<input type="checkbox" value="5" id="TimeManagementReport" name="TimeManagementReport" checked=""> <label for="TimeManagementReport">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Time Taken in Topic</label> 
												</div>
												<div class="checkbox"> 
													<input type="checkbox" value="7" id="DifficultyLevelReport" name="DifficultyLevelReport" checked=""> <label for="DifficultyLevelReport">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Difficulty Level</label> 
												</div>
												<div class="checkbox"> 
													<input type="checkbox" value="3" id="ComparisonReport" name="ComparisonReport" checked=""> <label for="ComparisonReport">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Comparison</label> 
												</div>
												<div class="checkbox"> 
													<input type="checkbox" value="6" id="SolutionReport" name="SolutionReport" checked=""> <label for="SolutionReport">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Solution</label> 
												</div>
											</div>
										</div>
									</div>
								</div>
								<br>
								<p style="text-align:center">Advance</p>
								<div class="graphbox">
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6">
												Allow result generate, before test complete
											</div>
											<div class="col-sm-6" style="text-align:center">
												<div class="radio"> 
													<input type="radio" name="settings[end_test][mark_basis]" id="mark_basis0" checked=""> <label for="mark_basis0">Yes</label> 
													<input type="radio" name="settings[end_test][mark_basis]" id="mark_basis1"> <label for="mark_basis1">No</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<br>
								<p style="text-align:center">Export</p>
								<div class="graphbox">
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6">
												Allow question paper download 
											</div>
											<div class="col-sm-6" style="text-align:center">
												<div class="radio"> 
													<input type="radio" name="settings[end_test][mark_basis]" id="mark_basis0" checked=""> <label for="mark_basis0">Yes</label> 
													<input type="radio" name="settings[end_test][mark_basis]" id="mark_basis1"> <label for="mark_basis1">No</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-6">
												Allow print solution 
											</div>
											<div class="col-sm-6" style="text-align:center">
												<div class="radio"> 
													<input type="radio" name="settings[end_test][mark_basis]" id="mark_basis0" checked=""> <label for="mark_basis0">Yes</label> 
													<input type="radio" name="settings[end_test][mark_basis]" id="mark_basis1"> <label for="mark_basis1">No</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<br>
								<p style="text-align:center">Send Mail</p>
								<div class="graphbox">
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6">
												Send Mail After Submit Test 
											</div>
											<div class="col-sm-6" style="text-align:center">
												<div class="radio"> 
													<input type="radio" name="settings[end_test][mark_basis]" id="mark_basis0" checked=""> <label for="mark_basis0">Yes</label> 
													<input type="radio" name="settings[end_test][mark_basis]" id="mark_basis1"> <label for="mark_basis1">No</label>
												</div>
											</div>
										</div>
									</div>
								</div>


								<div class="form-group text-center" style="margin-top:20px;">
									<div class="col-sm-12">
										<button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
										<button type="reset" class="btn btn-primary waves-effect waves-light">Reset</button>
										
									</div>
								</div>

	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</div>


<div class="modal fade certificate" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-settings">
	    <div class="modal-content">
	        <div class="modal-header text-center">
	            <div style="width:100%;"><h3>Student Certificate Setting</h3></div>
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	        </div>
	        <div class="modal-body">
	            <div class="card">
	                <div class="card-body">
	                    <div class="row">
	                        <div class="col-lg-12">

	                        	<p style="text-align: center; display: block;" id="OrderBy">Student Certificate</p>
								<div class="graphbox">
									<div class="form-group" id="innercontent">
										<div class="row">
											<div class="col-sm-6">
												Certificate
											</div>
											<div class="col-sm-6" style="text-align:center">
												<div class="radio"> 
													<input type="radio" name="settings[time][time_bound]" id="time_bound0" checked=""> <label for="time_bound0">Enable</label> 
													<input type="radio" name="settings[time][time_bound]" id="time_bound1" > <label for="time_bound1">Disable</label>
												</div>
											</div>
										</div>
									</div>
								</div>


								<div class="form-group text-center" style="margin-top:20px;">
									<div class="col-sm-12">
										<button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
										<button type="reset" class="btn btn-primary waves-effect waves-light">Reset</button>
										
									</div>
								</div>

	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</div>