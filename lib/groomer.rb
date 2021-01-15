class Groomer
  attr_reader :name,
              :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def outstanding_balances
    customers.find_all do |customer|
      customer.outstanding_balance > 0
    end
  end

  def pet_by_type(type)
    pet_list = customers.map do |customer|
      customer.pets
    end.flatten!

    pet_list.count do |pet|
      pet.type == type
    end
  end
end
