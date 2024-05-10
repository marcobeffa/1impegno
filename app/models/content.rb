class Content < ApplicationRecord
  belongs_to :user
  enum tipo: { attività: 0, processi: 1, contatti: 2,  abilità: 3, luogo: 4, post: 5, todo: 6, obiettivo: 7, contratti: 8, mappe: 9, gruppi: 10, imprese: 11, settimane: 12, progetti: 13, data: 14  }
  enum visibility: { privato: 0, gruppo: 1, pubblico: 2   }
  enum stato: { nuovi: 0, to_fix: 1, to_update: 2, attivi: 3, conclusi: 4 }

  validates :data, presence: true
end
