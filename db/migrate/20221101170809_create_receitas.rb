class CreateReceitas < ActiveRecord::Migration[7.0]
  def change
    create_table :receitas do |t|
      t.string :descricao, limit: 100, null: false
      t.decimal :valor, precision: 10, scale: 2, null: false
      t.time :data, null: false

      t.timestamps
    end
  end
end
