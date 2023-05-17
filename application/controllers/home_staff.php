<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class home_staff extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_validation');
		is_logged_in();
	}

	public function index()
	{
		$this->load->view('templates_lv1/header');
		$this->load->view('templates_lv1/sidebar');
		$this->load->view('dashboard');
		$this->load->view('templates_lv1/footer');
	}

	public function test()
	{
		$this->load->view('templates_lv1/header');
		$this->load->view('templates_lv1/sidebar');
		$this->load->view('test');
		$this->load->view('templates_lv1/footer');
	}
}
