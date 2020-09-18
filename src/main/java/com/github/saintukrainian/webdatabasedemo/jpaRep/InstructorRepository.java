package com.github.saintukrainian.webdatabasedemo.jpaRep;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.github.saintukrainian.webdatabasedemo.entity.Instructor;

public interface InstructorRepository extends JpaRepository<Instructor, Integer> {

    public List<Instructor> findAllByFirstName(String firstName);

    public List<Instructor> findByOrderByLastName();

}
