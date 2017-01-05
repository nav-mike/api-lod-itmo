class ResearchArea < ActiveLod::Base
  attr_reader :name, :id, :has_research_area, :laboratory_name
  
  def initialize(options = {})
    @name = options[:name] || ''
    @id = options[:id] || ''
    @has_research_area = options[:has_research_area] || ''
    @laboratory_name = options[:laboratory_name] || ''
  end
  
  def self.find(id)
    query = sparql.select(:id, :name, :has_research_area)
      .where(
        [:id, RDF::URI('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'), RDF::URI('http://vivoplus.aksw.org/ontology#ResearchArea')],
        [:id, RDF::URI('http://www.w3.org/2000/01/rdf-schema#label'), :name]
      )
      .optional([:has_research_area, RDF::URI('http://vivoplus.aksw.org/ontology#hasResearchArea'), :id])
      .filter("regex(str(?id), \"http://lod.ifmo.ru/ResearchArea#{id}\")")

    to_research_area query.solutions.first
  end
  
  def include_laboratory!
    lab_id = has_research_area.gsub(/\Ahttp:\/\/lod.ifmo.ru\/[a-zA-Z]+/, '').to_i
    @laboratory_name = Laboratory.find(lab_id).ru_name
  end
  
  def self.find_uri(uri)
    query = sparql.select(:id, :name)
      .where(
        [:id, RDF::URI('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'), RDF::URI('http://vivoplus.aksw.org/ontology#ResearchArea')],
        [:id, RDF::URI('http://www.w3.org/2000/01/rdf-schema#label'), :name]
      )
      .filter("regex(str(?id), \"#{uri}\")")
      
    to_research_area query.solutions.first
  end
  
  def self.where_uri(uri_arr)
    result = []
    uri_arr.each do |uri|
      item = find_uri(uri)
      result << item
    end
    result
  end
  
  def self.all
    query = sparql.select(:id, :name).distinct
      .where(
        [:id, RDF::URI('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'), RDF::URI('http://vivoplus.aksw.org/ontology#ResearchArea')],
        [:id, RDF::URI('http://www.w3.org/2000/01/rdf-schema#label'), :name]
      )
    
    result = []
    query.each_solution do |solution|
      result << to_research_area(solution)
    end
    result
  end
  
  def self.to_research_area(solution)
    hsa = solution[:has_research_area].present? ? solution[:has_research_area].value : ''
    rec = {
      id: solution[:id].value,
      name: solution[:name].value,
      has_research_area: solution[:has_research_area].value
    }
    ResearchArea.new rec
  end
end