package com.springboot.backend.andres.usersapp.usersbackend.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.springboot.backend.andres.usersapp.usersbackend.entities.Task;
import com.springboot.backend.andres.usersapp.usersbackend.repositories.TaskRepository;
import dto.Estado;
import dto.PageResponse;
import dto.TaskDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.List;

@RestController
@RequestMapping("/api/tasks")
public class TaskController {

    @Autowired
    private TaskRepository taskRepository;

    @GetMapping
    public List<Task> listar() {
        return taskRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Task> obtener(@PathVariable Integer id) {
        return taskRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public Task crear(@RequestBody Task task) {
        return taskRepository.save(task);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Task> actualizar(@PathVariable Integer id, @RequestBody Task task) {
        return taskRepository.findById(id).map(t -> {
            t.setTitulo(task.getTitulo());
            t.setDescripcion(task.getDescripcion());
            t.setEstado(task.getEstado());
            t.setFechaCreacion(task.getFechaCreacion());
            t.setUsuario(task.getUsuario());
            return ResponseEntity.ok(taskRepository.save(t));
        }).orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable Integer id) {
        if (taskRepository.existsById(id)) {
            taskRepository.deleteById(id);
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/page/{page}")
    public PageResponse<TaskDTO> listarPaginadoDTO(@PathVariable int page,
            @RequestParam(defaultValue = "5") int size,
            @RequestParam(defaultValue = "id") String sortBy,
            @RequestParam(defaultValue = "asc") String direction) {
        Sort sort = direction.equalsIgnoreCase("desc")
                ? Sort.by(sortBy).descending()
                : Sort.by(sortBy).ascending();

        Pageable pageable = PageRequest.of(page, size, sort);
        Page<Task> tareasPage = taskRepository.findAll(pageable);

        List<TaskDTO> tareasDTO = tareasPage.getContent().stream().map(t -> {
            TaskDTO dto = new TaskDTO();
            dto.setId(t.getId());
            dto.setTitulo(t.getTitulo());
            dto.setDescripcion(t.getDescripcion());
            dto.setFechaCreacion(t.getFechaCreacion());
            dto.setEstado(t.getEstado());
            dto.setUsuarioId(t.getUsuario() != null ? t.getUsuario().getId() : null);
            return dto;
        }).toList();

        PageResponse<TaskDTO> response = new PageResponse<>();
        response.setContenido(tareasDTO);
        response.setPagina(tareasPage.getNumber());
        response.setTamanio(tareasPage.getSize());
        response.setTotalElementos(tareasPage.getTotalElements());
        response.setTotalPaginas(tareasPage.getTotalPages());
        response.setUltima(tareasPage.isLast());

        return response;
    }

    @GetMapping("/estado/{estado}/page/{page}")
    public Page<Task> listarPorEstadoPaginado(@PathVariable Estado estado,
            @PathVariable int page,
            @RequestParam(defaultValue = "5") int size) {
        Pageable pageable = PageRequest.of(page, size);
        return taskRepository.findByEstado(estado, pageable);
    }

}