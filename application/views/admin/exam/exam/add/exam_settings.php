	<h4 class="header-title m-t-0 text-left">Exam Settings</h4>



	<table class="table">
		<tbody class="settings-group">
			<tr>
				<td><a href="#" data-toggle="modal" data-target=".arrangement-grouping" >Arrangement &amp; Grouping</a></td>
				<td><a href="#" data-toggle="modal" data-target=".arrangement-grouping" ><i class="fa fa-expand"></i></a></td>
			</tr>
			<tr>
				<td><a href="#">Test Option</a></td>
				<td><a href="#"><i class="fa fa-expand"></i></a></td>
			</tr>
			<tr>
				<td><a href="#">Time Setting</a></td>
				<td><a href="#"><i class="fa fa-expand"></i></a></td>
			</tr>
			<tr>
				<td><a href="#">End Test Setting</a></td>
				<td><a href="#"><i class="fa fa-expand"></i></a></td>
			</tr>
			<tr>
				<td><a href="#">Analytics Setting</a></td>
				<td><a href="#"><i class="fa fa-expand"></i></a></td>
			</tr>
			<tr>
				<td><a href="#">Certificate Setting</a></td>
				<td><a href="#"><i class="fa fa-expand"></i></a></td>
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