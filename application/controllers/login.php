<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class login extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->library('form_validation');
		
	}
	public function index()
	{
        if ($this->session->userdata('user')) {
            redirect(base_url());
        }

        $data['title'] = 'Inventory Koperasi';
        $this->load->library('form_validation');
        $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
        $this->form_validation->set_rules('password', 'Password', 'trim|required');

        if ($this->form_validation->run() == false) {
            $this->load->view('templates_login/header', $data);
            $this->load->view('login_view');
            $this->load->view('templates_login/footer');
        } else {
            $this->auth();
        }
	}

	function auth()
    {
        $email   = $this->input->post('email', TRUE);
        $password   = $this->input->post('password', TRUE);
        $result     = $this->LoginModel->check_user($email, $password);
        if ($result->num_rows() > 0) {
            $data           = $result->row_array();
            $id             = $data['id'];
			$name           = $data['name'];
            $employee_id    = $data['employee_id'];
            $department     = $data['department'];
            $email          = $data['email'];
            $level_id       = $data['level_id'];
           
            $sesdata        = array(
                'id'            => $id,
				'name'	=> $name,	
                'employee_id'   => $employee_id,
                'email'     	 => $email,
                'level_id'      => $level_id,
                'department'   => $department,
                'logged_in'     => TRUE
            );


            $this->session->set_userdata($sesdata);
            if ($level_id === '1') {
                redirect('Home_staff/index');
            } elseif ($level_id === '2') {
                redirect('Home_manager/index');
            } elseif ($level_id === '3') {
                redirect('Home_kepalakoperasi/index');
            }
        } else if ($password == '') {
            $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Email and Password is required!<button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">&times;</span> </button></div>');
            redirect('Login');
        } else if ($password != $result) {
            // Jika password salah, tampilkan alert menggunakan flashdata dan arahkan ke halaman auth/index
            $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Password is incorrect!<button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">&times;</span> </button></div>');
            redirect('Login');
            
            // echo "<script>alert('Access Denied !');history.go(-1);</script>";
            // $pesan = "Maaf, User Tidak Di temukan";
			// $status = false;            
        }
        $this->load->view('login_view');
    }

	public function forgot()
	{
		$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
		if ($this->form_validation->run() == false) {
		$data['title'] = 'Inventory - Koperasi';
		$this->load->view('templates_login/header', $data);
		$this->load->view('forgot');
		$this->load->view('templates_login/footer');
		} else {
			$email = $this->input->post('email');
			$user = $this->db->get_where('login', ['email' => $email, 'is_active' => 1])->row_array();

			if ($user) {
				$token = base64_encode(random_bytes(32));
				$user_token = [
					'email' => $email,
					'token' => $token,
					'date_created' => 'time()'
				];
				$this->db->insert('user_token', $user_token);
				$this->_sendEmail($token, 'forgot');

				$this->session->set_flashdata('flash', '<div class="alert alert-success" role="alert">Please check your email to reset your password !</div>');
				redirect('login/forgot');
			} else {
				$this->session->set_flashdata('flash', '<div class="alert alert-danger" role="alert">Wrong Email</div>');
				redirect('login/forgot');
			}
		}
	}

	private function _sendEmail($token, $type)
	{

	$config['protocol'] = 'smtp';
	$config['smtp_host'] = 'ssl://smtp.googlemail.com';
	$config['smtp_user'] = 'crispynuts08@gmail.com';
	$config['smtp_pass'] = 'ypnjiuvqzfjbbvhq'; //pass app email 
	$config['smtp_port'] = '465';
	$config['mailtype'] = 'html';			
	$config['charset'] = 'utf-8';
	$config['wordwrap'] = TRUE;
	$config['smtp_timeout']='30';
	$config['newline']="\r\n";
	
	$this->load->library('email', $config);
	$this->email->from('crispynuts08@gmail.com');
	$this->email->to($this->input->post('email'));

	if($type == 'verify') {
		$this->email->subject('Account Verification');
		$this->email->message('Click this link to verify your account : <a href="' . base_url() . 'login/verify?email=' . $this->input->post('email') . '&token=' . urlencode($token) . '">Activated</a>');
	}elseif($type == 'forgot'){
		$this->email->subject('Reset Password');
		$this->email->message('Click this link to reset your password : <a href="' . base_url() . 'login/resetpassword?email=' . $this->input->post('email') . '&token=' . urlencode($token) . '">Reset Password</a>');
	}

		if ($this->email->send()) {
			return true;
		} else {
			echo $this->email->print_debugger();
		die;
		}
	}

	public function verify(){
		$email = $this->input->get('email');
		$token = $this->input->get('token');

		$login = $this->db->get_where('login', ['email => $email'])->row_array();

		if($login) {
			$user_token = $this->db->get_where('user_token', ['token' => $token])->row_array();

			if($user_token){
				if(time() - $user_token['date_created'] < (60 * 60 * 24)){
				   $this->db->set('is_active', 1);
				   $this->db->where('email', $email);
					$this->db->update('login');

					
					$this->db->delete('user_token', ['email' => $email]);	
					$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">'. $email .' has been activated! Please login.</div>');
					return redirect('/login');
				}
				
			}else{
			   $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Account activation Failed! Wrong token. Please Login</div>');
			   return redirect('/login');
			}

		} else{
		   $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Account activation Failed! Wrong Email. Please Login</div>');
		   return redirect('/login');
		}
	}

	public function resetPassword()
	{
		$email = $this->input->get('email');
		$token = $this->input->get('token');
		$user = $this->db->get_where('login', ['email' => $email])->row_array();

		if ($user) {
			$user_token = $this->db->get_where('user_token', ['token' => $token])->row_array();

			if ($user_token) {
				$this->session->set_userdata('reset_email', $email);
				$this->changeReset();
			} else {
				$this->session->set_flashdata('flash', '<div class="alert alert-danger" role="alert">Wrong Token</div>');
				redirect('login/forgot');
			}
		} else {
			$this->session->set_flashdata('flash', '<div class="alert alert-danger" role="alert">Reset Password failed</div>');
			redirect('login/forgot');
		}
	}

	public function changeReset()
	{
		if (!$this->session->userdata('reset_email')) {
			redirect('login');
		}
		$this->form_validation->set_rules('password1', 'Password', 'trim|required|min_length[8]|matches[password2]');
		$this->form_validation->set_rules('password2', 'Repeat Password', 'trim|required|min_length[8]|matches[password1]');

		if ($this->form_validation->run() == false) {
		$data['title'] = 'Inventory - Koperasi';
		$this->load->view('templates_login/header', $data);
		$this->load->view('change-password');
		$this->load->view('templates_login/footer');
		} else {
			$password = md5($this->input->post('password1'));
			$email = $this->session->userdata('reset_email');

			$this->db->set('password', $password);
			$this->db->where('email', $email);
			$this->db->update('login');

			$this->session->unset_userdata('reset_email');

			$this->session->set_flashdata('flash', '<div class="alert alert-success" role="alert">Password has been changed ! Please LOGIN </div>');
			redirect('login');
		}
	}

	//function logout
	public function logout()
	{
		$this->session->sess_destroy();
		return redirect('/login');
	}
}
