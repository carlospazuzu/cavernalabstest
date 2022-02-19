class CreateCcVerifications < ActiveRecord::Migration[6.1]
  def change
    create_table :cc_verifications do |t|
      t.string :cards_file

      t.timestamps
    end
  end
end
