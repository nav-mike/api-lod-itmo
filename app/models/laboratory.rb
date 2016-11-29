class Laboratory < ActiveLod::Base
  attr_reader :en_name, :ru_name, :web_page, :country, :id,
              :type

  def initialize(options = {})
    @en_name = options[:en_name] || ''
    @ru_name = options[:ru_name] || ''
    @web_page = options[:web_page] || ''
    @country = options[:country] || ''
    @id = options[:id] || ''
    @type = options[:type] || ''
  end
  
  def self.find(pcard_id)
    query = sparql.select(:id, :en_name, :ru_name, :web_page, :country)
      .where(
               [:id, RDF::URI('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'), RDF::URI('http://vivoplus.aksw.org/ontology#Laboratory')],
               [:id, RDF::URI('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'), RDF::URI('http://vivoweb.org/ontology/core#Laboratory')],
               [:id, RDF::URI('http://www.w3.org/2000/01/rdf-schema#label'), :en_name],
               [:id, RDF::URI('http://www.w3.org/2000/01/rdf-schema#label'), :ru_name],
               [:id, RDF::URI('http://www.w3.org/2000/01/rdf-schema#seeAlso'), :web_page],
               [:id, RDF::URI('http://vivoplus.aksw.org/ontology#locatedIn'), :country]
             )
      .optional([:id, RDF::URI('https://www.w3.org/1999/02/22-rdf-syntax-ns#type'), :academic_status])
      .filter('lang(?en_name) = "en"')
      .filter('lang(?ru_name) = "ru"')
      .filter("regex(str(?id), \"http://lod.ifmo.ru/Laboratory#{pcard_id}\")")
      .distinct

      to_laboratory(query.solutions.first, query.solutions.map { |item| item[:country].value })
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
  
  def self.to_laboratory(solution, countries = [])
    rec = {
        id: solution[:id].value,
        en_name: solution[:en_name].value,
        ru_name: solution[:ru_name].value,
        web_page: solution[:web_page].value
      }
      rec[:type] = solution[:type].value if solution[:type].present?
      rec[:country] = countries
      Laboratory.new(rec)
  end
end