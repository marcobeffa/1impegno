class Content < ApplicationRecord
  belongs_to :user
  enum tipo: { tempo: 0,  attenzione: 1,  energia: 2, contatti: 3, luogo: 4, abilità: 5  }
 
end
