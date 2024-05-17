
import { Controller } from "@hotwired/stimulus";

  export default class extends Controller {
  connect() {
    const alert = this.element;
    if (alert) {
      setTimeout(() => {
        alert.style.opacity = "0";
        setTimeout(() => {
          alert.style.display = "none";
        }, 300); // Tempo da transição em milissegundos
      }, 3000); // Tempo de exibição do alerta em milissegundos
    }
  }
}

