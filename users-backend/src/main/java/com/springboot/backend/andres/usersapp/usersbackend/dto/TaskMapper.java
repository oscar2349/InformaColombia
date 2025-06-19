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

        User usuario = task.getUsuario();
        if (usuario != null) {
            dto.setUsuarioId(usuario.getId());

            try {
                // Previene LazyInitializationException
                dto.setUsuarioNombre(usuario.getName());
            } catch (Exception e) {
                dto.setUsuarioNombre(null);
            }
        }

        return dto;
    }

    public static Task toEntity(TaskDTO dto, User usuario) {
        Task task = new Task();
        task.setId(dto.getId());
        task.setTitulo(dto.getTitulo());
        task.setDescripcion(dto.getDescripcion());
        task.setFechaCreacion(dto.getFechaCreacion());

        if (dto.getEstado() != null) {
            task.setEstado(Task.Estado.valueOf(dto.getEstado().toUpperCase()));
        } else {
            task.setEstado(Task.Estado.PENDIENTE);
        }

        task.setUsuario(usuario);
        return task;
    }
}
