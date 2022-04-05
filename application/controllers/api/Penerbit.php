<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Penerbit extends REST_Controller {

    function __construct($config = 'rest') {
        parent::__construct($config);
        $this->load->database();
    }

    //Menampilkan data Buku
    function index_get() {
        $id = $this->get('id');
        if ($id == '') {
            $buku = $this->db->get('penerbit')->result();
        } else {
            $this->db->where('id', $id);
            $buku = $this->db->get('penerbit')->result();
        }
        $this->response($buku, 200);
    }

//Mengirim atau menambah data Buku baru
function index_post() {
    $data = array(
    'id' => $this->post('id'),
    'nama_penerbit' => $this->post('nama_penerbit'),
    'tahun_penerbit' => $this->post('tahun_penerbit'));
    $insert = $this->db->insert('penerbit', $data);
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
   'nama_penerbit' => $this->put('nama_penerbit'),
    'tahun_penerbit' => $this->put('tahun_penerbit'));
    $this->db->where('id', $id);
    $update = $this->db->update('penerbit', $data);
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
    $delete = $this->db->delete('penerbit');
    if ($delete) {
    $this->response(array('status' => 'success'), 201);
    } else {
    $this->response(array('status' => 'fail', 502));
    }
    }
   
}
?>