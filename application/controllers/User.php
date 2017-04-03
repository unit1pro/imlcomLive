<?php

class User extends CI_Controller {

    function User() {
        parent::__construct();
        $this->load->model('User_model');
        $this->load->model('UserType_model');
//        $this->load->library('session');
    }

    function index() {

        $session_data = $this->session->userdata('user_data');
        if (isset($session_data) && ($session_data['UID'])) {
            $data['artist_data'] = $this->User_model->get_data();
//                    print "<pre>";print_r($data['artist_data']);exit;
            $data['page_title'] = "User List";
            $data['user_data'] = $session_data;
            $data['page'] = "list_user";
            $this->load->view('backend/page', $data);
        } else {
            $this->session->unset_userdata('user_data');
            redirect('user/login', 'refresh');
        }
    }

    function login() {
        $this->form_validation->set_rules('UserName', 'Username', 'required');
        $this->form_validation->set_rules('Password', 'Password', 'required');
        if ($this->form_validation->run()) {
            $formdata = $this->input->post();
            $result = $this->User_model->login($formdata['UserName'], $formdata['Password']);
            if ($result) {
                $sess_array = array();
                $this->session->set_userdata('user_data', (array) $result[0]);
                redirect('User/index', 'refresh');
            } else {
                $this->load->view('backend/login');
            }
        } else {
            $data['page_title'] = "Login";
            $data['page'] = 'login';
            $this->load->view('backend/login');
        }
    }

    function login_front() {
        $this->form_validation->set_rules('UserName', 'Username', 'required');
        $this->form_validation->set_rules('Password', 'Password', 'required');
        if ($this->form_validation->run()) {
            $formdata = $this->input->post();
            $result = $this->User_model->login($formdata['UserName'], $formdata['Password']);
            if ($result) {
                $sess_array = array();
                $this->session->set_userdata('user_data', (array) $result[0]);
                $this->session->set_userdata('login_msg', 'Login successful');
                redirect('index', 'refresh');
            } else {
                $this->session->set_userdata('login_msg', 'Wrong Username or password');
                redirect('index', 'refresh');
            }
        } else {
            $this->session->set_userdata('login_msg', 'Please enter Username and password');
            redirect('index', 'refresh');
        }
    }

