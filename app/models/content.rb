class Content < ApplicationRecord
  belongs_to :user
  belongs_to :parent, class_name: 'Content', optional: true
  has_many :children, class_name: 'Content', foreign_key: 'parent_id'
 
  enum tipo: {nota: 0, evento: 1, valore: 2, contatto: 3, luogo: 4  } # scambio da aggiungere tra gruppo e singolo o tra gruppo e gruppo o tra singolo o singolo.
  enum visibility: { privato: 0, partecipanti: 1, pubblico: 2   }
  enum stato: { nuovo: 0, to_fix: 1, to_update: 2, attivo: 3, concluso: 4 }

  validates :data, presence: true
  validates :tipo, presence: true
  validates :nome, presence: true
  validates :descrizione, presence: true


  
  # Recupera tutti i parenti fino alla radice
  def self_and_ancestors
    node, nodes = self, []
    while node
      nodes << node
      node = node.parent
    end
    nodes.reverse
  end

  # Recupera la struttura ad albero partendo da un nodo specifico
  def self_and_descendants
    { content: self, children: children.map(&:self_and_descendants) }
  end
  def nome_completo
    "#{nome} |#{data.strftime('%d/%m/%y - %H:%M')}|"
  end
  
end
