require 'bloc_record/base'

class Book < BlocRecord::Base
end


#
# class Book
#   @@books = []
#
#   attr_reader :title, :author, :id
#
#   def initialize(title, author)
#     @id = @@books.length + 1
#     @title = title
#     @author = author
#
#     @@books << self
#   end
#
#   def self.all
#     return @@books
#   end
#
#   def self.find(id)
#     Book.all[id-1]
#   end
#
#   def assign_attributes(data_hash)
#     data_hash.each { |key, value| self.instance_variable_set("@#{key}", value)}
#     # @title = data_hash.title
#     # @author = data_hash.author
#   end
#
#   def destroy
#     @@books.delete_at(@id - 1)
#   end
# end
#
# # TODO Remove these in checkpoint 3
# Book.new("Not Taco Bell Material", "Adam Carolla")
# Book.new("Imbibe!", "David Wondrich")
# Book.new("The Art of the Deal", "Donald Trump")
