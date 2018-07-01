class CreateEmpresas < ActiveRecord::Migration[5.2]
  def change
    create_table :empresas do |t|
      t.decimal :NU_CNPJ
      t.string :NO_RAZAO_SOCIAL

      t.timestamps
    end
  end
end
