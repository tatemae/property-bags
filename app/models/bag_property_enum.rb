# == Schema Information
# Schema version: 20090213002439
#
# Table name: bag_property_enums
#
#  id              :integer(4)    not null, primary key
#  bag_property_id :integer(4)    
#  name            :string(255)   
#  value           :string(255)   
#  sort            :integer(4)    
#

class BagPropertyEnum < ActiveRecord::Base
end
