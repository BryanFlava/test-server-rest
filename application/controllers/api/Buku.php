<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Buku extends REST_Controller {

    function __construct($config = 'rest') {
        parent::__construct($config);
        $this->load->database();
    }

    //Menampilkan data kontak
    function index_get() {
        $id = $this->get('id');
        if ($id == '') {
            $buku = $this->db->get('buku')->result();
        } else {
            $this->db->where('id', $id);
            $buku = $this->db->get('buku')->result();
        }
        $this->response($buku, 200);
    }

//Mengirim atau menambah data kontak baru
function index_post() {
    $data = array(
    'id_buku' => $this->post('id_buku'),
    'nama_buku' => $this->post('nama_buku'),
    'jenis_buku' => $this->post('jenis_buku'),
    'nama_penerbit' => $this->post('nama_penerbit'),
    'tahun_penerbit' => $this->post('tahun_penerbit'));
    $insert = $this->db->insert('buku', $data);
    if ($insert) {
    $this->response($data, 200);
    } else {
    $this->response(array('status' => 'fail', 502));
    }
    }

  //Memperbarui data kontak yang telah ada
function index_put() {
    $id = $this->put('id_buku');
    $data = array(
    'id_buku' => $this->put('id_buku'),
   'nama_buku' => $this->put('nama_buku'),
   'jenis_buku' => $this->put('jenis_buku'),
   'nama_penerbit' => $this->put('nama_penerbit'),
    'tahun_penerbit' => $this->put('tahun_penerbit'));
    $this->db->where('id_buku', $id);
    $update = $this->db->update('buku', $data);
    if ($update) {
    $this->response($data, 200);
    } else {
    $this->response(array('status' => 'fail', 502));
    }
    }
    //Menghapus salah satu data kontak
function index_delete() {
    $id = $this->delete('id_buku');
    $this->db->where('id_buku', $id);
    $delete = $this->db->delete('buku');
    if ($delete) {
    $this->response(array('status' => 'success'), 201);
    } else {
    $this->response(array('status' => 'fail', 502));
    }
    }
   
}
?>