class Content < ApplicationRecord
  belongs_to :user
  enum tipo: { attività: 0, processo: 1, contatto: 2,  abilità: 3, luogo: 4, post: 5, todo: 6, obiettivo: 7, contratto: 8, mappe: 9, imprese: 10, progetto: 11, gruppi: 12, calendario: 13  }
  enum visibility: { privato: 0, partecipanti: 1, pubblico: 2   }
  enum stato: { nuovi: 0, to_fix: 1, to_update: 2, attivi: 3, conclusi: 4 }

  validates :data, presence: true
end
