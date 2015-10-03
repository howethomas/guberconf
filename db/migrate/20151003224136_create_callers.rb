class CreateCallers < ActiveRecord::Migration
  def change
    create_table :callers do |t|
      t.string :number
      t.string :name
      t.string :email
      t.boolean :wants_transcript

      t.timestamps null: false
    end
  end
end
