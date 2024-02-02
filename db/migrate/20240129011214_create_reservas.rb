class CreateReservas < ActiveRecord::Migration[7.0]
  def change
    create_table :reservas do |t|
      t.references :ambiente, foreign_key: true
      t.references :condomino, foreign_key: true

      t.timestamps
    end
  end
end
