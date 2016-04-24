class Hash
  def map_values!
    self.each do |k, val|
      self[k] = yield val
    end
  end

  def map_values &blk
    self.dup.map_values!(&blk)
  end
end
