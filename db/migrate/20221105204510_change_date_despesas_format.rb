class ChangeDateDespesasFormat < ActiveRecord::Migration[7.0]
  def change
    change_column :despesas, :data, :date
  end
end
