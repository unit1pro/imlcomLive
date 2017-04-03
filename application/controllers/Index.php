<?php

class Index extends CI_Controller {

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

        $data['songs_data'] = $this->Home_model->get_video();
        $data['login_msg'] = $this->session->userdata('login_msg');
        $data['page_title'] = "Home";
        $data['user_data'] = $session_data;
        $data['page'] = "home";
        $this->load->view('front/page', $data);
    }

    function uploadFiles() {
//        exit('hello');
        $imageUploadPath = UPLOADS . '/images';
        $videoUploadPath = UPLOADS . '/videos';
        $audioUploadPath = UPLOADS . '/audios';
        $session_data = $this->session->userdata('user_data');
//        if ($session_data['UID']) {
        $response = array();
        $date = date('YmdHisu');
        $input = $_FILES["file"]["tmp_name"];
        $name = str_replace(' ', '', basename($_FILES['file']['name']));
        $filename = explode('.', $name);
//        print_r($filename);exit;
//            $uploaddir = ROOT_DIR . 'community/uploads/';
        if ($_FILES['file']['type'] == 'image/jpeg' || $_FILES['file']['type'] == 'image/png' || $_FILES['file']['type'] == 'image/gif') {
            $type = 'images';
            $uploadfile = $imageUploadPath . '/' . $date . $name;

            if (move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile)) {
                $response['success'] = TRUE;
                $response['type'] = $type;
                $response['filename'] = $date . $name;
            } else {
                $response['success'] = FALSE;
            }
        } else if ($_FILES['file']['type'] == 'video/x-msvideo' || $_FILES['file']['type'] == 'video/x-flv' || $_FILES['file']['type'] == 'video/x-matroska' || $_FILES['file']['type'] == 'video/x-mpeg' || $_FILES['file']['type'] == 'video/ogg' || $_FILES['file']['type'] == 'video/x-ms-wmv' || $_FILES['file']['type'] == 'video/mp4') {
            $type = 'videos';

            $uploadfile = $videoUploadPath . '/' . $date . $name;
            if (move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile)) {
                $response['success'] = TRUE;
                $response['type'] = $type;
                $response['filename'] = $date . $name;
            } else {
                $response['success'] = FALSE;
            }
//                $uploadfile = $videoUploadPath . '/' . $date . $filename[0] . '.mp4';
//                $command = "ffmpeg -i $input -vcodec h264 -acodec aac -strict -2 $uploadfile";
//
//                @exec($command, $ret);
//                $response['success'] = TRUE;
//                $response['type'] = $type;
//                $response['filename'] = WWWROOT . 'live/community/uploads/' . $type . '/' . $date . $filename[0] . '.mp4';
//            var_dump($command);
//            exit;
        } else if ($_FILES['file']['type'] == 'audio/aac' || $_FILES['file']['type'] == 'audio/mp3' || $_FILES['file']['type'] == 'audio/wav' || $_FILES['file']['type'] == 'audio/x-ms-wma' || $_FILES['file']['type'] == 'audio/ogg') {
            $type = 'audios';
//                $uploadfile = $uploaddir . '/' . $type . '/' . $date . $filename[0] . '.mp3';
//                $command = "ffmpeg -i $input -acodec libmp3lame $uploadfile";
//                @exec($command, $ret);
//                $response['success'] = TRUE;
//                $response['type'] = $type;
//                $response['filename'] = WWWROOT . 'live/community/uploads/' . $type . '/' . $date . $filename[0] . '.mp3';

            $uploadfile = $audioUploadPath . '/' . $date . $name;
            if (move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile)) {
                $response['success'] = TRUE;
                $response['type'] = $type;
                $response['filename'] = $date . $name;
            } else {
                $response['success'] = FALSE;
            }
        }
