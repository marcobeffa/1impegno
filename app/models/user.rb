class User < ApplicationRecord
  has_many :contents
  has_many :resources
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attr_accessor :name
  attr_accessor :time_zone
end
