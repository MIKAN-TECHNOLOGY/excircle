class AddAttachmentAvatarToCircles < ActiveRecord::Migration
  def self.up
    change_table :circles do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :circles, :avatar
  end
end
