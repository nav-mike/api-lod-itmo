class Laboratory < ActiveLod::Base
  attr_reader :en_name, :ru_name, :web_page, :country, :id

  def initialize(options = {})
    @en_name = options[:en_name] || ''
    @ru_name = options[:ru_name] || ''
    @web_page = options[:web_page] || ''
    @country = options[:country] || ''
    @id = options[:id] || ''
  end
  
  def self.all
    q = query.select(:id, :en_name, :ru_name, :web_page, :counry)
             .where(
               [:id, uri('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'), uri('http://vivoplus.aksw.org/ontology#Laboratory')],
               [:id, uri('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'), uri('http://vivoweb.org/ontology/core#Laboratory')],
               [:id, uri('http://www.w3.org/2000/01/rdf-schema#label'), :en_name],
               [:id, uri('http://www.w3.org/2000/01/rdf-schema#label'), :ru_name],
               [:id, uri('http://www.w3.org/2000/01/rdf-schema#seeAlso'), :web_page],
               [:id, uri('http://vivoplus.aksw.org/ontology#locatedIn'), :country]
             ).filter('lang(?en_name) = "en"').filter('lang(?ru_name) = "ru"')
             .distinct.graph(graph)

    repository.select(q)
  end
end