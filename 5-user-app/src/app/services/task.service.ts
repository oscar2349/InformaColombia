import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Task } from '../models/tasks';
import { Observable } from 'rxjs';
import { PageResponse } from './../models/PageResponse';

@Injectable({ providedIn: 'root' })
export class TaskService {
  private baseUrl = 'http://localhost:8080/api/tasks';

  constructor(private http: HttpClient) {}

  getTasksPage(
    page: number,
    size: number,
    sortBy: string = 'id',
    direction: string = 'asc',
    estado?: string,
    usuarioId?: number
  ): Observable<PageResponse<Task>> {
    let params = new HttpParams()
      .set('size', size)
      .set('sortBy', sortBy)
      .set('direction', direction);

    if (estado) params = params.set('estado', estado);
    if (usuarioId != null) params = params.set('usuarioId', usuarioId);

    return this.http.get<PageResponse<Task>>(`${this.baseUrl}/filtrar/page/${page}`, { params });
  }
}
