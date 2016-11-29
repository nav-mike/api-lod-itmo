class Laboratory < ActiveLod::Base
  attr_reader :en_name, :ru_name, :web_page, :country, :id,
              :type, :areas, :people

  def initialize(options = {})
    @en_name = options[:en_name] || ''
    @ru_name = options[:ru_name] || ''
    @web_page = options[:web_page] || ''
    @country = options[:country] || ''
    @id = options[:id] || ''
    @type = options[:type] || ''
    @areas = options[:areas] || ''
    @people = options[:people] || ''
  end
  
  def self.find(pcard_id)
    query = sparql.select(:id, :en_name, :ru_name, :web_page, :country, :type, :area, :area_name, :person, :person_name)
      .where(
               [:id, RDF::URI('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'), RDF::URI('http://vivoplus.aksw.org/ontology#Laboratory')],
               [:id, RDF::URI('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'), RDF::URI('http://vivoweb.org/ontology/core#Laboratory')],
               [:id, RDF::URI('http://www.w3.org/2000/01/rdf-schema#label'), :en_name],
               [:id, RDF::URI('http://www.w3.org/2000/01/rdf-schema#label'), :ru_name],
               [:id, RDF::URI('http://www.w3.org/2000/01/rdf-schema#seeAlso'), :web_page],
               [:id, RDF::URI('http://vivoplus.aksw.org/ontology#locatedIn'), :country]
             )
      .optional([:id, RDF::URI('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'), :type])
      .optional([:id, RDF::URI('http://vivoplus.aksw.org/ontology#hasResearchArea'), :area])
      .optional([:area, RDF::URI('http://www.w3.org/2000/01/rdf-schema#label'), :area_name])
      .optional([:person, RDF::URI('http://vivoweb.org/ontology/core#affiliatedOrganization'), :id])
      .optional([:person, RDF::URI('http://www.w3.org/2000/01/rdf-schema#label'), :person_name])
      .filter('lang(?en_name) = "en"')
      .filter('lang(?ru_name) = "ru"')
      .filter("regex(str(?id), \"http://lod.ifmo.ru/Laboratory#{pcard_id}\")")
      .distinct

      data = {
        country: query.solutions.map { |item| item[:country].value },
        type: query.solutions.map { |item| item[:type].value }.uniq,
        areas: query.solutions.map { |item| {name: item[:area_name].value, uri: item[:area].value }}.uniq,
        people: query.solutions.map { |item| {name: item[:person_name].value, uri: item[:person].value }}.uniq
      }
      to_laboratory(query.solutions.first, data)
  end
  
  def self.all
    query = sparql.select(:id, :en_name, :ru_name, :web_page).distinct
      .where(
               [:id, RDF::URI('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'), RDF::URI('http://vivoplus.aksw.org/ontology#Laboratory')],
               [:id, RDF::URI('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'), RDF::URI('http://vivoweb.org/ontology/core#Laboratory')],
               [:id, RDF::URI('http://www.w3.org/2000/01/rdf-schema#label'), :en_name],
               [:id, RDF::URI('http://www.w3.org/2000/01/rdf-schema#label'), :ru_name],
               [:id, RDF::URI('http://www.w3.org/2000/01/rdf-schema#seeAlso'), :web_page]
             ).filter('lang(?en_name) = "en"').filter('lang(?ru_name) = "ru"')

    result = []
    query.each_solution do |solution|
      result << to_laboratory(solution)
    end
    result
  end
  
  def self.to_laboratory(solution, data = {})
    rec = {
        id: solution[:id].value,
        en_name: solution[:en_name].value,
        ru_name: solution[:ru_name].value,
        web_page: solution[:web_page].value
      }
      rec[:type] = solution[:type].value if solution[:type].present?
      rec[:country] = data[:country].uniq if data[:country].present?
      rec[:type] = data[:type] if data[:type].present?
      rec[:areas] = data[:areas] if data[:areas].present?
      rec[:people] = data[:people] if data[:people].present?
      Laboratory.new(rec)
  end
end