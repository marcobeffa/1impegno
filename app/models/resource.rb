class Resource < ApplicationRecord
  belongs_to :user
  enum tipo: { attività: 0, compiti: 1, contatti: 2, luogo: 2, abilità: 3, ruoli: 4  }
  enum visibility: { privato: 0, gruppo: 1, pubblico: 2   }
 

  validates :data, presence: true
end
