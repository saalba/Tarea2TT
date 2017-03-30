class Usuario < ApplicationRecord
  validates :nombre, presence: true
  validates :user, presence: true
end
