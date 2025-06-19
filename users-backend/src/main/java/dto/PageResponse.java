package dto;

import java.util.List;

public class PageResponse<T> {
    private List<T> contenido;
    private int pagina;
    private int tamanio;
    private long totalElementos;
    private int totalPaginas;
    private boolean ultima;
    public List<T> getContenido() {
        return contenido;
    }
    public void setContenido(List<T> contenido) {
        this.contenido = contenido;
    }
    public int getPagina() {
        return pagina;
    }
    public void setPagina(int pagina) {
        this.pagina = pagina;
    }
    public int getTamanio() {
        return tamanio;
    }
    public void setTamanio(int tamanio) {
        this.tamanio = tamanio;
    }
    public long getTotalElementos() {
        return totalElementos;
    }
    public void setTotalElementos(long totalElementos) {
        this.totalElementos = totalElementos;
    }
    public int getTotalPaginas() {
        return totalPaginas;
    }
    public void setTotalPaginas(int totalPaginas) {
        this.totalPaginas = totalPaginas;
    }
    public boolean isUltima() {
        return ultima;
    }
    public void setUltima(boolean ultima) {
        this.ultima = ultima;
    }
}
