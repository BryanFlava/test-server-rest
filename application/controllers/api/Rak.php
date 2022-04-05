<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Rak extends REST_Controller {

    function __construct($config = 'rest') {
        parent::__construct($config);
        $this->load->database();
    }

    //Menampilkan data Buku
    function index_get() {
        $id = $this->get('id');
        if ($id == '') {
            $buku = $this->db->get('rak')->result();
        } else {
            $this->db->where('id', $id);
            $buku = $this->db->get('rak')->result();
        }
        $this->response($buku, 200);
    }

//Mengirim atau menambah data Buku baru
function index_post() {
    $data = array(
    'id' => $this->post('id'),
    'rak' => $this->post('rak'),
    'kolom' => $this->post('kolom'));
    $insert = $this->db->insert('rak', $data);
    if ($insert) {
    $this->response($data, 200);
    } else {
    $this->response(array('status' => 'fail', 502));
    }
    }

  //Memperbarui data Buku yang telah ada
function index_put() {
    $id = $this->put('id');
    $data = array(
    'id' => $this->put('id'),
   'rak' => $this->put('rak'),
    'kolom' => $this->put('kolom'));
    $this->db->where('id', $id);
    $update = $this->db->update('rak', $data);
    if ($update) {
    $this->response($data, 200);
    } else {
    $this->response(array('status' => 'fail', 502));
    }
    }
    //Menghapus salah satu data Buku
function index_delete() {
    $id = $this->delete('id');
    $this->db->where('id', $id);
    $delete = $this->db->delete('rak');
    if ($delete) {
    $this->response(array('status' => 'success'), 201);
    } else {
    $this->response(array('status' => 'fail', 502));
    }
    }
   
}
?>