<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Peserta_kartu extends Member_Controller {
    private $kode_menu = 'peserta-kartu';
    private $kelompok = 'peserta';
    private $url = 'manager/peserta_kartu';
    
    function __construct(){
        parent::__construct();
        $this->load->model('cbt_user_grup_model');
        $this->load->model('cbt_user_model');
        $this->load->model('cbt_konfigurasi_model');

        parent::cek_akses($this->kode_menu);
        
        // Pastikan helper URL dimuat agar fungsi base_url() bisa bekerja
        $this->load->helper('url');
    }
    
    public function index(){
        $data['kode_menu'] = $this->kode_menu;
        $data['url'] = $this->url;
        
        $query_group = $this->cbt_user_grup_model->get_group();

        if($query_group->num_rows() > 0){
            $select = '';
            $query_group = $query_group->result();
            foreach ($query_group as $temp) {
                $select .= '<option value="'.$temp->grup_id.'">'.$temp->grup_nama.'</option>';
            }

        } else {
            $select = '<option value="0">KOSONG</option>';
        }
        $data['select_group'] = $select;
        
        $this->template->display_admin($this->kelompok.'/peserta_kartu_view', 'Cetak Kartu Peserta', $data);
    }

    /**
    * Cetak kartu hanya untuk satu grup saja
    */
    public function cetak_kartu($grup_id=null){
        $data['kode_menu'] = $this->kode_menu;
        
        $kartu = '<h3>Data Peserta Kosong</h3>';
        if(!empty($grup_id)){
            $query_user = $this->cbt_user_model->get_by_kolom('user_grup_id', $grup_id);
            if($query_user->num_rows() > 0){
                $kartu = '';
                $query_user = $query_user->result();
                
                $query_konfig = $this->cbt_konfigurasi_model->get_by_kolom_limit('konfigurasi_kode', 'cbt_nama', 1);
                $cbt_nama = 'Computer Based-Test';
                if($query_konfig->num_rows() > 0){
                    $cbt_nama = $query_konfig->row()->konfigurasi_isi;
                }
                
                $query_group = $this->cbt_user_grup_model->get_by_kolom_limit('grup_id', $grup_id, 1);
                $group = 'NULL';
                if($query_group->num_rows() > 0){
                    $group = $query_group->row()->grup_nama;
                }
                
                // Mendefinisikan URL background di luar loop agar lebih efisien
                $bg_url = base_url("public/images/bg.png");
                
                foreach ($query_user as $temp) {
                    
                    // 1. Definisikan path absolut server untuk dicek oleh PHP (file_exists)
                    $server_foto_path = FCPATH . "public/images/siswa/" . $temp->user_name . ".jpg";
                    
                    // 2. Logika pengecekan
                    // Jika file ditemukan di server, buat link base_url-nya
                    if (file_exists($server_foto_path)) { 
                        $foto_url = base_url("public/images/siswa/" . $temp->user_name . ".jpg"); 
                    } else {
                        // Jika tidak ditemukan, arahkan ke gambar default
                        $foto_url = base_url("public/images/siswa/images.jpeg"); 
                    }

                    $kartu .= '
                    <div class="kartu" style="
                        width: 264px; height: 396px; 
                        background-image: url(\'' . $bg_url . '\');  
                        background-size: cover;
                        background-position: center;
                        border: 2px solid #333; 
                        border-radius: 10px; 
                        padding: 15px; 
                        text-align: center; 
                        font-family: Arial, sans-serif; 
                        box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
                        display: inline-block;
                        margin: 10px;
                        box-sizing: border-box;
                    ">
                        <img src="' . $foto_url . '" alt="Foto Peserta" style="width: 113px; height: 152px; margin-bottom: 10px; margin-top: 80px; object-fit: cover; border-radius: 4px;">
                        <hr/>
                        <table style="text-align: left; font-size: 12px; width: 100%;">
                            <tr><td width="70px"><strong>Nama</strong></td><td width="5px">:</td><td>'.$temp->user_firstname.'</td></tr>
                            <tr><td><strong>Username</strong></td><td>:</td><td>'.$temp->user_name.'</td></tr>
                            <tr><td><strong>Password</strong></td><td>:</td><td>'.$temp->user_password.'</td></tr>
                            <tr><td><strong>Grup</strong></td><td>:</td><td>'.$group.'</td></tr>
                            <tr><td><strong>Ket.</strong></td><td>:</td><td>'.$temp->user_detail.'</td></tr>
                        </table>
                    </div>';
                }
                
            }
        }
        
        $data['kartu'] = $kartu;
        
        $this->load->view($this->kelompok.'/peserta_cetak_kartu_view', $data);
    }
}