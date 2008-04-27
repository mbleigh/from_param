require File.dirname(__FILE__) + '/../../../../spec/spec_helper'

plugin_spec_dir = File.dirname(__FILE__)
ActiveRecord::Base.logger = Logger.new(plugin_spec_dir + "/debug.log")

load(File.dirname(__FILE__) + '/schema.rb')

class ParameteredModel < ActiveRecord::Base
  def to_param
    name.gsub(" ","-").downcase.gsub(/[^a-z-]/,"")
  end
end

class UnparameteredModel < ActiveRecord::Base
  def to_param
    "#{id}-#{name.gsub(" ","-").downcase.gsub(/[^a-z-]/,"")}"
  end
end

class SluggedModel < ActiveRecord::Base
  set_param_column "slug"
  
  def to_param
    name.gsub(" ","-").downcase.gsub(/[^a-z-]/,"")
  end  
end