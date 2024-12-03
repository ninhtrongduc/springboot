package com.j5.controller;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.j5.service.MailerService;

@Controller
public class MailerController {
	@Autowired
	MailerService mailer;

@ResponseBody
@RequestMapping("/mailer/demo1")
public String demo1(Model model) {
	try {
		mailer.send("nghiemn@fpt.edu.vn", "Subject", "Body");
		return "OK";
	} catch (MessagingException e) {
		return e.getMessage();
	}
}
}

