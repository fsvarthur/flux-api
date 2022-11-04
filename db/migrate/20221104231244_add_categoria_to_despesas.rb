class AddCategoriaToDespesas < ActiveRecord::Migration[7.0]
  def change
    add_column :despesas, :categoria, :string, default: 'non-defined'
  end
end
