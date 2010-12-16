module URIQueryUtil
  
  def add_query(options = {})
    unless options.blank?
      options.each{|key, value| options.delete(key) if value.blank?}
      q = self.params.merge!(options).to_query
      self.query = q unless q.blank?
    end
    self
  end

  def remove_query(*attrs)
    q = self.params.extract!(*(self.params.keys - attrs.map(&:to_s))).to_query
    self.query = q unless q.blank?
    self
  end

  def add_path(path)
    path =  ("#{self.path}/#{path}".split("/") - ["", nil]).join("/")
    self.path = "/#{path}" unless path.blank?
    self
  end

  def params
    Rack::Utils.parse_nested_query(self.query).with_indifferent_access
  end
    
end

[URI::HTTP, URI::HTTPS, URI::FTP].each do |klass|
  klass.send(:include, URIQueryUtil)
end