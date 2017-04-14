<?php
//echo $_SESSION['user_data']['UID'];
//echo $profile_data[0]['UID'];
//exit;
?>
<div class="row">
    <!-- right column -->
    <div id="profile_info" class="container target">
        <div class="row">
            <div class="col-sm-10">
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-sm-3">
                <!--left col-->
                <div class="panel panel-default">
                    <ul class="list-group">
                        <li class="list-group-item text-muted" contenteditable="false">Profile 
                        <?php if ($_SESSION['user_data']['UID'] == $profile_data[0]['UID']) { ?>
                                <span id="profile_update_button" class="pull-right fa fa-pencil-square-o"> Update</span></li>                            
                        <?php } ?>
                        <li class="list-group-item text-right"><span class="pull-left"><strong class="">Real name</strong></span><?php echo $profile_data[0]['FirstName'] . ' ' . $profile_data[0]['LastName']; ?></li>
                        <li class="list-group-item text-right"><span class="pull-left"><strong class="">Role </strong></span><?php echo $profile_data[0]['UserType']; ?></li>
                        <li class="list-group-item text-right"><span class="pull-left"><strong class="">Joined</strong></span><?php echo $profile_data[0]['DateJoined']; ?></li>
                    </ul>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">Website <i class="fa fa-link fa-1x"></i></div>
                    <div class="panel-body"><a href="<?php echo $profile_data[0]['Website']; ?>" target="_blank" class=""><?php echo $profile_data[0]['Website']; ?></a></div>
                </div>

                <div class="panel panel-default">
                    <ul class="list-group">
                        <li class="list-group-item text-muted">Contact <i class="fa fa-dashboard fa-1x"></i></li>
                        <li class="list-group-item text-right"><span class="pull-left"><strong class="">Mobile</strong></span><?php echo $profile_data[0]['ContactMe']; ?></li>
                        <li class="list-group-item text-right"><span class="pull-left"><strong class="">Email</strong></span><?php echo $profile_data[0]['Email']; ?></li>
                        <li class="list-group-item text-right"><span class="pull-left"><strong class="">Address</strong></span><?php echo $profile_data[0]['City'] . ' ' . $profile_data[0]['State'] . ' ' . $profile_data[0]['Country']; ?></li>
                    </ul>
                </div>
            </div>
            <!--/col-3-->
            <div class="col-sm-9" style="" contenteditable="false" >
                <div class="panel panel-default">
                    <div class="panel-heading"><?php echo $profile_data[0]['UserName']; ?>'s Bio</div>
                    <div class="panel-body"><?php echo $profile_data[0]['AboutMe']; ?>

                        <?php $userImageHeader = isset($profile_data[0]) && $profile_data[0]['Photo'] != '' ? base_url('uploads/images') . '/' . $profile_data[0]['Photo'] : base_url('front') . '/img/user-image.png'; ?>
                        <img id="profile_pic" src="<?php echo $userImageHeader; ?>" name="photo" class="img-rounded img-responsive pull-right" width="100" height="100" alt="avatar">
                    </div>
                </div>
                <div class="panel panel-default target">
                    <div class="panel-heading" contenteditable="false">Recent Posts</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="thumbnail">
                                    <img alt="300x200" src="http://lorempixel.com/600/200/people">
                                    <div class="caption">
                                        <h3>Rover</h3>
                                        <p>Cocker Spaniel who loves treats.</p>
                                        <p></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="thumbnail">
                                    <img alt="300x200" src="http://lorempixel.com/600/200/city">
                                    <div class="caption">
                                        <h3>Marmaduke</h3>
                                        <p>Is just another friendly dog.</p>
                                        <p></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="thumbnail">
                                    <img alt="300x200" src="http://lorempixel.com/600/200/sports">
                                    <div class="caption">
                                        <h3>Rocky</h3>
                                        <p>Loves catnip and naps. Not fond of children.</p>
                                        <p></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




    <!-- left column -->
    <form id="formdata" action="<?php echo site_url('User/update_profile'); ?>" method="post" class="form-horizontal" enctype="multipart/form-data" role="form">
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="text-center">
                <?php $userImageHeader = isset($profile_data[0]) && $profile_data[0]['Photo'] != '' ? base_url('uploads/images') . '/' . $profile_data[0]['Photo'] : base_url('front') . '/img/user-image.png'; ?>
                <img id="profile_pic" src="<?php echo $userImageHeader; ?>" name="photo" class="avatar img-circle img-thumbnail" alt="avatar">
                <h6>Upload a different photo...</h6>
                <input type="file" id="upload" name="upload" class="text-center center-block well well-sm">
            </div>
        </div>
        <!-- edit form column -->
        <div class="col-md-8 col-sm-6 col-xs-12 personal-info">

            <input type="hidden" name="photo_name" id="photo_name" value="<?php echo $profile_data[0]['Photo']; ?>">
            <div class="form-group">
                <label class="col-md-3 control-label">First name:</label>
                <div class="col-md-8">
                    <input class="form-control" name="FirstName" value="<?php echo $profile_data[0]['FirstName']; ?>" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Last name:</label>
                <div class="col-md-8">
                    <input class="form-control" name="LastName" value="<?php echo $profile_data[0]['LastName']; ?>" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Email:</label>
                <div class="col-md-8">
                    <input class="form-control" name="Email" value="<?php echo $profile_data[0]['Email']; ?>" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Website:</label>
                <div class="col-md-8">
                    <input class="form-control" name="Website" value="<?php echo $profile_data[0]['Website']; ?>" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Contact Me:</label>
                <div class="col-md-8">
                    <input class="form-control" name="ContactMe" value="<?php echo $profile_data[0]['ContactMe']; ?>" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Date of Birth</label>
                <div class="col-md-8">
                    <input class="form-control" name="DOB" value="<?php echo $profile_data[0]['DOB']; ?>" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">City</label>
                <div class="col-md-8">
                    <input class="form-control" name="City" value="<?php echo $profile_data[0]['City']; ?>" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">State</label>
                <div class="col-md-8">
                    <input class="form-control" name="State" value="<?php echo $profile_data[0]['State']; ?>" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Country</label>
                <div class="col-md-8">
                    <input class="form-control" name="Country" value="<?php echo $profile_data[0]['Country']; ?>" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">About Me:</label>
                <div class="col-md-8">
                    <input class="form-control" name="AboutMe" value="<?php echo $profile_data[0]['AboutMe']; ?>" type="textarea">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label"></label>
                <div class="col-md-8">
                    <input id="profile_submit" name="update" class="btn btn-primary" value="Save Changes" type="submit"><br>
                    <input class="btn btn-default" value="Reset" type="reset"><br>
                    <input id="back_profile" class="btn btn-default" value="Back" type="button">
                </div>
            </div>
        </div>
    </form>
</div>

<script>
    var session_user = '<?php echo $_SESSION['user_data']['UID']; ?>';
    var profile_user = '<?php echo $this->uri->segment(3); ?>';

    $(document).ready(function () {
        $('#formdata').hide();
    });
    $('#profile_update_button').on('click', function () {
        $('#profile_info').hide();
        $('#formdata').show();
    })
    $('#back_profile').on('click', function () {
        $('#formdata').hide();
        $('#profile_info').show();
    })

    if (session_user !== profile_user) {
        $("#formdata input").prop("disabled", true);
    }

    $("#upload").change(function () {
        var photo = $(this).val();
        photo = photo.replace(/^.*[\\\/]/, '');
        $('input#photo_name').val(photo);
    });


</script>