//        }else{
//            $response['success'] = FALSE;
//            $response['msg'] = "Session Expired Please Login";
//        }
        echo json_encode($response);
        exit;
    }

    Public function post_comment() {
        $session_data = $this->session->userdata('user_data');
        $response = array();
        try {
            $formData = $_POST;
            if (!$session_data['UID'])
                throw new Exception("Session Expired Please Login");
            if ($formData['COMMENTS'] == '' && (!isset($formData['attchment_path'])))
                throw new Exception("Please write some comment or add a file to submit");
            $insertData = array(
                'ID' => $session_data['UID'],
                'parent_id' => isset($formData['parent_id']) && $formData['parent_id'] ? $formData['parent_id'] : 0,
                'Song_id' => isset($formData['Song_id']) && $formData['Song_id'] ? $formData['Song_id'] : 0,
                'COMMENTS' => isset($formData['COMMENTS']) && $formData['COMMENTS'] ? $formData['COMMENTS'] : '',
                'isActive' => 1,
                'created_by' => $session_data['UID'],
                'updated_by' => $session_data['UID'],
            );

            $comment_id = $this->Comment_model->insert_data($insertData);
            if (!$comment_id)
                throw new Exception("Comment not saved Please check your network and try again");
            if ($comment_id && isset($formData['attchment_path']) && !empty($formData['attchment_path'])) {
                $attachmentId = array();
                foreach ($formData['attchment_path'] as $key => $attachment_path) {
                    $attachmentData = array(
                        'comment_id' => $comment_id,
                        'attachment_type' => $formData['attchment_type'][$key],
                        'attachment_path' => $attachment_path,
                        'isActive' => 1,
                        'created_by' => $session_data['UID'],
                        'updated_by' => $session_data['UID'],
                    );
                    $attachmentId[] = $this->Comment_model->insert_comment_attachment($attachmentData);
                }
            }
            $comment = $this->Comment_model->get_data(array('COM_ID' => $comment_id));
            $comment[0]['attachment'] = $this->Comment_model->getAttachment(array('comment_id' => $comment_id));
            $response['success'] = TRUE;
            $response['msg'] = "Post Saved";
            $response['comment'] = $comment;
        } catch (Exception $exc) {
            $response['success'] = FALSE;
            $response['msg'] = $exc->getMessage();
        }

        echo json_encode($response);
        exit();
    }

    public function get_posts() {
        $response = array();
        $comments = array();
        try {
            $formdata = $_POST;
            $limit = isset($formdata['limit']) && $formdata['limit'] ? $formdata['limit'] : NULL;
            $offset = isset($formdata['offset']) && $formdata['offset'] ? $formdata['offset'] : NULL;
            $offset_song = isset($formdata['offset_song']) && $formdata['offset_song'] ? $formdata['offset_song'] : NULL;
            $conditions_song = array('songs.isActive'=>1);
            $conditions = array(
                'parent_id' => 0,
                'UserType' => 4,
            );
            $comments = $this->Comment_model->get_data($conditions, $limit, $offset);
            $song_limit = 5-count($comments);
            $songs = $this->Songs_model->get($conditions_song, $song_limit, $offset_song);
//            print_r($songs);exit;
            $i=0;
            if (is_array($comments) && !empty($comments)) {
                foreach ($comments as $key => $value) {
//                    print_r($value['COM_ID']);
//                    print_r($key);
                    $i++;
                    $comments[$key]['song'] = FALSE;
                    $comments[$key]['attachment'] = $this->Comment_model->getAttachment(array('comment_id' => $value['COM_ID']));
                    $comments[$key]['subComments'] = $this->Comment_model->get_data(array('parent_id' => $value['COM_ID']), 2, 0, 'DESC');
                }
//                exit;
            } 
//            echo $i;
            if(is_array($songs) && !empty($songs)){
                foreach ($songs as $key1 => $value1) {
                    $comments[$i]=$value1;
                    $comments[$i]['song']=true;
                    $comments[$i++]['subComments']=$this->Comment_model->get_data(array('Song_id' => $value1['ID']), 2, 0, 'DESC');
                    
                    
                }
            }
//            print_r($comments);exit;
            $response['success'] = TRUE;
            $response['song_offset'] = $offset_song+$song_limit;
            $response['comment'] = $comments;
        } catch (Exception $exc) {
            $response['success'] = FALSE;
            $response['msg'] = $exc->getMessage();
        }
        echo json_encode($response);
        exit();
    }

    public function get_posts_industry() {
        $response = array();
        $comments = array();
        $session_data = $this->session->userdata('user_data');
        try {
            $formdata = $_POST;
            if ($session_data['UserType'] == 5) {

                $limit = isset($formdata['limit']) && $formdata['limit'] ? $formdata['limit'] : NULL;
                $offset = isset($formdata['offset']) && $formdata['offset'] ? $formdata['offset'] : NULL;
                $conditions = array(
                    'parent_id' => 0,
                    'UserType' => 5,
                );
                $comments = $this->Comment_model->get_data($conditions, $limit, $offset);
                if (is_array($comments) && !empty($comments)) {
                    foreach ($comments as $key => $value) {
//                    print_r($value['COM_ID']);
//                    print_r($key);
                        $comments[$key]['attachment'] = $this->Comment_model->getAttachment(array('comment_id' => $value['COM_ID']));
                        $comments[$key]['subComments'] = $this->Comment_model->get_data(array('parent_id' => $value['COM_ID']), 2, 0, 'DESC');
                    }
//                exit;
                } else {
                    throw new Exception("No data fetched");
                }

                $response['success'] = TRUE;
                $response['comment'] = $comments;
            } else {
                if ($formdata['offset'] == 0) {
                    $conditions = array(
                        'UserType' => 5,
                    );
                    $comments = $this->User_model->get_data($conditions);
                    if (!is_array($comments) || empty($comments))
                        throw new Exception("No data fetched");
                    $response['success'] = TRUE;
                    $response['comment'] = $comments;
                }
            }
        } catch (Exception $exc) {
            $response['success'] = FALSE;
            $response['msg'] = $exc->getMessage();
        }
        echo json_encode($response);
        exit();
    }

}
