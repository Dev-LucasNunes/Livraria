import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="footer"
export default class extends Controller {
  connect() {
    this.updateFooterPosition();
    window.addEventListener("resize", () => this.updateFooterPosition());
  }

  disconnect() {
    window.removeEventListener("resize", this.updateFooterPosition);
  }

  updateFooterPosition() {
    const mainContent = document.getElementById("mainContent");
    const footer = document.getElementById("footer");
    const windowHeight = window.innerHeight;

    if (mainContent.offsetHeight < windowHeight) {
      footer.style.position = "fixed";
      footer.style.bottom = "0";
      console.log("sim")
    } else {
      footer.classList.remove("fixed");
      console.log("não")
    }
  }
}
