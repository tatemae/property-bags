# == Schema Information
# Schema version: 20090213002439
#
# Table name: bag_property_values
#
#  id                   :integer(4)    not null, primary key
#  data_type            :integer(4)    default(1)
#  user_id              :integer(4)    
#  bag_property_id      :integer(4)    
#  svalue               :string(255)   
#  tvalue               :text(16777215 
#  ivalue               :integer(4)    
#  bag_property_enum_id :integer(4)    
#  tsvalue              :datetime      
#  visibility           :integer(4)    
#

class BagPropertyValue < ActiveRecord::Base
end
