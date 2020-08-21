package com.github.saintukrainian.webdatabasedemo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.saintukrainian.webdatabasedemo.entity.Instructor;
import com.github.saintukrainian.webdatabasedemo.jpaRep.InstructorRepository;

@RestController
public class DemoRestController {
	@Autowired
	private InstructorRepository rep;
	
	@ExceptionHandler
	public String handleErr(IllegalArgumentException exc) {
		
		 return "Couldn't find them, sry :(";
	}
	
	@GetMapping("/instructor")
	public Instructor getInstructor(@RequestParam("firstName") String firstName) {
		Instructor inst = rep.findByFirstName(firstName);
		
		if(firstName.trim() == "" || inst == null)
			throw new IllegalArgumentException();
		
		return inst;
	}
	
	@GetMapping("/instructors")
	public List<Instructor> getList(){
		List<Instructor> list = rep.findAll();
		return list;
	}

	@PostMapping("/instructors")
	public Instructor addInstructor(@RequestBody Instructor instructor){
		instructor.setId(0);
		rep.save(instructor);
		return instructor;
	}

	@PutMapping("/instructors")
	public Instructor updateInstructor(@RequestBody Instructor instructor){
		rep.save(instructor);
		return instructor;
	}

	@DeleteMapping("/instructors/{id}")
	public String deleteInstructor(@PathVariable Integer id){
		rep.deleteById(id);

		return "Instructor with id=" + id + " has been successfully deleted";
	}

}
