<?php

class Api extends CI_Controller {

    function Api() {
        parent::__construct();
        $this->load->model('User_model');
        $this->load->model('UserType_model');
        $this->load->model('Artist_model');
//        $this->load->model('UserType_model');
        $this->load->model('Home_model');
        $this->load->model('Comment_model');
//        $this->load->model('User_model');
        $this->load->model('Songs_model');
        header("Access-Control-Allow-Origin: *");

        header("Access-Control-Allow-Methods: GET,POST,OPTIONS");
//        $this->load->library('session');
    }

    function index() {
//        $session_data = $this->session->userdata('user_data');
//        if (isset($session_data) && ($session_data['UID'])) {
//            $data['artist_data'] = $this->User_model->get_data();
//            $data['page_title'] = "User List";
//            $data['user_data'] = $session_data;
//            $data['page'] = "list_user";
//            $this->load->view('backend/page', $data);
//        } else {
//            $this->session->unset_userdata('user_data');
//            redirect('user/login', 'refresh');
//        }

        $request = file_get_contents('php://input');
        $data = json_decode($request, true);
        $data = $_POST;
//        print_r($data);exit;
        switch ($data['action']) {
            case 'login':
                $result = $this->login($data['data']);
                break;
            case 'register':
                $result = $this->add($data['data']);
                break;
            case 'editProfile':
                $result = $this->add($data['data']);
                break;
            case 'getPost':
                $result = $this->get_posts($data['data']);
                break;
            case 'get_videos_front':
                $result = $this->get_front_video();
                break;
            case 'get_videos_single':
                $result = $this->get_single_video($data['data']);
                break;

            default:
                break;
        }
        echo json_encode($result);
//        print_r($result);
        exit;
    }

    function profile() {
        $session_data = $this->session->userdata('user_data');
        $user_id = $session_data['UID'];

        if (isset($session_data) && ($session_data['UID'])) {
            $data['user_data'] = $this->User_model->get_single($user_id);
            $data['page_title'] = "Profile Page";
            $data['page'] = "profile";
            $this->load->view('front/page', $data);
        } else {
            $this->session->unset_userdata('user_data');
            redirect('user/login', 'refresh');
        }
    }

    function login($data) {
        $response = array();
        if (isset($data['UserName']) && isset($data['UserName']) && $data['UserName'] != '' && $data['UserName'] != '') {
            $result = $this->User_model->login($data['UserName'], $data['Password']);
            if ($result) {
                $response['success'] = TRUE;
                $response['userData'] = $result[0];

//                redirect('User/index', 'refresh');
            } else {
                $response['success'] = False;
                $response['error'] = "User Id and Password Did not match.";
            }
        } else {
            $response['success'] = False;
            $response['error'] = "User Id or Password missing.";
        }
        return $response;
    }

