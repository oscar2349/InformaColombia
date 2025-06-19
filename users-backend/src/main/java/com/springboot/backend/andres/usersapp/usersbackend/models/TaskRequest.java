package com.springboot.backend.andres.usersapp.usersbackend.models;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public class TaskRequest {

    @NotBlank(message = "no puede estar vacío")
    private String titulo;

    private String descripcion;

    @NotNull(message = "no puede ser nulo")
    private TaskEstado estado;

    private Long usuarioId; // solo el ID del usuario, no el objeto completo

    // Getters y Setters
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public TaskEstado getEstado() {
        return estado;
    }

    public void setEstado(TaskEstado estado) {
        this.estado = estado;
    }

    public Long getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(Long usuarioId) {
        this.usuarioId = usuarioId;
    }

    // Enum que refleja el enum de la entidad Task
    public enum TaskEstado {
        PENDIENTE,
        EN_PROGRESO,
        COMPLETADA
    }
}
