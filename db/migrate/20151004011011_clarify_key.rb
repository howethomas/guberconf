class ClarifyKey < ActiveRecord::Migration
  def change
    add_column :conferences, :clarify_id, :string
  end
end
