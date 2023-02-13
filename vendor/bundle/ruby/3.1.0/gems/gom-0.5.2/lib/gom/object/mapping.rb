
# Provides a mapping between objects and ids
class GOM::Object::Mapping

  def initialize
    @map = { }
  end

  def put(object, id)
    return if object.nil? || id.nil?
    @map[object] = id
  end

  def object_by_id(id)
    @map.respond_to?(:key) ? @map.key(id) : @map.index(id)
  end

  def id_by_object(object)
    @map[object]
  end

  def remove_by_id(id)
    @map.delete object_by_id(id)
  end

  def remove_by_object(object)
    @map.delete object
  end

  def size
    @map.size
  end

  def clear!
    @map.clear
  end

  def inspect
    output = ""
    @map.each{ |object, id| output += object.inspect + " => " + id.to_s + "\n" }
    output
  end

  def self.singleton
    @mapping ||= self.new
  end

  def self.method_missing(method_name, *arguments, &block)
    self.singleton.send method_name, *arguments, &block
  end

end
