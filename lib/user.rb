class User
  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :id
  # attr_writer :password

  def initialize(first_name,last_name, id)
    @first_name = first_name
    @last_name = last_name
    @id = id
    # @id = "#{("A".."Z").to_a.sample}-#{rand(1..999)}"
  end

  def get_id
    return self.id
  end

  def User_Identification
    "new id: #{@id} #{@first_name} #{@last_name}. Created #{self.class} Object id #{self.object_id}."
  end
end