// Nel tuo file JavaScript Stimulus

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    // Ottieni la data dall'attributo data-content-data
    const currentDate = this.element.getAttribute("data-content-data");

    // Costruisci l'ID dell'elemento del giorno corrispondente
    const todayElementId = 'day-' + currentDate;

    // Stampare l'ID che il controller cerca di trovare nel console log
    console.log("ID cercato:", currentDate);

    // Trova l'elemento del giorno corrispondente
    const todayElement = document.getElementById(todayElementId);

    // Altezza del banner sticky
    const bannerHeight = document.getElementById('sticky-banner').offsetHeight;

    // Se l'elemento specificato non è stato trovato
    if (!todayElement) {
      const elements = document.querySelectorAll('[id^="day-"]');
      let closestElement = null;
      let closestDiff = Infinity;

      // Itera attraverso gli elementi per trovare l'elemento più vicino alla data
      elements.forEach(function(element) {
        const elementId = element.id.substring(4); // Rimuovi il prefisso 'day-'
        const elementDate = new Date(elementId);
        const diff = Math.abs(new Date(currentDate) - elementDate);

        // Se l'elemento è più vicino alla data e il più vicino trovato finora
        if (diff < closestDiff) {
          closestDiff = diff;
          closestElement = element;
        }
      });

      if (closestElement) {
        // Scorri fino all'elemento più vicino, considerando lo spazio sopra al banner sticky
        window.scrollTo({ top: closestElement.offsetTop - bannerHeight, behavior: 'smooth' });
      }
    } else {
      // Se l'elemento specificato è stato trovato, scorri fino ad esso, considerando lo spazio sopra al banner sticky
      window.scrollTo({ top: todayElement.offsetTop - bannerHeight, behavior: 'smooth' });
    }
  }
}
