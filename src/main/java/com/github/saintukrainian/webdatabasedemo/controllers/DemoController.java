package com.github.saintukrainian.webdatabasedemo.controllers;

import java.util.Date;
import java.util.List;

import com.github.saintukrainian.webdatabasedemo.entity.Instructor;
import com.github.saintukrainian.webdatabasedemo.jpaRep.InstructorRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DemoController {
	@Autowired
	private InstructorRepository rep;

	@GetMapping("/")
	public String homePage(Model model) {
		model.addAttribute("date", new Date());
		List<Instructor> list = rep.findByOrderByLastName();
		model.addAttribute("instructors", list);

		return "home-page";
	}

	@GetMapping("/addInstructor")
	public String addInstructorPage(Model model) {
		
		return "add-instructor";
	}

	@PostMapping("/updateInstructor")
	public String addInstructor(@RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName,
			@RequestParam("email") String email) {
		Instructor instructor = new Instructor(0, firstName, lastName, email);
		rep.save(instructor);

		return "redirect:/";
	}

	@GetMapping("/deleteInstructor")
	public String deleteInstructor(@RequestParam("instructorId") String id){
		rep.deleteById(Integer.parseInt(id));
		return "redirect:/";
	}

}
