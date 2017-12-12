<?php
/*echo "<pre>";
var_dump($import_list);
echo "</pre>";*/

?>



                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card-box">
                                    <h4 class="m-t-0 header-title">Triggers</h4>
                                    <p class="text-muted m-b-30 font-13">
                                        Trigger certain FooTable actions.
                                    </p>
                                    <input type="hidden" id="import_id" value="<?php echo $upload_id; ?>">
                                    <table id="import-candidate-list" class="table table-bordered toggle-circle">
                                        <thead>
                                        <tr>
                                            <th data-toggle="true"> User Id </th>
                                            <th> Enrollment No </th>
                                            <th> Name </th>
                                            <th> Email </th>
                                            <th data-hide="all"> DOB </th>
                                            <th data-hide="all"> Status </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php 
                                            if($import_list && is_array($import_list)) {
                                                foreach ($import_list as $key => $i_value) {
                                        ?>
                                            <tr class="list-import deactive" data-baseid="<?php echo $key; ?>">
                                                <td><?php echo $i_value[0]; ?></td>
                                                <td><?php echo $i_value[2]; ?></td>
                                                <td><?php echo $i_value[3]; ?></td>
                                                <td><?php echo $i_value[7]; ?></td>
                                                <td>22 Jun 1972</td>
                                                <td><span class="badge label-table badge-success">Active</span></td>
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