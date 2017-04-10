<?php

class Comment_model extends CI_Model {

    public $table = 'iml_comment_song';
    public $attachment_table = 'comment_attachments';
    public $user_table = 'usermain';
    public $song_table = 'songs';
//    public $song_comment = 'iml_comment_song';

    function __construct() {
        parent::__construct();
    }

    function insert_data($data) {

        $this->db->insert($this->table, $data);
        return $this->db->insert_id();
    }

    function insert_comment_attachment($data) {

        $this->db->insert($this->attachment_table, $data);
//            print_r($this->db->last_query());exit;
        return $this->db->insert_id();
    }

    public function get_data($conditions = array(), $limit = NULL, $offset = NULL, $order = 'DESC') {
        $this->db->select('*');
        $this->db->from($this->table);
        $this->db->join($this->user_table, 'iml_comment_song.id = usermain.UID', 'inner');
        if (!empty($conditions)) {
            foreach ($conditions as $key => $value) {
                $this->db->where($key, $value);
            }
        }
        if ($limit)
            $this->db->limit($limit, $offset);
        $this->db->order_by('COM_ID', $order);
        $query = $this->db->get();
        $result = $query->result_array();
        return $result;
    }

    public function get_song_comment($song_id) {
        $sql = "SELECT iml_comment_song.*, usermain.* FROM iml_comment_song INNER JOIN usermain ON iml_comment_song.Created_By=usermain.UID WHERE song_id='$song_id' ORDER BY `COM_ID` DESC";

        $query = $this->db->query($sql);
        $result = array();
        if ($query !== FALSE && $query->num_rows() > 0) {
            $result = $query->result_array();
        }
        return $result;
    }
    
    public function get_comment_byparent($parent_id) {
        $sql = "SELECT * FROM iml_comment_song WHERE parent_id='$parent_id' ORDER BY `created_On` DESC";

        $query = $this->db->query($sql);
        $result = array();
        if ($query !== FALSE && $query->num_rows() > 0) {
            $result = $query->result_array();
        }
        return $result;
    }

    function getAttachment($conditions = array(), $limit = NULL, $offset = NULL) {
        $this->db->select('*');
        $this->db->from($this->attachment_table);
        if (!empty($conditions)) {
            foreach ($conditions as $key => $value) {
                $this->db->where($key, $value);
            }
        }
        $query = $this->db->get();
        $result = $query->result_array();
        return $result;
    }

    function update_data($data, $conditions = array()) {
        if (!empty($conditions)) {
            foreach ($conditions as $key => $value) {
                $this->db->where($key, $value);
            }
        }
        $this->db->update($this->table, $data);
        return TRUE;
    }

}

?>