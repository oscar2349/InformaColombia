export class PageResponse<T> {
  contenido: T[];
  pagina: number;
  tamanio: number;
  totalElementos: number;
  totalPaginas: number;
  ultima: boolean;

  constructor(
    contenido: T[] = [],
    pagina: number = 0,
    tamanio: number = 0,
    totalElementos: number = 0,
    totalPaginas: number = 0,
    ultima: boolean = false
  ) {
    this.contenido = contenido;
    this.pagina = pagina;
    this.tamanio = tamanio;
    this.totalElementos = totalElementos;
    this.totalPaginas = totalPaginas;
    this.ultima = ultima;
  }
}
