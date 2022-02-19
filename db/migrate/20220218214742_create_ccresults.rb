class CreateCcresults < ActiveRecord::Migration[6.1]
  def change
    create_table :ccresults do |t|
      t.string :creditcard
      t.string :result
      t.string :explanation

      t.timestamps
    end
  end
end
