class CreateSubstancias < ActiveRecord::Migration[5.2]
  def change
    create_table :substancias do |t|
      t.string :DS_CAS
      t.string :DS_SUBSTANCIA

      t.timestamps
    end
  end
end
