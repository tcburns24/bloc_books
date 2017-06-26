class Library
  @@libraries = []

  attr_reader :title

  def initialize(title)
    @id = @@libraries.length + 1
    @title = title

    @@libraries << self
  end

  def self.all
    return @@libraries
  end

  def self.find(id)
    Library.all[id - 1]
  end

  def assign_attributes(data_hash)
    data_hash.each { |key, value| self.instance_variable_set("@#{key}", value)}
    # @title = data_hash.title
  end

  def destroy
    @@libraries.delete_at(@id - 1)
  end

end
