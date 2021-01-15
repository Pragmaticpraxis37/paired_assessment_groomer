class Pet
  attr_reader :name,
              :type,
              :age,
              :fed

  def initialize(pet_info)
    @name = pet_info[:name]
    @type = pet_info[:type]
    @age = pet_info[:age]
    @fed = false
  end

  def fed?
    @fed 
  end

  def feed
    @fed = true
  end
end
