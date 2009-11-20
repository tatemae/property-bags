class CreateBagProperties < ActiveRecord::Migration
  def self.up
    create_table :bag_properties, :force => true do |t|
      t.integer "bag_id",                :default => 1
      t.string  "name"
      t.string  "label"
      t.integer "data_type",             :default => 1
      t.string  "display_type",          :default => "text"
      t.boolean "required",              :default => false
      t.string  "default_value"
      t.integer "default_visibility",    :default => 4
      t.boolean "can_change_visibility", :default => true
      t.integer "sort",                  :default => 1
      t.integer "width",                 :default => -1
      t.integer "height",                :default => -1
      t.string  "sf_field"
      t.boolean "is_link",               :default => false
      t.string  "prefix"
      t.string  "css_class"
      t.integer "maxlength",             :default => 5000
    end

    create_table :bag_property_enums, :force => true do |t|
      t.integer "bag_property_id"
      t.string  "name"
      t.string  "value"
      t.integer "sort"
    end
    add_index :bag_property_enums, ["bag_property_id"]
    
    create_table :bag_property_values, :force => true do |t|
      t.integer  "data_type",           :default => 1
      t.integer  "baggable_id"
      t.string   "baggable_type"
      t.integer  "bag_property_id"
      t.string   "svalue"
      t.text     "tvalue"
      t.integer  "ivalue"
      t.integer  "bag_property_enum_id"
      t.datetime "tsvalue"
      t.integer  "visibility"
    end
    add_index :bag_property_values, ["user_id", "bag_property_id"]
    
  end

  def self.down
    drop_table :bag_properties
    drop_table :bag_property_enums
    drop_table :bag_property_values
  end
end
