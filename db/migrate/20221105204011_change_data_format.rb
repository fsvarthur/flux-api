class ChangeDataFormat < ActiveRecord::Migration[7.0]
  def change
    change_column :receitas, :data, :date
  end
end
