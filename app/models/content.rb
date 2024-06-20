class Content < ApplicationRecord
  belongs_to :user
 
  enum tipo: { evento: 0,  impresa: 1, progetto: 2, attività:  3, task: 4, post: 5, abilità: 6, servizio: 7, prodotti: 8  }
  enum visibility: { privato: 0, partecipanti: 1, pubblico: 2   }
  enum stato: { nuovo: 0, to_fix: 1, to_update: 2, attivo: 3, concluso: 4 }

  validates :data, presence: true
  validates :tipo, presence: true
  validates :nome, presence: true
  validates :descrizione, presence: true

  
end
