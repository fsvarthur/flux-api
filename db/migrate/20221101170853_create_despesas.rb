class CreateDespesas < ActiveRecord::Migration[7.0]
  def change
    create_table :despesas do |t|
      t.string :descricao, limit: 100, null: false
      t.decimal :valor, null: false, precision: 10, scale: 2
      t.time :data, null: false

      t.timestamps
    end
  end
end
