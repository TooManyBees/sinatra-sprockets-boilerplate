class Object
  def try *args, &block
    if args.empty? && block_given?
      yield self
    elsif !args.empty? && respond_to?(args.first)
      send(*args, &block)
    end
  end
end

class NilClass
  def try *args
  end
end
