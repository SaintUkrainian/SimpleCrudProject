package com.github.saintukrainian.webdatabasedemo.controllers;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import com.github.saintukrainian.webdatabasedemo.entity.Instructor;
import com.github.saintukrainian.webdatabasedemo.jpaRep.InstructorRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public String addInstructorPage(@RequestParam("instructorId") Integer id, Model model) {
		Optional<Instructor> optional = rep.findById(id);
		Instructor inst = optional.get();
		model.addAttribute("instructor", inst);
		return "add-instructor";
	}

	@GetMapping("/addInstructorPage")
	public String addInstructorPage(Model model){
		model.addAttribute("instructor", new Instructor());
		return "add-instructor";
	}

	@PostMapping("/updateInstructor")
	public String updateInstructor(@ModelAttribute("instructor") Instructor instructor) {
		System.out.println(instructor.getId());
		if(instructor.getEmail().trim() == ""){
			instructor.setEmail("email is not provided");
		}
		if(instructor.getId() != 0)
			rep.save(instructor);
		else {
			instructor.setId(0);
			rep.save(instructor);
		}

		return "redirect:/";
	}

	@GetMapping("/deleteInstructor")
	public String deleteInstructor(@RequestParam("instructorId") String id){
		rep.deleteById(Integer.parseInt(id));
		return "redirect:/";
	}

}
