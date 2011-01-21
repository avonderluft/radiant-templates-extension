class AddTimestamps < ActiveRecord::Migration

  def self.up
    [:templates, :part_types].each do |table|
      change_table(table) do |t|
        t.timestamps
      end
    end
  end
  
  def self.down
    [:templates, :part_types].each do |table|
      change_table(table) do |t|
        t.remove_timestamps
      end
    end
  end

end