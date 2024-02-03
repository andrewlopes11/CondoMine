class Reserva < ApplicationRecord
  belongs_to :ambiente
  belongs_to :condomino

  enum status: { reservado: 'Reservado', nao_reservado: 'Não Reservado'}

  validates :data_ini, presence: { message: "A data de início deve ser fornecida" }
  validates :data_fim, presence: { message: "A data de término deve ser fornecida" }

  validate :data_ini_deve_ser_anterior_a_data_fim
  validate :verificar_disponibilidade_do_ambiente

  private

  def data_ini_deve_ser_anterior_a_data_fim
    if data_ini.present? && data_fim.present? && data_ini >= data_fim
      errors.add(:data_ini, "A data de início deve ser anterior à data de término")
    end
  end

  def verificar_disponibilidade_do_ambiente
    return unless data_ini.present? && data_fim.present?

    Reserva.where(ambiente_id: ambiente_id).where.not(id: id).find_each do |reserva_existente|
      # Verifica se a nova reserva se sobrepõe a uma reserva existente
      if reserva_existente.data_ini <= data_fim && reserva_existente.data_fim >= data_ini
        errors.add(:base, "O ambiente já está reservado para as datas selecionadas")
        break # Sai do loop assim que uma sobreposição é encontrada
      end
    end
  end
end
