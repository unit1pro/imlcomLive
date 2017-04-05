<?php
// print "<pre>";
//print_r($user_data);
//exit;
?>
<h1 class="page-header">Edit Profile</h1>
<div class="row">
    <!-- left column -->
    <form action="<?php echo site_url('User/update_profile'); ?>" method="post" class="form-horizontal" enctype="multipart/form-data" role="form">
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="text-center">
                <?php $userImageHeader = isset($user_data[0]) && $user_data[0]['Photo'] != '' ? base_url('uploads/images') . '/' . $user_data[0]['Photo'] : base_url('front') . '/img/user-image.png'; ?>
                <img id="profile_pic" src="<?php echo $userImageHeader; ?>" name="photo" class="avatar img-circle img-thumbnail" alt="avatar">
                <h6>Upload a different photo...</h6>
                <input type="file" id="upload" name="upload" class="text-center center-block well well-sm">
            </div>
        </div>
        <!-- edit form column -->
        <div class="col-md-8 col-sm-6 col-xs-12 personal-info">
            <?php if ($error_msg) { ?>
                <div class="alert alert-info alert-dismissable">
                    <a class="panel-close close" data-dismiss="alert">×</a> 
                    <i class="fa fa-coffee"></i>
                    <?php echo $error_msg; ?>
                </div>
            <?php } ?>
            <?php if ($msg) { ?>
                <div class="alert alert-success alert-dismissable">
                    <a class="panel-close close" data-dismiss="alert">×</a> 
                    <i class="fa fa-coffee"></i>
                    <?php echo $msg; ?>
                </div>
            <?php } ?>


            <input type="hidden" name="photo_name" id="photo_name" value="<?php echo $user_data[0]['Photo']; ?>">
            <div class="form-group">
                <label class="col-lg-3 control-label">First name:</label>
                <div class="col-lg-8">
                    <input class="form-control" name="FirstName" value="<?php echo $user_data[0]['FirstName']; ?>" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 control-label">Last name:</label>
                <div class="col-lg-8">
                    <input class="form-control" name="LastName" value="<?php echo $user_data[0]['LastName']; ?>" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 control-label">Email:</label>
                <div class="col-lg-8">
                    <input class="form-control" name="Email" value="<?php echo $user_data[0]['Email']; ?>" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Website:</label>
                <div class="col-md-8">
                    <input class="form-control" name="Website" value="<?php echo $user_data[0]['Website']; ?>" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Contact Me:</label>
                <div class="col-md-8">
                    <input class="form-control" name="ContactMe" value="<?php echo $user_data[0]['ContactMe']; ?>" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Date of Birth</label>
                <div class="col-md-8">
                    <input class="form-control" name="DOB" value="<?php echo $user_data[0]['DOB']; ?>" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">City</label>
                <div class="col-md-8">
                    <input class="form-control" name="City" value="<?php echo $user_data[0]['City']; ?>" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">State</label>
                <div class="col-md-8">
                    <input class="form-control" name="State" value="<?php echo $user_data[0]['State']; ?>" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Country</label>
                <div class="col-md-8">
                    <input class="form-control" name="Country" value="<?php echo $user_data[0]['Country']; ?>" type="text">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 control-label">About Me:</label>
                <div class="col-lg-8">
                    <input class="form-control" name="AboutMe" value="<?php echo $user_data[0]['AboutMe']; ?>" type="textarea">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label"></label>
                <div class="col-md-8">
                    <input id="profile_submit" name="update" class="btn btn-primary" value="Save Changes" type="submit">
                    <span></span>
                    <input class="btn btn-default" value="Cancel" type="reset">
                </div>
            </div>
        </div>
    </form>
</div>

<script>
    $("#upload").change(function () {
        var photo = $(this).val();
        photo = photo.replace(/^.*[\\\/]/, '');
        $('input#photo_name').val(photo);
    });
</script>