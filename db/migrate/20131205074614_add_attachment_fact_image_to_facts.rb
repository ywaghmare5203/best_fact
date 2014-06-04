class AddAttachmentFactImageToFacts < ActiveRecord::Migration
  def self.up
    change_table :facts do |t|
      t.attachment :fact_image
    end
  end

  def self.down
    drop_attached_file :facts, :fact_image
  end
end