    function add($data) {

        $response = array();
        try {
            if ($data['UserName'] == '')
                throw new Exception('User Name can not be empty');
            if ($data['FirstName'] == '')
                throw new Exception('First Name can not be empty');
            if ($data['Email'] == '')
                throw new Exception('Email can not be empty');
            if ($data['Password'] == '')
                throw new Exception('Password can not be empty');
            if ($data['UserType'] == '')
                throw new Exception('UserType can not be empty');

            if (isset($data['UID']) && $data['UID'] != '') {
                $artist_data = array(
                    'UserName' => isset($data['UserName']) && $data['UserName'] ? $data['UserName'] : '',
                    'FirstName' => isset($data['FirstName']) && $data['FirstName'] ? $data['FirstName'] : '',
                    'LastName' => isset($data['LastName']) && $data['LastName'] ? $data['LastName'] : '',
                    'Email' => isset($data['Email']) && $data['Email'] ? $data['Email'] : '',
                    'Password' => isset($data['Password']) && $data['Password'] ? md5($data['Password']) : '',
                    'AboutMe' => isset($data['AboutMe']) && $data['AboutMe'] ? $data['AboutMe'] : '',
                    'City' => isset($data['City']) && $data['City'] ? $data['City'] : '',
                    'State' => isset($data['State']) && $data['State'] ? $data['State'] : '',
                    'Country' => isset($data['Country']) && $data['Country'] ? $data['Country'] : '',
                    'DOB' => isset($data['DOB']) && $data['DOB'] ? date('Y-m-d', strtotime($data['DOB'])) : '',
                    'DateJoined' => isset($data['DateJoined']) && $data['DateJoined'] ? date('Y-m-d', strtotime($data['DateJoined'])) : date('Y-m-d'),
                    'Photo' => isset($data['Photo']) && $data['Photo'] ? $data['Photo'] : '',
                    'Website' => isset($data['Website']) && $data['Website'] ? $data['Website'] : '',
                    'UserType' => isset($data['UserType']) && $data['UserType'] ? $data['UserType'] : '',
                    'isActive' => 1,
                    'Created_By' => '',
                    'Updated_By' => '',
                );
                $result = $this->User_model->update_data($artist_data, array('UID' => $data['UID']));
                if ($result) {
                    $response['success'] = true;
                    $response['msg'] = "User Updated";
                } else {
                    $response['success'] = false;
                    $response['msg'] = "User not Updated";
                }
            } else {
                $artist_data = array(
                    'UserName' => isset($data['UserName']) && $data['UserName'] ? $data['UserName'] : '',
                    'FirstName' => isset($data['FirstName']) && $data['FirstName'] ? $data['FirstName'] : '',
                    'LastName' => isset($data['LastName']) && $data['LastName'] ? $data['LastName'] : '',
                    'Email' => isset($data['Email']) && $data['Email'] ? $data['Email'] : '',
                    'Password' => isset($data['Password']) && $data['Password'] ? md5($data['Password']) : '',
                    'AboutMe' => isset($data['AboutMe']) && $data['AboutMe'] ? $data['AboutMe'] : '',
                    'City' => isset($data['City']) && $data['City'] ? $data['City'] : '',
                    'State' => isset($data['State']) && $data['State'] ? $data['State'] : '',
                    'Country' => isset($data['Country']) && $data['Country'] ? $data['Country'] : '',
                    'DOB' => isset($data['DOB']) && $data['DOB'] ? date('YY-mm-dd', strtotime($data['DOB'])) : '',
                    'DateJoined' => isset($data['DateJoined']) && $data['DateJoined'] ? date('Y-m-d', strtotime($data['DateJoined'])) : date('Y-m-d'),
                    'Photo' => isset($data['Photo']) && $data['Photo'] ? $data['Photo'] : '',
                    'Website' => isset($data['Website']) && $data['Website'] ? $data['Website'] : '',
                    'UserType' => isset($data['UserType']) && $data['UserType'] ? $data['UserType'] : '',
                    'isActive' => 1,
                    'Created_By' => '',
                    'Updated_By' => '',
                );

                $result = $this->User_model->insert_data($artist_data);
                if ($result) {
                    $response['success'] = true;
                    $response['msg'] = "User added";
                } else {
                    $response['success'] = false;
                    $response['msg'] = "User not added";
                }
            }
        } catch (Exception $exc) {
            $response['success'] = false;
            $response['msg'] = $exc->getMessage();
        }

        return $response;
    }

    public function get_front_video() {
        $response = array();
        $response['songs_data'] = $this->Home_model->get_video();
        $response['success'] = true;
        $response['image_base_path'] = base_url('uploads/images');
        $response['base_url'] = base_url();
        $response['site_url'] = site_url();
        return $response;
    }

    public function get_posts($postData) {
        $response = array();
        $comments = array();
        try {
            $formdata = $postData;
            $limit = isset($formdata['limit']) && $formdata['limit'] ? $formdata['limit'] : NULL;
            $offset = isset($formdata['offset']) && $formdata['offset'] ? $formdata['offset'] : NULL;
            $offset_song = isset($formdata['offset_song']) && $formdata['offset_song'] ? $formdata['offset_song'] : NULL;
            $conditions_song = array('songs.isActive' => 1);
            $conditions = array(
                'parent_id' => 0,
                'UserType' => 4,
            );
            $comments = $this->Comment_model->get_data($conditions, $limit, $offset);
            $song_limit = 5 - count($comments);
            $songs = $this->Songs_model->get($conditions_song, $song_limit, $offset_song);
//            print_r($songs);exit;
            $i = 0;
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
            if (is_array($songs) && !empty($songs)) {
                foreach ($songs as $key1 => $value1) {
                    $comments[$i] = $value1;
                    $comments[$i]['song'] = true;
                    $comments[$i++]['subComments'] = $this->Comment_model->get_data(array('Song_id' => $value1['ID']), 2, 0, 'DESC');
                }
            }
//            print_r($comments);exit;
            $response['success'] = TRUE;
            $response['song_offset'] = $offset_song + $song_limit;
            $response['comment'] = $comments;
            $response['base_url'] = base_url();
        $response['site_url'] = site_url();
        } catch (Exception $exc) {
            $response['success'] = FALSE;
            $response['msg'] = $exc->getMessage();
        }

        return $response;
//        echo json_encode($response);
//        exit();
    }

