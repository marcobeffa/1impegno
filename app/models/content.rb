class Content < ApplicationRecord
  belongs_to :user
  has_many :linkcontents_as_content_1, class_name: 'Linkcontent', foreign_key: 'content_1_id'
  has_many :linkcontents_as_content_2, class_name: 'Linkcontent', foreign_key: 'content_2_id'

  enum tipo: { attività: 0, processo: 1, contatto: 2,  abilità: 3, luogo: 4, post: 5, todo: 6, obiettivo: 7, contratto: 8, mappa: 9, impresa: 10, progetto: 11, gruppi: 12, calendario: 13, evento: 14   }
  enum visibility: { privato: 0, partecipanti: 1, pubblico: 2   }
  enum stato: { nuovo: 0, to_fix: 1, to_update: 2, attivo: 3, concluso: 4 }

  validates :data, presence: true
  validates :tipo, presence: true
  validates :nome, presence: true
  validates :descrizione, presence: true

  
end
