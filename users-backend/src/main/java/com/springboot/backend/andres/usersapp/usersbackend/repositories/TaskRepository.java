package com.springboot.backend.andres.usersapp.usersbackend.repositories;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.springboot.backend.andres.usersapp.usersbackend.entities.Task;

import dto.Estado;

@Repository
public interface TaskRepository extends JpaRepository<Task, Integer> {

    Page<Task> findByEstado(Estado estado, Pageable pageable);

}