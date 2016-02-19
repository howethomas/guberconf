class AddUrlToConf < ActiveRecord::Migration
  def change
    add_column :conferences, :recording_url, :string
  end
end
