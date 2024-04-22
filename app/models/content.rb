class Content < ApplicationRecord
  belongs_to :user
  enum tipo: { attività: 0, processi: 1, contatti: 2, ruoli: 2, abilità: 3, luogo: 4, post: 5 }
  enum visibility: { privato: 0, gruppo: 1, pubblico: 2   }
 

  validates :data, presence: true
end
