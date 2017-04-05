
<?php
$imageUploadPath = UPLOADS . '/images';
$videoUploadPath = UPLOADS . '/videos';
$song_id = $songs_data[0]['ID'];
?>
<style>
    .clickable{pointer-events: none;}
</style>
<section>
    <div class="layout-row layout-xs-column layout-align-space-between">
        <div class="flex-70 flex-xs-100 layout-column youtube-section">
            <video height="320" controls autoplay>
                <source src="<?php echo base_url() . '/uploads/videos/' . $songs_data[0]['Song_File_Name'] ?>" type="video/mp4">
            </video>
            <div class="layout-column">
                <div class="layout-row layout-xs-column youtube-user-detail">
                    <div class="flex-100 flex-xs-100 layout-column layout-align-start-start">
                        <h4><?php echo $songs_data[0]['Song_Title'] ?></h4>
                    </div>

                    <div class="flex-50 flex-xs-100 layout-align-end-end layout-row">
                        <h4 id="views"><?php echo ($songs_data[0]['HITS']) ? $songs_data[0]['HITS'] . ' Views' : '0' . ' View'; ?></h4>
                    </div>
                </div>
                <div class="layout-row">
                    <div class="topic-detail layout-column">
                        <span>Published on <?php echo date('M d, Y', strtotime($songs_data[0]['created_On'])) ?></span>
                        <span><?php echo isset($song_data[0]['synopsis']) && $song_data[0]['synopsis'] != '' ? $song_data[0]['synopsis'] : '' ?></span>
                        <!--<button>Show more</button>-->
                    </div>
                </div>
                <div class="layout-row  share-it">
                    <span class="layout-row flex-20 layout-align-start-center">
                        <!--<i class="fa fa-plus"></i>Add to-->
                    </span>
                    <span class="layout-row flex-30 layout-align-start-center">
                        <!--<i class="fa fa-share"></i> share-->
                    </span>
                    <span class="layout-row flex-20 layout-align-start-center">
                        <!--<i class="fa fa-ellipsis-h"></i>More-->
                    </span>
                    <span class="layout-row flex-50 layout-align-end-center">
                        <span><i class="fa fa-hand-o-up"></i>888</span> &nbsp;&nbsp;   
                        <span><i class="fa fa-hand-o-down"></i>6</span>   
                    </span>
                </div>
            </div>
            <div class="layout-column user-comment-area">
                <?php
                $userImage = isset($user_data) && $user_data['Photo'] != '' ? base_url('uploads/images') . '/' . $user_data['Photo'] : base_url('front') . '/img/user-image.png';
                ?>
                <div class="layout-row user-comments-youtube input-section">
                    <img src="<?php echo $userImage ?>" alt="user-image"/>
                    <div class="input-area" data-userId = <?php echo isset($user_data) && $user_data[0]['UID'] ? $user_data[0]['UID'] : '' ?>>
                        <textarea name="comment_field" class="comment_field" placeholder="Write a Comments" style="width: 100%" rows="3"></textarea>
                        <a href="javascript:void(0)" class="post_comment"><i class="fa fa-check-circle fa-3x" style="    color: #105704;"></i></a>
                    </div>
                </div>
                <div id="comment_section">
                    <?php
                    if (isset($comments) && !empty($comments)) {
                        foreach ($comments as $comment) {
                            $userImageComment = isset($comment) && $comment['Photo'] != '' ? base_url('uploads/images') . '/' . $user_data['Photo'] : base_url('front') . '/img/user-image.png';
                            ?>
                            <div class="layout-row user-comments-youtube">
                                <img src="<?php echo $userImageComment ?>" alt="user-image"/>
                                <div class="layout-column user-detail flex-90" id="main_comment">
                                    <div class="layout-row">
                                        <div class="layout-column flex-90">
                                            <div class="layout-row">
                                                <span class="user-name"><?php echo $comment['FirstName'] . ' ' . $comment['LastName'] ?></span>
                                                <!--<span>3 min agao</span>-->
                                            </div>
                                            <div><?php echo $comment['COMMENTS'] ?></div>
                                            <div class="layout-row">
                                                <span class="user-name"><a href="javascript:void(0)" onclick="replyOnComment(this)" >Reply</a> &nbsp; &nbsp;<a href="javascript:void(0)" onclick="likeComment(this)" ><i class="fa fa-thumbs-up"></a></i>&nbsp;  &nbsp; <a href="javascript:void(0)" onclick="dislikeComment(this)" ><i class="fa fa-thumbs-down"></i></a></span>
                                            </div>
                                        </div>
                                        <div class="float-right flex-10 layout-row layout-align-end-start"><i class="fa fa-ellipsis-v"></i></div> 
                                    </div>
                                    <?php
                                    if (isset($comment['subComments']) && !empty($comment['subComments'])) {
                                        foreach ($comment['subComments'] as $subComment) {
                                            $userImagesubComment = isset($subComment) && $subComment['Photo'] != '' ? base_url('uploads/images') . '/' . $user_data['Photo'] : base_url('front') . '/img/user-image.png';
                                            ?>
                                            <div class="layout-row sub-comment">
                                                <img src="<?php echo $userImagesubComment ?>" alt="user-image"/>
                                                <div class="layout-column sub-comment flex-85">
                                                    <div class="layout-row">
                                                        <span class="user-name"><?php echo $subComment['FirstName'] . ' ' . $subComment['LastName'] ?></span>
                                                        <!--<span>3 min agao</span>-->
                                                    </div>
                                                    <div><?php echo $subComment['COMMENTS'] ?></div>
                                                    <div class="layout-row">
                                                        <span class="user-name"> &nbsp; &nbsp;<a href="javascript:void(0)" onclick="likeComment(this)" ><i class="fa fa-thumbs-up"></i></a>&nbsp;  &nbsp; <a href="javascript:void(0)" onclick="dislikeComment(this)" ><i class="fa fa-thumbs-down"></i></a></span>
                                                    </div>
                                                </div>
                                                <div class="float-right flex-10 layout-row layout-align-end-start"><i class="fa fa-ellipsis-v"></i></div>
                                            </div>
                                            <?php
                                        }
                                    }
                                    ?>
                                </div>
                            </div>
                            <?php
                        }
                    }
                    ?>
                </div>
            </div>
        </div>
        <div class="layout-column flex-30 flex-xs-100 more-video-secton ">
            <div class="layout-column youtube-more-section">
                <p>Some More Songs of Same Artist</p>
                <div class="flex-25 flex-xs-100 layout-column video-section" style="overflow: hidden;">
                    <div style="height: 100%;width: 100%;overflow-y: auto;" class="video-section1">
                        <?php foreach ($artistAllVideo as $artist_video) { ?>
                            <div class="layout-row">
                                <a href="<?php echo site_url('Video/index/') . $artist_video['ID'] ?>">
                                    <img src="<?php echo base_url('uploads/images') . '/' . $artist_video['Image'] ?>" width="166">
                                </a>
                            </div>
                            <div class="layout-column user-detail">
                                <span class="user-name"><?php echo $artist_video['Song_Title'] ?></span>
                            </div>
                            <?php
                        }
                        ?>
                        <p>Songs from other Artists</p>
                        <?php foreach ($allVideos as $song) { ?>
                            <div class="layout-row">
                                <a href="<?php echo site_url('Video/index/') . $song['ID'] ?>">
                                    <img src="<?php echo base_url('uploads/images') . '/' . $song['Image'] ?>" width="166">
                                </a>
                            </div>
                            <div class="layout-column user-detail">
                                <span class="user-name"><?php echo $song['Song_Title'] ?></span>
                            </div>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    var base_url = '<?php echo base_url() ?>';
    var site_url = '<?php echo site_url() ?>';
    var views = $('#views').html();
    var new_view = views.match(/\d+/)[0];
    new_view++;
    var song_id = '<?php echo $songs_data[0]['ID']; ?>';

    $(document).ready(function () {
        $('.video-section1').height($(window).height() - $('header').height());
        post_hit_count({'new_view': new_view, 'song_id': song_id});
    })

    function post_hit_count(data) {
        $.ajax({
            'url': '<?php echo site_url('Video/post_hit_count') ?>',
            'data': data,
            'type': 'post',
            success: function (result) {
                console.log(result);
            }
        });
    }

    $('.post_comment').click(function (e) {
//        console.log(e);
//        e.stopPropagation();
        var user_id = $(this).parent().attr('data-userId');
        if (user_id) {
            var comment = $(this).parent().find('textarea').val();
            post_comment(comment, user_id, '<?php echo $song_id; ?>');
        } else {
            login_popup();
        }
    });

    function post_comment(comment, user_id, song_id) {
        if (comment != '' && user_id && song_id) {
            var data = {'COMMENTS': comment, 'user_id': user_id, 'Song_id': song_id};
            $.ajax({
                url: site_url + '/index/post_comment',
                data: data,
                type: 'post',
                success: function (result) {
                    var obj = $.parseJSON(result);
                    console.log(obj);
                    var html = '';
                    if (obj.success) {
                        $.each(obj.comment, function (index, comments) {
                            var user_image = base_url + 'uploads/images/user.png';
                            if (comments.Photo != '') {
                                user_image = base_url + 'uploads/images/' + comments.Photo;
                            }
                            html += '<div class="layout-row user-comments-youtube">';
                            html += '<img src="' + user_image + '" alt="user-image"/>';
                            html += '<div class="layout-column user-detail flex-90" id="main_comment">';
                            html += '<div class="layout-row">';
                            html += '<div class="layout-column flex-90">';
                            html += '<div class="layout-row">';
                            html += '<span class="user-name">' + comments.FirstName + ' ' + comments.LastName + '</span>';
                            html += '</div>';
                            html += '<div>' + comments.COMMENTS + '</div>';
                            html += '<div class="layout-row">';
                            html += '<span class="user-name"><span>Reply</span> &nbsp; &nbsp;<i class="fa fa-thumbs-up"></i>&nbsp;  &nbsp; <i class="fa fa-thumbs-down"></i></span>';
                            html += '</div>';
                            html += '</div>';
                            html += '<div class="float-right flex-10 layout-row layout-align-end-start"><i class="fa fa-ellipsis-v"></i></div> ';
                            html += '</div>';
                            html += '</div>';
                            html += '</div>';
                        });
                        console.log(html);
                        $('#comment_section').prepend(html);
                    }
                }
            });
        }
    }
</script>

