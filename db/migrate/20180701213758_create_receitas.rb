class CreateReceitas < ActiveRecord::Migration[5.2]
  def change
    create_table :receitas do |t|
      t.date :DATA
      t.text :DESCRICAO
      t.string :prontidao

      t.timestamps
    end
  end
end
