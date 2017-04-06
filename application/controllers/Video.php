<?php

class Video extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('Artist_model');
        $this->load->model('UserType_model');
        $this->load->model('Home_model');
        $this->load->model('Comment_model');
        $this->load->model('User_model');
        $this->load->model('Songs_model');
        header("Access-Control-Allow-Origin: *");

        header("Access-Control-Allow-Methods: GET,POST,OPTIONS");
    }

    function index() {
        $session_data = $this->session->userdata('user_data');
        $user_id = $session_data['UID'];

        $song_id = $this->uri->segment(3);
        $song_data = $this->Home_model->getVideoBySongId($song_id);
//        $comments = $this->Comment_model->get_data(array('parent_id' => 0, 'UserType' => 4, 'iml_comment_song.Song_id' => $song_id));
        $comments = $this->Comment_model->get_song_comment($song_id);

        if (is_array($comments) && !empty($comments)) {
            foreach ($comments as $key => $value) {
                $comments[$key]['attachment'] = $this->Comment_model->getAttachment(array('comment_id' => $value['COM_ID']));
                $comments[$key]['subComments'] = $this->Comment_model->get_comment_byparent($value['COM_ID']);
            }
        }

        $allVideos = $this->Home_model->get_video();
        $artistAllVideo = $this->Home_model->get_artist_video($song_data[0]['UID'], $song_data[0]['ID']);
        $data['songs_data'] = $song_data;
        $data['comments'] = $comments;
        $data['allVideos'] = $allVideos;
        $data['artistAllVideo'] = $artistAllVideo;
        $data['page_title'] = "Video";
        if ($user_id) {
            $data['user_data'] = $this->User_model->get_single($user_id);
        } else {
            $data['user_data'] = $session_data;
        }
        $data['page'] = "video";
        $this->load->view('front/page', $data);
    }
    

    function post_hit_count() {
        try {
            $data = $_POST;
            $session_data = $this->session->userdata('user_data');
            if (!$session_data['UID'])
                throw new Exception("Session Expired Please Login");
            $song_data = array(
                'HITS' => $data['new_view']
            );
            $this->Songs_model->update_song($data['song_id'], $song_data);
        } catch (Exception $exc) {
            $response['success'] = FALSE;
            $response['msg'] = $exc->getMessage();
        }
        echo json_encode($response);
        exit();
    }

}
