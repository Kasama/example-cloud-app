class CreatePacientes < ActiveRecord::Migration[5.2]
  def change
    create_table :pacientes do |t|
      t.decimal :CPF
      t.string :NOME
      t.text :ENDERECO

      t.timestamps
    end
  end
end