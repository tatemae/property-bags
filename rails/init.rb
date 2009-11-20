require 'property_bags'

#ActiveRecord::Base.class_eval { include ActiveRecord::Acts::UploaderUpload }

I18n.load_path += Dir[ File.join(File.dirname(__FILE__), '..', 'locales', '*.{rb,yml}') ]