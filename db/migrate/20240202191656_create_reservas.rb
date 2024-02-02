class CreateReservas < ActiveRecord::Migration[7.0]
  def change
    create_table :reservas do |t|
      t.date :data_ini
      t.date :data_fim
      t.string :status

      t.references :condomino, null: false, foreign_keys: true
      t.references :ambiente, null: false, foreign_keys: true

      t.timestamps
    end
  end
end
