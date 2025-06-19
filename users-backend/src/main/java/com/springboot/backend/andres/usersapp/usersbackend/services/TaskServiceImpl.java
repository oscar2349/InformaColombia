package com.springboot.backend.andres.usersapp.usersbackend.services;

import com.springboot.backend.andres.usersapp.usersbackend.entities.Task;
import com.springboot.backend.andres.usersapp.usersbackend.entities.User;
import com.springboot.backend.andres.usersapp.usersbackend.models.TaskRequest;
import com.springboot.backend.andres.usersapp.usersbackend.models.TaskRequest.TaskEstado;
import com.springboot.backend.andres.usersapp.usersbackend.repositories.TaskRepository;
import com.springboot.backend.andres.usersapp.usersbackend.repositories.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskRepository taskRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public List<Task> findAll() {
        List<Task> tasks = new ArrayList<>();
        taskRepository.findAll().forEach(tasks::add);
        return tasks;
    }

    @Override
    public Page<Task> findAll(Pageable pageable) {
        return taskRepository.findAll(pageable);
    }

    @Override
    public Optional<Task> findById(@NonNull Long id) {
        return taskRepository.findById(id);
    }

    @Override
    public Task save(Task task) {
        return taskRepository.save(task);
    }

    @Override
    public Optional<Task> update(TaskRequest request, Long id) {
        Optional<Task> taskOpt = taskRepository.findById(id);
        if (taskOpt.isEmpty()) {
            return Optional.empty();
        }

        Task task = taskOpt.get();
        task.setTitulo(request.getTitulo());
        task.setDescripcion(request.getDescripcion());
        task.setEstado(mapEstado(request.getEstado()));

        if (request.getUsuarioId() != null) {
            Optional<User> userOpt = userRepository.findById(request.getUsuarioId());
            userOpt.ifPresent(task::setUsuario);
        } else {
            task.setUsuario(null);
        }

        return Optional.of(taskRepository.save(task));
    }

    @Override
    public void deleteById(Long id) {
        taskRepository.deleteById(id);
    }

    private Task.Estado mapEstado(TaskEstado estadoDTO) {
        return switch (estadoDTO) {
            case PENDIENTE -> Task.Estado.PENDIENTE;
            case EN_PROGRESO -> Task.Estado.EN_PROGRESO;
            case COMPLETADA -> Task.Estado.COMPLETADA;
        };
    }

    @Override
    public List<Task> findByEstado(Task.Estado estado) {
        return taskRepository.findByEstado(estado);
    }

    @Override
    public List<Task> findByUsuarioId(Long userId) {
        return taskRepository.findByUsuario_Id(userId);
    }

}
