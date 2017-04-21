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
            case 'autocheck':
                $result = $this->autocheck($data['data']);
                break;
            case 'like':
                $result = $this->like($data['data']);
                break;

            case 'comment':
                $result = $this->post_comment($data['data']);
                break;

            case 'video_views':
                $result = $this->post_hit_count($data['data']);
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

    function autocheck($data) {
        $result = $this->User_model->autocheck($data);
//        print_r($result);exit;
        $response = array();
        if (!empty($result)) {
            $response['success'] = FALSE;
            $response['msg'] = $data['value'] . " Already Exist Please choose diffrent " . $data['key'];
        } else {
            $response['success'] = TRUE;
            $response['msg'] = $data['value'] . " available";
        }
        return $response;
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
                $response['error'] = "User Id and Password didn't match.";
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
                    $response['user_data'] = $this->User_model->get_single($data['UID']);
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
                    $response['user_data'] = $this->User_model->get_single($result);
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
            $session_user_id = $formdata['user_id'];
            $i = 0;
            if (is_array($comments) && !empty($comments)) {
                foreach ($comments as $key => $value) {
                    $i++;
                    $comments[$key]['song'] = FALSE;
                    $comments[$key]['attachment'] = $this->Comment_model->getAttachment(array('comment_id' => $value['COM_ID']));
                    $comments[$key]['subComments'] = $this->Comment_model->get_data(array('parent_id' => $value['COM_ID']), 2, 0, 'DESC');
                    $result = $this->Comment_model->getResponse($value['COM_ID'], $session_user_id);
                    $comments[$key]['user_response'] = (int) $result[0]['response_type'];
                    $comments[$key]['like_count'] = $this->Comment_model->get_total_like(array($value['COM_ID']), 1);
                    $comments[$key]['dislike_count'] = $this->Comment_model->get_total_dislike(array($value['COM_ID']), 2);
                    $comments[$key]['subComments'] = $this->Comment_model->get_data(array('parent_id' => $value['COM_ID']), 2, 0, 'DESC');
                    foreach ($comments[$key]['subComments'] as $key2 => $value2) {
                        $comments[$key]['subComments'][$key2]['like_count'] = $this->Comment_model->get_total_like(array($value2['COM_ID']), 1);
                        $comments[$key]['subComments'][$key2]['dislike_count'] = $this->Comment_model->get_total_like(array($value2['COM_ID']), 2);
                        $result_sub = $this->Comment_model->getResponse($value2['COM_ID'], $session_user_id);
                        $comments[$key]['subComments'][$key2]['user_response'] = (int) $result_sub[0]['response_type'];
                    }
                }
            }
            if (is_array($songs) && !empty($songs)) {
                foreach ($songs as $key1 => $value1) {
                    $comments[$i] = $value1;
                    $comments[$i]['song'] = true;
                    $comments[$i++]['subComments'] = $this->Comment_model->get_data(array('Song_id' => $value1['ID']), 2, 0, 'DESC');
                    $result = $this->Comment_model->getResponse($value1['ID'], $session_user_id);
                    $comments[$i]['user_response'] = (int) $result1[0]['response_type'];
                    $comments[$i]['like_count'] = $this->Comment_model->get_total_like(array($value1['ID']), 1);
                    $comments[$i]['dislike_count'] = $this->Comment_model->get_total_dislike(array($value1['ID']), 2);
                    foreach ($comments[$i]['subComments'] as $key3 => $value3) {
                        $comments[$i]['subComments'][$key3]['like_count'] = $this->Comment_model->get_total_like(array($value3['Song_id']), 1);
                        $comments[$i]['subComments'][$key3]['dislike_count'] = $this->Comment_model->get_total_dislike(array($value3['Song_id']), 2);
                        $result_sub = $this->Comment_model->getResponse($value3['Song_id'], $session_user_id);
                        $comments[$i]['subComments'][$key3]['user_response'] = (int) $result_sub[0]['response_type'];
                    }
                    $i++;
                }
            }
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
    }

    function get_single_video($vidData) {
        $song_id = $vidData['songId'];
        $user_id = $vidData['user_id'];
        $song_data = $this->Home_model->getVideoBySongId($song_id);
        $song_data[0]['created_On'] = date('M d, Y', strtotime($songs_data[0]['created_On']));
        $result = $this->Comment_model->getResponse($song_data[0]['ID'], $user_id);
        $song_data[0]['user_response'] = (int) $result[0]['response_type'];
        $song_data[0]['total_likes'] = $this->Comment_model->get_total_like([$song_data[0]['ID']], 1);
        $song_data[0]['total_dislikes'] = $this->Comment_model->get_total_dislike([$song_data[0]['ID']], 2);
        
//        $comments = $this->Comment_model->get_data(array('parent_id' => -1, 'UserType' => 4, 'iml_comment_song.Song_id' => $song_id));
        $comments = $this->Comment_model->get_song_comment($song_data[0]['SongsID']);
        if (is_array($comments) && !empty($comments)) {
            foreach ($comments as $key => $value) {
                $resultCommentUserResponse = $this->Comment_model->getResponse($value['COM_ID'], $user_id);
                $comments[$key]['user_response'] = (int) $resultCommentUserResponse[0]['response_type'];
                $comments[$key]['total_likes'] = $this->Comment_model->get_total_like(array($value['COM_ID']), 1);
                $comments[$key]['total_dislikes'] = $this->Comment_model->get_total_dislike(array($value['COM_ID']), 2);

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

    public function like() {

        $data = $_POST['data'];

        $response = array();
        try {
            $conditions = array(
                'response_on' => $data['comment_id'],
                'post_type' => $data['post_type'],
                'updated_by' => $data['userid'],
            );


            $search_result = $this->Comment_model->get_like_status($conditions);

            if (empty($search_result)) {
                $likeData = array(
                    'post_type' => $data['post_type'],
                    'response_type' => $data['response_type'],
                    'response_on' => $data['comment_id'],
                    'created_by' => $data['userid'],
                    'created_on' => date("Y-m-d h:i:s"),
                    'updated_by' => $data['userid'],
                    'updated_on' => date("Y-m-d h:i:s"),
                );
                $likeId = $this->Comment_model->insert_response($likeData);

                if ($likeId) {
                    $response['success'] = TRUE;
                    $response['data'] = $likeId;
                    $response['msg'] = $data['response_type'];
                }
            } else {

                $response_type = $search_result[0]['response_type'];
                if ($response_type == $data['response_type']) {
                    $like_data = array(
                        'response_type' => 0,
                        'updated_by' => $data['userid'],
                        'updated_on' => date("Y-m-d h:i:s"),
                    );
                } else {
                    $like_data = array(
                        'response_type' => $data['response_type'],
                        'updated_by' => $data['userid'],
                        'updated_on' => date("Y-m-d h:i:s"),
                    );
                }
                $update_result = $this->Comment_model->update_like_status($like_data, array('response_on' => $data['comment_id'], 'updated_by' => $data['userid']));
                if ($update_result) {
                    $response['success'] = TRUE;
                    $response['data'] = $update_result;
                    $response['msg'] = $like_data['response_type'];
                }
            }
            $response['likeCount'] = $this->Comment_model->get_total_like(array($data['comment_id']), 1);
            $response['dislikeCount'] = $this->Comment_model->get_total_dislike(array($data['comment_id']), 2);
        } catch (Exception $exc) {
            $response['success'] = FALSE;
            $response['msg'] = $exc->getMessage();
        }
        echo json_encode($response);
        exit();
    }

    public function post_comment() {
        $formData = $data = $_POST['data'];

        $user_id = $formData['userid'];
        $session_data = $this->session->userdata('user_data');
        $response = array();
        try {
            if (!$user_id)
                throw new Exception("Session Expired Please Login");
            if ($formData['COMMENTS'] == '' && (!isset($formData['attchment_path'])))
                throw new Exception("Please write some comment or add a file to submit");
            $insertData = array(
                'ID' => $session_data['UID'],
                'parent_id' => isset($formData['parent_id']) && $formData['parent_id'] ? $formData['parent_id'] : 0,
                'Song_id' => isset($formData['Song_id']) && $formData['Song_id'] ? $formData['Song_id'] : 0,
                'COMMENTS' => isset($formData['COMMENTS']) && $formData['COMMENTS'] ? $formData['COMMENTS'] : '',
                'isActive' => 1,
                'created_by' => $user_id,
                'updated_by' => $user_id,
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
                        'created_by' => $user_id,
                        'updated_by' => $user_id,
                    );
                    $attachmentId[] = $this->Comment_model->insert_comment_attachment($attachmentData);
                }
            }
            $comment = $this->Comment_model->get_data(array('COM_ID' => $comment_id));
            $comment[0]['attachment'] = $this->Comment_model->getAttachment(array('comment_id' => $comment_id));
            $response['success'] = TRUE;
            $response['msg'] = "Post Saved";
            $response['base_url'] = base_url();
            $response['comment'] = $comment;
        } catch (Exception $exc) {
            $response['success'] = FALSE;
            $response['base_url'] = base_url();
            $response['msg'] = $exc->getMessage();
        }
        echo json_encode($response);
        exit();
    }

    function post_hit_count() {

        try {
            $data = $_POST['data']['data'];
            $session_data = $this->session->userdata('user_data');

            $song_data = array(
                'HITS' => $data['new_view']
            );
            $result = $this->Songs_model->update_song($data['song_id'], $song_data);
        } catch (Exception $exc) {
            $response['success'] = FALSE;
            $response['msg'] = $exc->getMessage();
        }
        echo json_encode($response);
        exit();
    }

}

?>