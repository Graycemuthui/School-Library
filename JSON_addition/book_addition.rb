require_relative '../book'

class Book_addition < Book
  def to_json(*args)
    {
      JSON.create_id  => self.class.name,
      'a'             => [ title, author, rentals]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end