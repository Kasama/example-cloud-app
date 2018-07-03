class CreateFarmaceuticos < ActiveRecord::Migration[5.2]
  def change
    create_table :farmaceuticos do |t|
      t.integer :CPF, limit: 8
      t.string :NOME
      t.text :ENDERECO

      t.timestamps
    end
  end
end
