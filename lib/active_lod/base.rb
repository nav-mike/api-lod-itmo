module ActiveLod
  class Base
    URL = 'http://lod.ifmo.ru/sparql'
    
    GRAPH_URI = 'http://lod.ifmo.ru'
    
    def repository
      RDF::Virtuoso::Repository.new(URL)
    end
    
    def query
      RDF::Virtuoso::Query
    end
    
    def graph
      RDF::URI.new(GRAPH_URI)
    end
    
    def uri(url)
      RDF::URI.new(url)
    end
  end
end