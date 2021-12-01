import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="confirmation"
export default class extends Controller {
  static values = { confirmMessage: String };

  confirm(event) {
    if (!(window.confirm(this.confirmMessageValue))) {
      event.preventDefault();
      event.stopImmediatePropagation();
    };
  };
}