class Content < ApplicationRecord
  belongs_to :user
  has_many :linkcontents_as_content_1, class_name: 'Linkcontent', foreign_key: 'content_1_id'
  has_many :linkcontents_as_content_2, class_name: 'Linkcontent', foreign_key: 'content_2_id'

  enum tipo: {gruppo: 0, contatto: 1,  abilità: 2,  impresa: 3, progetto: 4, attività:  5,  processo: 6,   todo:  7, post: 8, contratto: 9,  calendario: 10, evento: 11 , luogo: 12  }
  enum visibility: { privato: 0, partecipanti: 1, pubblico: 2   }
  enum stato: { nuovo: 0, to_fix: 1, to_update: 2, attivo: 3, concluso: 4 }

  validates :data, presence: true
  validates :tipo, presence: true
  validates :nome, presence: true
  validates :descrizione, presence: true

  
end
