class ResearchArea < ActiveLod::Base
  attr_reader :name, :id
  
  def initialize(options = {})
    @name = options[:name] || ''
    @id = options[:id] || ''
  end
end