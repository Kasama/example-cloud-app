class CreateMedicos < ActiveRecord::Migration[5.2]
  def change
    create_table :medicos do |t|
      t.decimal :CPF
      t.decimal :CRM
      t.string :NOME
      t.text :ENDERECO

      t.timestamps
    end
  end
end
