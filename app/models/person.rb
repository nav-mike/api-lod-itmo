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
  
  def self.find(id)
    query = sparql.select(:id, :academic_qualification, :academic_status, :affiliated_organization,
                          :first_name, :last_name, :middle_name, :pcard_id)
      .where(
        [:id, RDF::URI('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'), RDF::URI('http://xmlns.com/foaf/0.1/Person')],
        [:id, RDF::URI('http://vivoplus.aksw.org/ontology#academicQualification'), :academic_qualification],
        [:id, RDF::URI('http://vivoplus.aksw.org/ontology#academicStatus'), :academic_status],
        [:id, RDF::URI('http://vivoweb.org/ontology/core#affiliatedOrganization'), :affiliated_organization],
        [:id, RDF::URI('http://xmlns.com/foaf/0.1/firstName'), :first_name],
        [:id, RDF::URI('http://xmlns.com/foaf/0.1/lastName'), :last_name],
        [:id, RDF::URI('http://vivoweb.org/ontology/core#middleName'), :middle_name],
        [:id, RDF::URI('http://vivoplus.aksw.org/ontology#pcardId'), :pcard_id]
      )
      .filter("STR(?pcard_id) = \"#{id}\"")
      
      to_person query.solutions.first
  end
  
  def self.all
    query = sparql.select(:id, :academic_qualification, :academic_status, :affiliated_organization,
                          :first_name, :last_name, :middle_name, :pcard_id).distinct
      .where(
        [:id, RDF::URI('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'), RDF::URI('http://xmlns.com/foaf/0.1/Person')],
        [:id, RDF::URI('http://vivoplus.aksw.org/ontology#academicQualification'), :academic_qualification],
        [:id, RDF::URI('http://vivoplus.aksw.org/ontology#academicStatus'), :academic_status],
        [:id, RDF::URI('http://vivoweb.org/ontology/core#affiliatedOrganization'), :affiliated_organization],
        [:id, RDF::URI('http://xmlns.com/foaf/0.1/firstName'), :first_name],
        [:id, RDF::URI('http://xmlns.com/foaf/0.1/lastName'), :last_name],
        [:id, RDF::URI('http://vivoweb.org/ontology/core#middleName'), :middle_name],
        [:id, RDF::URI('http://vivoplus.aksw.org/ontology#pcardId'), :pcard_id]
      )
      
    result = []
    query.each_solution do |solution|
      result << to_person(solution)
    end
    result
  end
  
  def self.to_person(solution)
    rec = {
      id: solution[:id].value,
      academic_qualification: solution[:academic_qualification].value,
      academic_status: solution[:academic_status].value,
      affiliated_organization: solution[:affiliated_organization].value,
      first_name: solution[:first_name].value,
      last_name: solution[:last_name].value,
      middle_name: solution[:middle_name].value,
      pcard_id: solution[:pcard_id].value
    }
    Person.new rec
  end
end