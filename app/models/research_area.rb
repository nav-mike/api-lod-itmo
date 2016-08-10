class ResearchArea < ActiveLod::Base
  attr_reader :name, :id
  
  def initialize(options = {})
    @name = options[:name] || ''
    @id = options[:id] || ''
  end
  
  def self.find(id)
    query = sparql.select(:id, :name)
      .where(
        [:id, RDF::URI('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'), RDF::URI('http://vivoplus.aksw.org/ontology#ResearchArea')],
        [:id, RDF::URI('http://www.w3.org/2000/01/rdf-schema#label'), :name]
      )
      .filter("regex(str(?id), \"http://lod.ifmo.ru/ResearchArea#{id}\")")
      
    to_research_area query.solutions.first
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
    rec = {
      id: solution[:id].value,
      name: solution[:name].value
    }
    ResearchArea.new rec
  end
end