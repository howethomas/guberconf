class AttachRecording < ActiveRecord::Migration
  def change
    add_attachment :conferences, :recording
  end
end
