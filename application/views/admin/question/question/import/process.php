                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card-box">
                                    <h4 class="m-t-0 header-title">Triggers</h4>
                                    <p class="text-muted m-b-30 font-13">
                                        Trigger certain FooTable actions.
                                    </p>
                                    <input type="hidden" id="import_id" value="<?php echo $upload_id; ?>">
                                    <table id="import-list" class="table table-bordered toggle-circle">
                                        <thead>
                                        <tr>
                                            <th data-toggle="true"> User Id </th>
                                            <th> Enrollment No </th>
                                            <th> Name </th>
                                            <th> Email </th>
                                            <th> Status </th>
                                            <th data-hide="all"> Status Message </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php 
                                            if($import_list && is_array($import_list)) {
                                                foreach ($import_list as $key => $i_value) {
                                                    $active_status =  (isset($i_value['status'])) ? $i_value['status'] : 'deactive';
                                                    $status_message = (isset($i_value['status_message'])) ? $i_value['status_message'] : 'Waiting To Create..';
                                        ?>
                                            <tr data-baseid="<?php echo $key; ?>" class="list-import <?php echo $active_status; ?>" >
                                                <td><?php echo $i_value[0]; ?></td>
                                                <td><?php echo $i_value[2]; ?></td>
                                                <td><?php echo $i_value[3]; ?></td>
                                                <td><?php echo $i_value[7]; ?></td>
                                                <td class="import_status">
                                                    <?php 
                                                        echo $active_status;
                                                        if(!isset($i_value['status_message'])) {
                                                            echo '<span><img src="'.base_url('theme/assets/images').'/loader.gif"/></span>';
                                                        }
                                                    ?>
                                                    
                                                </td>
                                                <td class="status_msg">
                                                    <?php echo $status_message; ?>
                                                </td>
                                            </tr>
                                        <?php
                                                }
                                            }
                                        ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>