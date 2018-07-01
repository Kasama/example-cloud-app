class CreateMedicamentos < ActiveRecord::Migration[5.2]
  def change
    create_table :medicamentos do |t|
      t.string :NU_REGISTRO
      t.decimal :CO_GGREM
      t.string :CO_EAN
      t.string :NO_PRODUTO
      t.integer :TP_PRODUTO
      t.string :TP_LCCT
      t.string :ST_REST_HOSP
      t.string :ST_CAP
      t.string :ST_CONFAZ87
      t.integer :NU_PF0_INTEIRO
      t.integer :NU_PF18_INTEIRO

      t.timestamps
    end
  end
end
