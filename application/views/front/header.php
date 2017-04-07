<!DOCTYPE html>
<html>
    <head>
        <title>Indian Music Lab</title>
        <link rel="icon" type="image/png" href="<?php echo base_url() . "front/img/logo-red.png"; ?>" />
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="<?php echo base_url() ?>front/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="<?php echo base_url() ?>front/font-awesome/css/font-awesome.css">
        <link rel="stylesheet" href="<?php echo base_url() ?>front/css/style.css" type="text/css">
        <link rel="stylesheet" href="<?php echo base_url() ?>front/css/flex.css" type="text/css">
        <!--<link rel="stylesheet" href="<?php echo base_url(); ?>/vendors/dropzone/dropzone.css" type="text/css">-->
        <script src="<?php echo base_url() ?>front/js/jquery.js" type="text/javascript"></script>
        <script src="<?php echo base_url() ?>front/js/bootstrap.min.js" type="text/javascript"></script>
<!--        <script src="<?php echo base_url(); ?>/vendors/dropzone/dropzone.js" type="text/javascript"></script>
        <script src="<?php echo base_url(); ?>/vendors/dropzone/dropzone-amd-module.js" type="text/javascript"></script>-->
    </head>
    <body id="page-top" class="index">

        <div class="bg-image">
            <div class="container">
                <!-- Header -->
                <header>

                    <div class="layout-row header-wrapper">
                        <div class="flex-15 flex-xs-10">
                            <a href="<?php echo site_url() ?>"><img src="<?php echo base_url() ?>front/img/logo-white.png" alt="logo" height="76"/></a>
                        </div>
                        <div class="flex-70 flex-xs-60 layout-align-center-end layout-row">
                            <a href="<?php echo site_url() ?>"><img src="<?php echo base_url() ?>front/img/title.png" alt="tile"/></a>
                        </div>
                        <div class=" flex-15 flex-xs-30 layout-align-end-start link-wrapper">
                            <div class="layout-row">
                                <a href="#"><img src="<?php echo base_url() ?>front/img/facebook.png" alt="facebook"/></a>
                                <a href="#"><img src="<?php echo base_url() ?>front/img/twitter.png" alt="twitter"/></a>
                                <a href="#"><img src="<?php echo base_url() ?>front/img/picasa.png" alt="picasa"/></a>
                                <a href="#"><img src="<?php echo base_url() ?>front/img/youtube.png" alt="youtube"/></a>
                            </div>
                            <?php
                            if (isset($profile_data[0]['UID'])) {
                                $userImageHeader = isset($profile_data) && $profile_data[0]['Photo'] != '' ? base_url('uploads/images') . '/' . $profile_data[0]['Photo'] : base_url('front') . '/img/user-image.png';
                                ?>
                                <div class="layout-row">
                                    <a href="<?php echo site_url('User/profile/'.$profile_data[0]['UID']) ?>">
                                        <img src="<?php echo $userImageHeader; ?>" height="20"/>
                                        <span style="color: #ff0000"><?php echo $profile_data[0]['FirstName'] . ' ' . $profile_data[0]['LastName'] ?></span>
                                    </a>
                                </div>
                                <div class="layout-row">
                                    <a href="<?php echo site_url('User/logoutFront') ?>" style="color: #ff0000;padding-left: 10px;"><i class="fa fa-ban"></i> <span style="padding-left: 10px;">Logout</span></a>
                                </div>
                            <?php } ?>
                        </div>

                    </div> 

                </header>