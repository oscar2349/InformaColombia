package com.springboot.backend.andres.usersapp.usersbackend.services;

import com.springboot.backend.andres.usersapp.usersbackend.entities.Task;
import com.springboot.backend.andres.usersapp.usersbackend.models.TaskRequest;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.lang.NonNull;

import java.util.List;
import java.util.Optional;

public interface TaskService {

    List<Task> findAll();

    Page<Task> findAll(Pageable pageable);

    Optional<Task> findById(@NonNull Long id);

    Task save(Task user);

    Optional<Task> update(TaskRequest task, Long id);

    void deleteById(Long id);

    List<Task> findByEstado(Task.Estado estado);

    List<Task> findByUsuarioId(Long userId);
}
