class Person < ActiveLod::Base
  attr_reader :id, :academic_qualification, :academic_status, :affiliated_organization,
              :first_name, :last_name, :middle_name, :pcard_id
  
  def initialize(options = {})
    @id = options[:id] || ''
    @academic_qualification = options[:academic_qualification] || ''
    @academic_status = options[:academic_status] || ''
    @affiliated_organization = options[:affiliated_organization] || ''
    @first_name = options[:first_name] || ''
    @last_name = options[:last_name] || ''
    @middle_name = options[:middle_name] || ''
    @pcard_id = options[:pcard_id] || ''
  end
end