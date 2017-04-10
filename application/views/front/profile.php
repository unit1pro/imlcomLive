<h1 class="page-header">Edit Profile</h1>
<div class="row">
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
                    <input id="profile_submit" name="update" class="btn btn-primary" value="Save Changes" type="submit">
                    <span></span>
                    <input class="btn btn-default" value="Cancel" type="reset">
                </div>
            </div>
        </div>
    </form>
</div>

<script>
    var session_user = '<?php echo $_SESSION['user_data']['UID'];?>';
    var profile_user = '<?php echo $this->uri->segment(3);?>';
    
    if(session_user !== profile_user){
        $("#formdata input").prop("disabled", true);
    }
    
    $("#upload").change(function () {
        var photo = $(this).val();
        photo = photo.replace(/^.*[\\\/]/, '');
        $('input#photo_name').val(photo);
    });
    
    
</script>