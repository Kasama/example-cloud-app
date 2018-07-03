class CreateMedicos < ActiveRecord::Migration[5.2]
  def change
    create_table :medicos do |t|
      t.integer :CPF, limit: 12
      t.integer :CRM, limit: 12
      t.string :NOME
      t.text :ENDERECO

      t.timestamps
    end
  end
end
