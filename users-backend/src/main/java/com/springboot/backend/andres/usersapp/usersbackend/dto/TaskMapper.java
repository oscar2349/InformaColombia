package com.springboot.backend.andres.usersapp.usersbackend.dto;

import com.springboot.backend.andres.usersapp.usersbackend.entities.Task;
import com.springboot.backend.andres.usersapp.usersbackend.entities.User;

public class TaskMapper {

    public static TaskDTO toDTO(Task task) {
        TaskDTO dto = new TaskDTO();
        dto.setId(task.getId());
        dto.setTitulo(task.getTitulo());
        dto.setDescripcion(task.getDescripcion());
        dto.setFechaCreacion(task.getFechaCreacion());
        dto.setEstado(task.getEstado().name());
        if (task.getUsuario() != null) {
            dto.setUsuarioId(task.getUsuario().getId());
            dto.setUsuarioNombre(task.getUsuario().getName() + " " + task.getUsuario().getLastname());
        }
        return dto;
    }

    public static Task toEntity(TaskDTO dto, User usuario) {
        Task task = new Task();
        task.setId(dto.getId());
        task.setTitulo(dto.getTitulo());
        task.setDescripcion(dto.getDescripcion());
        task.setEstado(Task.Estado.valueOf(dto.getEstado()));
        task.setUsuario(usuario);
        return task;
    }
}
