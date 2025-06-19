export class Task {
  id: number;
  titulo: string;
  descripcion: string;
  fechaCreacion: string;
  estado: 'PENDIENTE' | 'EN_PROGRESO' | 'COMPLETADA';
  usuarioId: number | null;

  constructor(
    id: number,
    titulo: string,
    descripcion: string,
    fechaCreacion: string,
    estado: 'PENDIENTE' | 'EN_PROGRESO' | 'COMPLETADA',
    usuarioId: number | null
  ) {
    this.id = id;
    this.titulo = titulo;
    this.descripcion = descripcion;
    this.fechaCreacion = fechaCreacion;
    this.estado = estado;
    this.usuarioId = usuarioId;
  }
}
