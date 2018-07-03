class CreateEmpresas < ActiveRecord::Migration[5.2]
  def change
    create_table :empresas do |t|
      t.integer :NU_CNPJ, limit: 8
      t.string :NO_RAZAO_SOCIAL

      t.timestamps
    end
  end
end
