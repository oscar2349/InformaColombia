import { Component, EventEmitter, OnInit } from '@angular/core';
import { User } from '../../models/user';
import { ActivatedRoute, Router, RouterModule } from '@angular/router';
import { UserService } from '../../services/user.service';
import { SharingDataService } from '../../services/sharing-data.service';
import { PaginatorComponent } from '../paginator/paginator.component';
import { Task } from '../../models/tasks';
import { TaskService } from '../../services/task.service';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';


@Component({
  selector: 'user',
  standalone: true,
  imports: [RouterModule, PaginatorComponent,FormsModule,CommonModule],
  templateUrl: './tasks.component.html'
})
export class TaskComponent implements OnInit {
  tasks: Task[] = [];
  currentPage = 0;
  totalPages = 0;
  pageSize = 5;
  estadoFiltro = '';
  usuarioIdFiltro?: number;

  constructor(private taskService: TaskService) {}

  ngOnInit(): void {
    this.cargarTareas();
  }

  cargarTareas(): void {
    this.taskService
      .getTasksPage(this.currentPage, this.pageSize, 'fechaCreacion', 'desc', this.estadoFiltro, this.usuarioIdFiltro)
      .subscribe({
        next: (res) => {
          this.tasks = res.contenido;
          this.totalPages = res.totalPaginas;
        },
        error: (err) => console.error('Error cargando tareas:', err)
      });
  }

  cambiarPagina(pagina: number): void {
    this.currentPage = pagina;
    this.cargarTareas();
  }

  aplicarFiltros(): void {
    this.currentPage = 0;
    this.cargarTareas();
  }

  limpiarFiltros(): void {
    this.estadoFiltro = '';
    this.usuarioIdFiltro = undefined;
    this.aplicarFiltros();
  }
}