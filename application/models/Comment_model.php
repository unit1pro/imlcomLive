<?php

class Comment_model extends CI_Model {

    public $table = 'iml_comment_song';
    public $attachment_table = 'comment_attachments';
    public $user_table = 'usermain';
    public $song_table = 'songs';

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
//        $this->db->join($this->song_table, 'iml_comment_song.Song_id = songs.ID', 'left');
        if (!empty($conditions)) {
            foreach ($conditions as $key => $value) {
                $this->db->where($key, $value);
            }
        }
//        $this->db->or_where('parent_id', '-1');
        if ($limit)
            $this->db->limit($limit, $offset);
        $this->db->order_by('COM_ID', $order);
        $query = $this->db->get();
//        print_r($this->db->last_query());exit;
        $result = $query->result_array();
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