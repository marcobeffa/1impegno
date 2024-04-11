class Content < ApplicationRecord
  belongs_to :user
  enum tipo: { eventi: 0,  attenzione: 1,  energia: 2, contatti: 3, luogo: 4, abilità: 5  }
  enum visibility: { privato: 0, gruppo: 1, pubblico: 2   }
 
end
