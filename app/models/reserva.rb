class Reserva < ApplicationRecord
  belongs_to :ambiente
  belongs_to :condomino
  validates :data_ini, presence:true
  validates :data_fim, presence:true
  validates :condomino_id, presence:true, uniqueness:true, numericality: { only_integer: true }
  validates :ambiente_id, presence:true, uniqueness:true, numericality: { only_integer: true }
  validates :status, presence:true

end