    function edit() {
        $session_data = $this->session->userdata('user_data');
        if (isset($session_data) && ($session_data['UID'])) {

            if (isset($_POST["add"])) {
                $this->form_validation->set_rules('UserName', 'UserName', 'required');
                $this->form_validation->set_rules('FirstName', 'FirstName', 'required');
                $this->form_validation->set_rules('Email', 'Email', 'required');
                $this->form_validation->set_rules('Password', 'Password', 'required');
                $this->form_validation->set_rules('UserType', 'UserType', 'required');
                if ($this->form_validation->run()) {
                    $formdata = $this->input->post();
                    if (isset($formdata['UID']) && $formdata['UID'] != '') {
                        $artist_data = array(
                            'UserName' => isset($formdata['UserName']) && $formdata['UserName'] ? $formdata['UserName'] : '',
                            'FirstName' => isset($formdata['FirstName']) && $formdata['FirstName'] ? $formdata['FirstName'] : '',
                            'LastName' => isset($formdata['LastName']) && $formdata['LastName'] ? $formdata['LastName'] : '',
                            'Email' => isset($formdata['Email']) && $formdata['Email'] ? $formdata['Email'] : '',
                            'Password' => isset($formdata['Password']) && $formdata['Password'] ? md5($formdata['Password']) : '',
                            'AboutMe' => isset($formdata['AboutMe']) && $formdata['AboutMe'] ? $formdata['AboutMe'] : '',
                            'City' => isset($formdata['City']) && $formdata['City'] ? $formdata['City'] : '',
                            'State' => isset($formdata['State']) && $formdata['State'] ? $formdata['State'] : '',
                            'Country' => isset($formdata['Country']) && $formdata['Country'] ? $formdata['Country'] : '',
                            'DOB' => isset($formdata['DOB']) && $formdata['DOB'] ? date('YY-mm-dd', strtotime($formdata['DOB'])) : '',
                            'DateJoined' => isset($formdata['DateJoined']) && $formdata['DateJoined'] ? date('YY-mm-dd', strtotime($formdata['DateJoined'])) : '',
                            'Photo' => isset($formdata['Photo']) && $formdata['Photo'] ? $formdata['Photo'] : '',
                            'Website' => isset($formdata['Website']) && $formdata['Website'] ? $formdata['Website'] : '',
                            'UserType' => isset($formdata['UserType']) && $formdata['UserType'] ? $formdata['UserType'] : '',
                            'isActive' => 1,
                            'Created_By' => $session_data['UID'],
                            'Updated_By' => $session_data['UID'],
                        );
                        $result = $this->User_model->update_data($artist_data, array('UID' => $formdata['UID']));
                        if ($result) {
                            $sess_array = array();
                            $data['success'] = true;
                            $data['msg'] = "User Updated";
                            $data['page_title'] = "Add User";
                            $data['page'] = 'add_user';
                            $data['user_data'] = $session_data;
                            redirect('User/list', 'refresh');
                        } else {
                            $data['success'] = false;
                            $data['msg'] = "User not Updated";
                            $data['page_title'] = "Add User";
                            $data['page'] = 'add_user';
                            $data['user_data'] = $session_data;
                            redirect('User/list', 'refresh');
                        }
                    }
                    $artist_data = array(
                        'UserName' => isset($formdata['UserName']) && $formdata['UserName'] ? $formdata['UserName'] : '',
                        'FirstName' => isset($formdata['FirstName']) && $formdata['FirstName'] ? $formdata['FirstName'] : '',
                        'LastName' => isset($formdata['LastName']) && $formdata['LastName'] ? $formdata['LastName'] : '',
                        'Email' => isset($formdata['Email']) && $formdata['Email'] ? $formdata['Email'] : '',
                        'Password' => isset($formdata['Password']) && $formdata['Password'] ? md5($formdata['Password']) : '',
                        'AboutMe' => isset($formdata['AboutMe']) && $formdata['AboutMe'] ? $formdata['AboutMe'] : '',
                        'City' => isset($formdata['City']) && $formdata['City'] ? $formdata['City'] : '',
                        'State' => isset($formdata['State']) && $formdata['State'] ? $formdata['State'] : '',
                        'Country' => isset($formdata['Country']) && $formdata['Country'] ? $formdata['Country'] : '',
                        'DOB' => isset($formdata['DOB']) && $formdata['DOB'] ? date('YY-mm-dd', strtotime($formdata['DOB'])) : '',
                        'DateJoined' => isset($formdata['DateJoined']) && $formdata['DateJoined'] ? date('YY-mm-dd', strtotime($formdata['DateJoined'])) : '',
                        'Photo' => isset($formdata['Photo']) && $formdata['Photo'] ? $formdata['Photo'] : '',
                        'Website' => isset($formdata['Website']) && $formdata['Website'] ? $formdata['Website'] : '',
                        'UserType' => isset($formdata['UserType']) && $formdata['UserType'] ? $formdata['UserType'] : '',
                        'isActive' => 1,
                        'Created_By' => $session_data['UID'],
                        'Updated_By' => $session_data['UID'],
                    );

                    $result = $this->User_model->insert_data($artist_data);
                    if ($result) {
                        $data['userType'] = $this->UserType_model->get();
                        $sess_array = array();
                        $data['success'] = true;
                        $data['msg'] = "User added";
                        $data['page_title'] = "Add User";
                        $data['page'] = 'add_user';
                        $data['user_data'] = $session_data;
                        $this->load->view('backend/page', $data);
                    } else {
                        $data['userType'] = $this->UserType_model->get();
                        $data['success'] = false;
                        $data['msg'] = "User not added";
                        $data['page_title'] = "Add User";
                        $data['page'] = 'add_user';
                        $data['user_data'] = $session_data;
                        $this->load->view('backend/page', $data);
                    }
                } else {
                    $data['userType'] = $this->UserType_model->get();
                    $data['page_title'] = "Add User";
                    $data['page'] = 'add_user';
                    $data['user_data'] = $session_data;
                    $this->load->view('backend/page', $data);
                }
            }

            if (isset($_POST["update"])) {
                $formdata = $this->input->post();

                $artist_data = array(
                    'UID' => isset($formdata['UID']) && $formdata['UID'] ? $formdata['UID'] : '',
                    'UserName' => isset($formdata['UserName']) && $formdata['UserName'] ? $formdata['UserName'] : '',
                    'FirstName' => isset($formdata['FirstName']) && $formdata['FirstName'] ? $formdata['FirstName'] : '',
                    'LastName' => isset($formdata['LastName']) && $formdata['LastName'] ? $formdata['LastName'] : '',
                    'Email' => isset($formdata['Email']) && $formdata['Email'] ? $formdata['Email'] : '',
                    'Password' => isset($formdata['Password']) && $formdata['Password'] ? md5($formdata['Password']) : '',
                    'AboutMe' => isset($formdata['AboutMe']) && $formdata['AboutMe'] ? $formdata['AboutMe'] : '',
                    'City' => isset($formdata['City']) && $formdata['City'] ? $formdata['City'] : '',
                    'State' => isset($formdata['State']) && $formdata['State'] ? $formdata['State'] : '',
                    'Country' => isset($formdata['Country']) && $formdata['Country'] ? $formdata['Country'] : '',
                    'DOB' => isset($formdata['DOB']) && $formdata['DOB'] ? date('YY-mm-dd', strtotime($formdata['DOB'])) : '',
                    'DateJoined' => isset($formdata['DateJoined']) && $formdata['DateJoined'] ? date('YY-mm-dd', strtotime($formdata['DateJoined'])) : '',
                    'Photo' => isset($formdata['Photo']) && $formdata['Photo'] ? $formdata['Photo'] : '',
                    'Website' => isset($formdata['Website']) && $formdata['Website'] ? $formdata['Website'] : '',
                    'UserType' => isset($formdata['UserType']) && $formdata['UserType'] ? $formdata['UserType'] : '',
                    'isActive' => 1,
                    'Created_By' => $session_data['UID'],
                    'Updated_By' => $session_data['UID'],
                );

                $artist_id = $artist_data['UID'];
                $result = $this->User_model->update_user($artist_id, $artist_data);

                if ($result) {
                    $data['success'] = true;

                    $data['user_data'] = $session_data;
                    $data['msg'] = "User Edited";
                    $data['page_title'] = "List User";
                    $data['page'] = 'list_user';
                    redirect('User', 'refresh');
                } else {
                    $data['success'] = false;
                    $data['msg'] = "User not Updated";
                    $data['page_title'] = "Editing User";
                    $data['page'] = 'list_user';
                    $data['user_data'] = $session_data;
                    $this->load->view('backend/page', $data);
                }
            }
        } else {
            $this->session->unset_userdata('user_data');
            redirect('user/login', 'refresh');
        }
    }

