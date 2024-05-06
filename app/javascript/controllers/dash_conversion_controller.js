// app/javascript/controllers/dash_conversion_controller.js
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["costoField", "valoreEuro", "ricavoField", "valoreEuroRicavo"];

  connect() {
    this.initializeValues();
    this.costoFieldTarget.addEventListener("input", this.calculateEuroValue.bind(this, "costo"));
    this.ricavoFieldTarget.addEventListener("input", this.calculateEuroValue.bind(this, "ricavo"));
  }

  initializeValues() {
    this.eurValue = this.data.get("eurValue");
    this.updateEuroValues();
  }

  calculateEuroValue(type) {
    const field = type === "costo" ? this.costoFieldTarget : this.ricavoFieldTarget;
    const valoreEuroSpan = type === "costo" ? this.valoreEuroTarget : this.valoreEuroRicavoTarget;

    const fieldValue = parseFloat(field.value);
    if (!isNaN(fieldValue)) {
      const valoreEuro = (fieldValue * this.eurValue).toFixed(2);
      valoreEuroSpan.textContent = valoreEuro;
    } else {
      valoreEuroSpan.textContent = "";
    }
  }

  updateEuroValues() {
    this.valoreEuroTarget.textContent = this.calculateEuroValue("costo");
    this.valoreEuroRicavoTarget.textContent = this.calculateEuroValue("ricavo");
  }
}
