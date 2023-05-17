<?php
class LoginModel extends Ci_Model
{
	public function check_user($email, $password)
    {
        $this->db->select('*');
        $this->db->where('email', $email);
        $this->db->where('password', md5($password));
        $query = $this->db->get('login');
        return $query;
    }

	// public function keamanan()
    // {
    //     $email = $this->session->userdata('email');
    //     if (empty($email)) {
    //         $this->session->sess_destroy();
    //         redirect('login');
    //     }
    // }
}
