class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :name
      t.string :pin

      t.timestamps null: false
    end
  end
end
