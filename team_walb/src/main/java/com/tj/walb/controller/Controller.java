package com.tj.walb.controller;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.stereotype.Controller;

import com.tj.walb.model.Phone;
import com.tj.walb.service.Services;

@Controller
public class Controller {
	@Autowired
	private Services sv;
	
	@RequestMapping(value="Insert", method=RequestMethod.POST)
	public String Main(Phone phone, Model model, String tTime) {
		phone.setTime(Timestamp.valueOf(tTime+" 00:00:00")); // Timestamp change
		try {
			sv.insert(phone);
			model.addAttribute("result", "success");
		} catch (Exception e) {
			model.addAttribute("result", "fail");
		}
		return "temp/form";
	}
}
