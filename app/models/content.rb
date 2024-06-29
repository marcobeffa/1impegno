class Content < ApplicationRecord
  belongs_to :user
 
  enum tipo: { evento: 0, attività:  1, task: 2, post: 3,  servizio: 4, prodotti: 5  }
  enum visibility: { privato: 0, partecipanti: 1, pubblico: 2   }
  enum stato: { nuovo: 0, to_fix: 1, to_update: 2, attivo: 3, concluso: 4 }

  validates :data, presence: true
  validates :tipo, presence: true
  validates :nome, presence: true
  validates :descrizione, presence: true

  
end