    function get_single_video($vidData) {
        $song_id = $vidData['songId'];
        $song_data = $this->Home_model->getVideoBySongId($song_id);
//        $date = $song_data[0]['created_On'];
        $song_data[0]['created_On'] = date('M d, Y', strtotime($songs_data[0]['created_On']));
        $comments = $this->Comment_model->get_data(array('parent_id' => -1, 'UserType' => 4, 'iml_comment_song.Song_id' => $song_id));
        if (is_array($comments) && !empty($comments)) {
            foreach ($comments as $key => $value) {
                $comments[$key]['attachment'] = $this->Comment_model->getAttachment(array('comment_id' => $value['COM_ID']));
                $comments[$key]['subComments'] = $this->Comment_model->get_data(array('parent_id' => $value['COM_ID']), 2, 0, 'DESC');
            }
        }
        $allVideos = $this->Home_model->get_video();
        $artistAllVideo = $this->Home_model->get_artist_video($song_data[0]['UID'], $song_data[0]['ID']);
        $data['songs_data'] = $song_data[0];
        $data['comments'] = $comments;
        $data['allVideos'] = $allVideos;
        $data['artistAllVideo'] = $artistAllVideo;
        $data['video_base_path'] = base_url('uploads/videos');
        $data['image_base_path'] = base_url('uploads/images');
        $data['base_url'] = base_url();
        $data['site_url'] = site_url();
        
        return $data;
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function logout() {
        $this->session->unset_userdata('user_data');
        $this->session->sess_destroy();
        redirect('User', 'refresh');
    }

    function logoutFront() {
        $this->session->unset_userdata('user_data');
        $this->session->sess_destroy();
        redirect('Index', 'refresh');
    }

    function delete($user_id = NULL) {
        if (isset($user_id) && $user_id) {
            $result = array();
            $result = $this->User_model->delete($user_id);
            if (!empty($result)) {
                $data['msg'] = "User Deleted";
                $data['page_title'] = "List User";
                $data['page'] = 'list_user';
                redirect('User', 'refresh');
            } else {
                $response['success'] = false;
                $response = 'User not Deleted';
            }
        } else {
            $response['success'] = false;
            $response['msg'] = 'User not Found';
        }
        echo json_encode($response);
        exit;
    }

    function update_profile() {
        $session_data = $this->session->userdata('user_data');
        try {
            if (!$session_data['UID'])
                throw new Exception("Session Expired Please Login");

            if (!empty($_FILES)) {
                $target_dir = UPLOADS . '/images/';
                $target_file = $target_dir . basename($_FILES["upload"]["name"]);
                $uploadOk = 1;
                $imageFileType = pathinfo($target_file, PATHINFO_EXTENSION);

                if (imageFileType) {
                    if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif") {
                        $data['error_msg'] = "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
                    }
                    if (move_uploaded_file($_FILES["upload"]["tmp_name"], $target_file)) {
                        $response['status'] = 1;
                    } else {
                        $data['error_msg'] = "File uploading Failed because ";
                    }
                }
            } else {
                $response['error_msg'] = "File doenst exits";
            }
            $formdata = $_POST;

            $user_data = array(
                'FirstName' => isset($formdata['FirstName']) && $formdata['FirstName'] ? $formdata['FirstName'] : '',
                'LastName' => isset($formdata['LastName']) && $formdata['LastName'] ? $formdata['LastName'] : '',
                'Email' => isset($formdata['Email']) && $formdata['Email'] ? $formdata['Email'] : '',
                'Website' => isset($formdata['Website']) && $formdata['Website'] ? $formdata['Website'] : '',
                'ContactMe' => isset($formdata['ContactMe']) && $formdata['ContactMe'] ? $formdata['ContactMe'] : '',
                'DOB' => isset($formdata['DOB']) && $formdata['DOB'] ? date('Y-m-d', strtotime($formdata['DOB'])) : '',
                'City' => isset($formdata['City']) && $formdata['City'] ? $formdata['City'] : '',
                'State' => isset($formdata['State']) && $formdata['State'] ? $formdata['State'] : '',
                'Country' => isset($formdata['Country']) && $formdata['Country'] ? $formdata['Country'] : '',
                'Photo' => isset($formdata['photo_name']) && $formdata['photo_name'] ? $formdata['photo_name'] : ''
            );

            $user_id = $session_data['UID'];
            $result = $this->User_model->update_user($user_id, $user_data);
            if ($result) {
                $data['success'] = true;
                $data['user_data'] = $session_data;
                $data['msg'] = "User Updated";
                $data['page_title'] = "Profile Page";
                $data['page'] = 'profile';
                redirect('User/profile', 'refresh');
            } else {
                $data['success'] = false;
                $data['error_msg'] = "Updation Failed";
                $data['page_title'] = "Profile Page";
                $data['page'] = 'profile';
                $data['user_data'] = $session_data;
                $this->load->view('front/page', $data);
            }
        } catch (Exception $exc) {
            $response['success'] = FALSE;
            $response['msg'] = $exc->getMessage();
        }
        echo json_encode($response);
        exit();
    }

}

?>