class CreateEstoques < ActiveRecord::Migration[5.2]
  def change
    create_table :estoques do |t|
      t.references :medicamento, foreign_key: true
      t.integer :quantidade

      t.timestamps
    end
  end
end
