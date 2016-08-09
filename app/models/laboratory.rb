class Laboratory < ActiveLod::Base
  attr_reader :en_name, :ru_name, :web_page, :country, :id

  def initialize(options = {})
    @en_name = options[:en_name] || ''
    @ru_name = options[:ru_name] || ''
    @web_page = options[:web_page] || ''
    @country = options[:country] || ''
    @id = options[:id] || ''
  end
end