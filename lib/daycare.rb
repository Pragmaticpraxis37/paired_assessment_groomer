class Daycare
  attr_reader :name,
              :customers,
              :feeding_price

  def initialize(name, feeding_price = 5)
    @name = name
    @customers = []
    @feeding_price = feeding_prices[:dog]
  end

  def add_customer(customer)
    @customers << customer
  end

  def find_by_customer_id(id)
    @customers.find do |customer|
      customer.id == id
    end
  end

  def unfed_pets
    pets = []
    @customers.each do |customer|
      customer.pets.each do |pet|
        if pet.fed == false
          pets << pet
        end
      end
    end
    pets
  end

  def feed_customer_pets
    total = 0
    customers.each do |customer|
      customer.pets.each do |pet|
        if pet.fed == false && pet.type == :dog
          total += feeding_price + 5
        elsif pet.fed == false && pet.type == :cat
          total += feeding_price
        end
      end
    end
    total
  end
end
