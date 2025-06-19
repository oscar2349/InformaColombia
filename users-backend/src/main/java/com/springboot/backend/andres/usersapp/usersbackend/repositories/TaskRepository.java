package com.springboot.backend.andres.usersapp.usersbackend.repositories;

import com.springboot.backend.andres.usersapp.usersbackend.entities.Task;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TaskRepository extends CrudRepository<Task, Long> {

    Page<Task> findAll(Pageable pageable);

    List<Task> findByEstado(Task.Estado estado);

    List<Task> findByUsuario_Id(Long userId);
}
