class Linkcontent < ApplicationRecord
  belongs_to :user
  belongs_to :content_1, class_name: 'Content'
  belongs_to :content_2, class_name: 'Content'
end
