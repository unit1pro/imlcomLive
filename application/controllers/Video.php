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
//        $this->load->library('session');
    }

    function index() {
        $session_data = $this->session->userdata('user_data');
        $song_id = $this->uri->segment(3);
        $song_data = $this->Home_model->getVideoBySongId($song_id);
        $comments = $this->Comment_model->get_data(array('parent_id' => 0,'UserType' => 4, 'iml_comment_song.Song_id' => $song_id));
        if (is_array($comments) && !empty($comments)) {
            foreach ($comments as $key => $value) {
//                    print_r($value['COM_ID']);
//                    print_r($key);
                $comments[$key]['attachment'] = $this->Comment_model->getAttachment(array('comment_id' => $value['COM_ID']));
                $comments[$key]['subComments'] = $this->Comment_model->get_data(array('parent_id' => $value['COM_ID']), 2, 0, 'DESC');
            }
//                exit;
        }
       
        $allVideos = $this->Home_model->get_video();
        $artistAllVideo = $this->Home_model->get_artist_video($song_data[0]['UID'],$song_data[0]['ID']);
//         echo '<pre>';
//        print_r($comments);
//        exit;
        $data['songs_data'] = $song_data;
        $data['comments'] = $comments;
        $data['allVideos'] = $allVideos;
        $data['artistAllVideo'] = $artistAllVideo;
//        $data['login_msg'] = $this->session->userdata('login_msg');
        $data['page_title'] = "Video";
        $data['user_data'] = $session_data;
        $data['page'] = "video";
        $this->load->view('front/page', $data);
    }

}
