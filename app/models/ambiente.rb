class Ambiente < ApplicationRecord
  has_many :reservas

  validates :nome, presence: true
  validates :tipo, presence: true
end
