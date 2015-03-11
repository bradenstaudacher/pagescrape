class Comment
  attr_accessor  :author_name, :statement, :date_authored
  def initialize(author_name, statement, date_authored)
    @author_name = author_name
    @statement = statement
    @date_authored = date_authored
  end
end