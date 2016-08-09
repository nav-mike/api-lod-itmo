require 'rdf/virtuoso'

module ActiveLod
  class Base
    def self.sparql
      SPARQL::Client.new('http://lod.ifmo.ru/sparql')
    end
  end
end