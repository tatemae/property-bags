module ActiveRecord
  module Acts #:nodoc:

    module PropertyBag #:nodoc:
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods

        # acts_as_property_bag requires an option for :has_attached_file.  These values will be passed to paperclip.
        # i.e.
        # acts_as_uploader :has_attached_file => {
        # :url     => "/uploads/:class/:id/:style_:basename.:extension",
        # :path    => ":rails_root/public/uploads/:class/:id/:style_:basename.:extension",
        # :styles  => { :icon => "30x30!", :thumb => "100>", :small => "150>", :medium => "300>", :large => "660>"},
        # :default_url => "/images/profile_default.jpg" }
        def acts_as_property_bag(options)

          #Named scopes
          named_scope :newest_first, :order => "created_at DESC"
          named_scope :alphabetic, :order => "filename DESC"
          named_scope :recent, :order => "created_at DESC"
          named_scope :public, :conditions => 'is_public = true'
          named_scope :since, lambda { |*args| { :conditions => ["created_at > ?", (args.first || 7.days.ago.to_s(:db)) ]} }
                                        
          class_eval <<-EOV
            # prevents a user from submitting a crafted form that bypasses activation
            attr_protected :creator_id, :uploadable_id, :uploadable_type
          EOV

          include ActiveRecord::Acts::UploaderUpload::InstanceMethods
          extend ActiveRecord::Acts::UploaderUpload::SingletonMethods
        end
      end

      # class methods
      module SingletonMethods

      end
      
      # All the methods available to a record that has had <tt>acts_as_uploader</tt> specified.
      module InstanceMethods
        
        
          
      end 
    end
  end
end
