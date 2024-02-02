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

    # Verifica se existe alguma reserva que conflite com o intervalo de datas da nova reserva
    sobreposicao = Reserva.where(ambiente_id: ambiente_id)
                          .where.not(id: id)
                          .where.not('data_ini > :nova_data_fim OR data_fim < :nova_data_ini', nova_data_ini: data_ini, nova_data_fim: data_fim)
                          .exists?

    if sobreposicao
      errors.add(:base, "O ambiente já está reservado para as datas selecionadas")
    end
  end
end