    function add() {

        $session_data = $this->session->userdata('user_data');

        if (isset($session_data) && ($session_data['UID'])) {


            $this->form_validation->set_rules('UserName', 'UserName', 'required');
            $this->form_validation->set_rules('FirstName', 'FirstName', 'required');
            $this->form_validation->set_rules('Email', 'Email', 'required');
            $this->form_validation->set_rules('Password', 'Password', 'required');
            $this->form_validation->set_rules('UserType', 'UserType', 'required');
            if ($this->form_validation->run()) {
                $formdata = $this->input->post();
                if (isset($formdata['UID']) && $formdata['UID'] != '') {
                    $artist_data = array(
                        'UserName' => isset($formdata['UserName']) && $formdata['UserName'] ? $formdata['UserName'] : '',
                        'FirstName' => isset($formdata['FirstName']) && $formdata['FirstName'] ? $formdata['FirstName'] : '',
                        'LastName' => isset($formdata['LastName']) && $formdata['LastName'] ? $formdata['LastName'] : '',
                        'Email' => isset($formdata['Email']) && $formdata['Email'] ? $formdata['Email'] : '',
                        'Password' => isset($formdata['Password']) && $formdata['Password'] ? md5($formdata['Password']) : '',
                        'AboutMe' => isset($formdata['AboutMe']) && $formdata['AboutMe'] ? $formdata['AboutMe'] : '',
                        'City' => isset($formdata['City']) && $formdata['City'] ? $formdata['City'] : '',
                        'State' => isset($formdata['State']) && $formdata['State'] ? $formdata['State'] : '',
                        'Country' => isset($formdata['Country']) && $formdata['Country'] ? $formdata['Country'] : '',
                        'DOB' => isset($formdata['DOB']) && $formdata['DOB'] ? date('YY-mm-dd', strtotime($formdata['DOB'])) : '',
                        'DateJoined' => isset($formdata['DateJoined']) && $formdata['DateJoined'] ? date('YY-mm-dd', strtotime($formdata['DateJoined'])) : '',
                        'Photo' => isset($formdata['Photo']) && $formdata['Photo'] ? $formdata['Photo'] : '',
                        'Website' => isset($formdata['Website']) && $formdata['Website'] ? $formdata['Website'] : '',
                        'UserType' => isset($formdata['UserType']) && $formdata['UserType'] ? $formdata['UserType'] : '',
                        'isActive' => 1,
                        'Created_By' => $session_data['UID'],
                        'Updated_By' => $session_data['UID'],
                    );
                    $result = $this->User_model->update_data($artist_data, array('UID' => $formdata['UID']));
                    if ($result) {
                        $sess_array = array();
                        $data['success'] = true;
                        $data['msg'] = "User Updated";
                        $data['page_title'] = "Add User";
                        $data['page'] = 'add_user';
                        $data['user_data'] = $session_data;
                        redirect('User/list', 'refresh');
                    } else {
                        $data['success'] = false;
                        $data['msg'] = "User not Updated";
                        $data['page_title'] = "Add User";
                        $data['page'] = 'add_user';
                        $data['user_data'] = $session_data;
                        redirect('User/list', 'refresh');
                    }
                }
                $artist_data = array(
                    'UserName' => isset($formdata['UserName']) && $formdata['UserName'] ? $formdata['UserName'] : '',
                    'FirstName' => isset($formdata['FirstName']) && $formdata['FirstName'] ? $formdata['FirstName'] : '',
                    'LastName' => isset($formdata['LastName']) && $formdata['LastName'] ? $formdata['LastName'] : '',
                    'Email' => isset($formdata['Email']) && $formdata['Email'] ? $formdata['Email'] : '',
                    'Password' => isset($formdata['Password']) && $formdata['Password'] ? md5($formdata['Password']) : '',
                    'AboutMe' => isset($formdata['AboutMe']) && $formdata['AboutMe'] ? $formdata['AboutMe'] : '',
                    'City' => isset($formdata['City']) && $formdata['City'] ? $formdata['City'] : '',
                    'State' => isset($formdata['State']) && $formdata['State'] ? $formdata['State'] : '',
                    'Country' => isset($formdata['Country']) && $formdata['Country'] ? $formdata['Country'] : '',
                    'DOB' => isset($formdata['DOB']) && $formdata['DOB'] ? date('YY-mm-dd', strtotime($formdata['DOB'])) : '',
                    'DateJoined' => isset($formdata['DateJoined']) && $formdata['DateJoined'] ? date('YY-mm-dd', strtotime($formdata['DateJoined'])) : '',
                    'Photo' => isset($formdata['Photo']) && $formdata['Photo'] ? $formdata['Photo'] : '',
                    'Website' => isset($formdata['Website']) && $formdata['Website'] ? $formdata['Website'] : '',
                    'UserType' => isset($formdata['UserType']) && $formdata['UserType'] ? $formdata['UserType'] : '',
                    'isActive' => 1,
                    'Created_By' => $session_data['UID'],
                    'Updated_By' => $session_data['UID'],
                );

                $result = $this->User_model->insert_data($artist_data);
                if ($result) {
                    $data['userType'] = $this->UserType_model->get();
                    $sess_array = array();
                    $data['success'] = true;
                    $data['msg'] = "User added";
                    $data['page_title'] = "Add User";
                    $data['page'] = 'add_user';
                    $data['user_data'] = $session_data;
                    $this->load->view('backend/page', $data);
                } else {
                    $data['userType'] = $this->UserType_model->get();
                    $data['success'] = false;
                    $data['msg'] = "User not added";
                    $data['page_title'] = "Add User";
                    $data['page'] = 'add_user';
                    $data['user_data'] = $session_data;
                    $this->load->view('backend/page', $data);
                }
            } else {
                $data['userType'] = $this->UserType_model->get();
                $data['page_title'] = "Add User";
                $data['page'] = 'add_user';
                $data['user_data'] = $session_data;
                $this->load->view('backend/page', $data);
            }
        } else {
            $this->session->unset_userdata('user_data');
            redirect('user/login', 'refresh');
        }
    }

    function update($user_id = NULL) {
        $session_data = $this->session->userdata('user_data');
        if (isset($session_data) && ($session_data['UID'])) {
            if (!empty($user_id)) {
                $data['formdata'] = $this->User_model->get_single($user_id);
                $data['page_title'] = "Edit Songs";
                $data['page'] = 'add_user';
                $data['user_data'] = $session_data;
                $this->load->view('backend/page', $data);
            }
        } else {
            $this->session->unset_userdata('user_data');
            redirect('user/login', 'refresh');
        }
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

}

?>