class Content < ApplicationRecord
  belongs_to :user
  has_many :linkcontents_as_content_1, class_name: 'Linkcontent', foreign_key: 'content_1_id'
  has_many :linkcontents_as_content_2, class_name: 'Linkcontent', foreign_key: 'content_2_id'

  enum tipo: {evento: 0, luogo: 1,  impresa: 2, progetto: 3, attività:  4, task: 5, gruppo: 6, contatto: 7, abilità: 8  }
  enum visibility: { privato: 0, partecipanti: 1, pubblico: 2   }
  enum stato: { nuovo: 0, to_fix: 1, to_update: 2, attivo: 3, concluso: 4 }

  validates :data, presence: true
  validates :tipo, presence: true
  validates :nome, presence: true
  validates :descrizione, presence: true

  
end
