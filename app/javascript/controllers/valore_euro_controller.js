import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dashInput", "euroSpan"];

  connect() {
    this.updateValoreEuro();
  }

  updateValoreEuro() {
    const valoreDashInput = this.dashInputTarget;
    const valoreEuroSpan = this.euroSpanTarget;

    if (!valoreDashInput || !valoreEuroSpan) {
      console.error('Uno degli elementi non esiste.');
      return;
    }

    if (valoreDashInput.value.trim() === '') {
      valoreEuroSpan.textContent = '';
      return; // Esce dalla funzione
    }

    if (!isNaN(valoreDashInput.value)) {
      fetch('https://api.coingecko.com/api/v3/simple/price?ids=dash&vs_currencies=eur')
        .then(response => response.json())
        .then(data => {
          const exchangeRate = data.dash.eur;
          const valoreDash = parseFloat(valoreDashInput.value);
          const valoreEuro = valoreDash * exchangeRate;

          valoreEuroSpan.textContent = valoreEuro.toFixed(2) + " €";
        })
        .catch(error => {
          console.error('Si è verificato un errore durante il recupero del prezzo di Dash in Euro:', error);
        });
    } else {
      valoreEuroSpan.textContent = '';
    }
  }
}