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
    }

</style>


<h4 class="header-title m-t-0 text-center">Import Candidates</h4>
    <div class="form-group row">
        <label for="inputEmail3" class="col-4 col-form-label text-right">Topic<span class="text-danger">*</span></label>
        <div class="col-7">

            <div id="upload-wrapper">
                <div align="center">
                    <form action="<?php echo base_url('admin/ImportAjax/candidate_import'); ?>" method="post" enctype="multipart/form-data" id="MyUploadForm">
                        <input name="FileInput" id="FileInput" type="file" />
                        <button type="submit"  id="submit-btn" value="Upload" class="btn btn-primary waves-effect waves-light">Upload</button>
                        <img src="<?php echo base_url() ?>theme/assets/images/ajax-loader.gif" id="loading-img" style="display:none;" alt="Please Wait"/>
                    </form>
                    <div id="progressbox" ><div id="progressbar"></div ><div id="statustxt">0%</div></div>
                    <div id="output"></div>
                </div>
            </div>


        </div>
    </div>   
