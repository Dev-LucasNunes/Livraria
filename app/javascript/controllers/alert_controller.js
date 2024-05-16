import Swal from 'sweetalert2';
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="alert"
export default class extends Controller {
  static values = {title: String}
  connect() {
    this.redirect = false;
  }

  showAlert(event) {
    if (this.redirect) return;
    event.stopImmediatePropagation();
    event.preventDefault();
    const swalWithBootstrapButtons = Swal.mixin({
      customClass: {
        cancelButton: "rounded-lg ml-2 py-3 px-5 bg-red-600 text-white block font-medium",
        confirmButton: "rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium"
      },
      buttonsStyling: false
    });
    swalWithBootstrapButtons.fire({
      title: this.titleValue,
      text: "Essa ação não poderá ser revertida!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonText: "Sim",
      cancelButtonText: "Não!",
      reverseButtons: false
    }).then((result) => {
      if (result.isConfirmed) {
        this.redirect = true;
        this.element.click();
      }
    });
  }
}
