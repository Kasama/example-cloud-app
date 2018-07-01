class CreateSecretarias < ActiveRecord::Migration[5.2]
  def change
    create_table :secretarias do |t|
      t.string :ESTADO
      t.string :MUNICIPIO

      t.timestamps
    end
  end
end
