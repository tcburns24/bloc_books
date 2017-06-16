class Book
  @@books = []

  attr_reader :title, :author

  def initialize(title, author)
    @id = @@books.length + 1
    @title = title
    @author = author

    @@books << self
  end

  def self.all
    return @@books
  end

  def find(id)
    Book.all[id - 1]
  end

  def assign_attributes(data_hash)
    @title = data_hash.title
    @author = data_hash.author
  end

  def destroy
    @@books.delete_at(@id - 1)
  end
end

# TODO Remove these in checkpoint 3
Book.new("Not Taco Bell Material", "Adam Carolla")
Book.new("Imbibe!", "David Wondrich")
Book.new("The Art of the Deals", "Donald Trump")
