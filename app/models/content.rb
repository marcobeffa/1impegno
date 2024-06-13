class Content < ApplicationRecord
  belongs_to :user
 
  enum tipo: {evento: 0, luogo: 1,  impresa: 2, progetto: 3, attività:  4, task: 5, post: 6, gruppo: 7, contatto: 8, abilità: 9, prodotti: 10  }
  enum visibility: { privato: 0, partecipanti: 1, pubblico: 2   }
  enum stato: { nuovo: 0, to_fix: 1, to_update: 2, attivo: 3, concluso: 4 }

  validates :data, presence: true
  validates :tipo, presence: true
  validates :nome, presence: true
  validates :descrizione, presence: true

  
end
