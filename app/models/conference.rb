class Conference < ActiveRecord::Base
  has_attached_file :recording
  do_not_validate_attachment_file_type :recording
  has_many :callers
end
