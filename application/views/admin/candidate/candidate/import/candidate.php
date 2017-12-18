<style type="text/css">
    /* prograss bar */
    #progressbox {
        border: 1px solid #CAF2FF;
        padding: 1px; 
        position:relative;
        width:400px;
        border-radius: 3px;
        margin: 10px;
        display:none;
        text-align:left;
    }
    #progressbar {
        height:20px;
        border-radius: 3px;
        background-color: #CAF2FF;
        width:1%;
    }
    #statustxt {
        top:3px;
        left:50%;
        position:absolute;
        display:inline-block;
        color: #FFFFFF;
        line-height: 20px;
    }
    #start_process_btn {
        display: none;
    }
</style>


<h4 class="header-title m-t-0 text-center">Import Questions</h4>
    <div class="form-group row">
        <label for="inputEmail3" class="col-4 col-form-label text-right">File<span class="text-danger">*</span></label>
        <div class="col-7">

            <div id="upload-wrapper">
                <div>
                    <form action="<?php echo base_url('admin/ImportAjax/candidate_import'); ?>" method="post" enctype="multipart/form-data" id="MyUploadForm">
                        <div style="margin-left:30px;">
                            <input name="FileInput" id="FileInput" type="file" />
                            <button type="submit"  id="submit-btn" value="Upload" class="btn btn-primary waves-effect waves-light">Analyze</button>
                            <img src="<?php echo base_url() ?>theme/assets/images/ajax-loader.gif" id="loading-img" style="display:none;" alt="Please Wait"/>                        
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="form-group row">
        <label for="inputEmail3" class="col-4 col-form-label text-right"></label>
        <div class="col-7">
            <div style="margin-left:30px;">
                <div id="progressbox" ><div id="progressbar"></div ><div id="statustxt">0%</div></div>
            </div>
        </div>
    </div>
    <div class="form-group row">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Upload Status</label>
        <div class="col-7">
            <div class="upload-status">
                <div style="margin-left:30px;">
                    <div id="output">Process Not yet started!</div>
                </div>
            </div>
        </div>
    </div> 
    <div class="form-group row">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Analyze Status</label>
        <div class="col-7">
            <div class="upload-status">
                <div id="analyze_data"><ul style="list-style: none;padding-left: 30px;margin-bottom: 0;"><li>Process Not yet started!</li></ul></div>
            </div>
        </div>
    </div>
    <div class="form-group row">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Create Candidate</label>
        <div class="col-7">
            <div class="upload-status">
                <div id="start_process_btn">
                    <ul style="list-style: none;padding-left: 30px;">
                        <li>
                            <button class="btn btn-success waves-effect m-b-5" id="update_start"> <i class="mdi mdi-content-save-all"></i> <span>Create</span> </button>
                            <button class="btn btn-secondary waves-effect m-b-5"> <i class="mdi mdi-delete-forever"></i> <span>Skip</span> </button>
                            <input type="hidden" id="update_id" value="0">
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>     