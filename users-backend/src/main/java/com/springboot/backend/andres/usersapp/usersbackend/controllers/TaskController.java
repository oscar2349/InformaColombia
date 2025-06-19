package com.springboot.backend.andres.usersapp.usersbackend.controllers;

import com.springboot.backend.andres.usersapp.usersbackend.dto.TaskDTO;
import com.springboot.backend.andres.usersapp.usersbackend.dto.TaskMapper;
import com.springboot.backend.andres.usersapp.usersbackend.entities.Task;
import com.springboot.backend.andres.usersapp.usersbackend.entities.User;
import com.springboot.backend.andres.usersapp.usersbackend.services.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

@RestController
@RequestMapping("/api/tasks")
public class TaskController {

    @Autowired
    private TaskService taskService;

    // GET /api/tasks - Obtener todas las tareas
    @GetMapping
    public List<TaskDTO> getAllTasks() {
        return taskService.findAll()
                .stream()
                .map(TaskMapper::toDTO)
                .collect(Collectors.toList());
    }

    // GET /api/tasks/{id} - Obtener una tarea por ID
    @GetMapping("/{id}")
    public ResponseEntity<TaskDTO> getTaskById(@PathVariable Long id) {
        Optional<Task> optionalTask = taskService.findById(id);
        return optionalTask
                .map(task -> ResponseEntity.ok(TaskMapper.toDTO(task)))
                .orElse(ResponseEntity.notFound().build());
    }

    // POST /api/tasks - Crear una nueva tarea
    @PostMapping
    public ResponseEntity<TaskDTO> createTask(@RequestBody TaskDTO dto) {
        Task task = TaskMapper.toEntity(dto, buildUserFromId(dto.getUsuarioId()));
        Task saved = taskService.save(task);
        return ResponseEntity.ok(TaskMapper.toDTO(saved));
    }

    // PUT /api/tasks/{id} - Actualizar una tarea existente
    @PutMapping("/{id}")
    public ResponseEntity<TaskDTO> updateTask(@PathVariable Long id, @RequestBody TaskDTO dto) {
        Optional<Task> optionalTask = taskService.findById(id);
        if (optionalTask.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        Task existing = optionalTask.get();
        existing.setTitulo(dto.getTitulo());
        existing.setDescripcion(dto.getDescripcion());
        existing.setEstado(Task.Estado.valueOf(dto.getEstado()));
        existing.setUsuario(buildUserFromId(dto.getUsuarioId()));

        Task updated = taskService.save(existing);
        return ResponseEntity.ok(TaskMapper.toDTO(updated));
    }

    // DELETE /api/tasks/{id} - Eliminar una tarea por ID
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteTask(@PathVariable Long id) {
        if (taskService.findById(id).isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        taskService.deleteById(id);
        return ResponseEntity.noContent().build();
    }

    // Método auxiliar para construir un User con solo el ID
    private User buildUserFromId(Long id) {
        if (id == null)
            return null;
        User user = new User();
        user.setId(id);
        return user;
    }

    // GET /api/tasks?estado=PENDIENTE - Filtrar tareas por estado
    @GetMapping(params = "estado")
    public ResponseEntity<List<TaskDTO>> getTasksByEstado(@RequestParam String estado) {
        try {
            Task.Estado enumEstado = Task.Estado.valueOf(estado.toUpperCase());
            List<TaskDTO> result = taskService.findByEstado(enumEstado)
                    .stream()
                    .map(TaskMapper::toDTO)
                    .collect(Collectors.toList());
            return ResponseEntity.ok(result);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().build(); // Estado inválido
        }
    }

    // GET /api/tasks/user/5 - Filtrar tareas por ID de usuario
    @GetMapping("/user/{userId}")
    public ResponseEntity<List<TaskDTO>> getTasksByUsuarioId(@PathVariable Long userId) {
        List<TaskDTO> result = taskService.findByUsuarioId(userId)
                .stream()
                .map(TaskMapper::toDTO)
                .collect(Collectors.toList());
        return ResponseEntity.ok(result);
    }

    @GetMapping("/page/{page}")
    public ResponseEntity<Page<Task>> getTasksPage(@PathVariable int page,
            @RequestParam(defaultValue = "10") int size) {
        Pageable pageable = PageRequest.of(page, size);
        Page<Task> tasks = taskService.findAll(pageable);
        return ResponseEntity.ok(tasks);
    }

}
