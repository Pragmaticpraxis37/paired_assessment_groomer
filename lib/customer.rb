class Customer
  attr_reader :name,
              :id,
              :pets,
              :outstanding_balance,
              :service_with_charge,
              :service_type

  def initialize(name, id)
    @name = name
    @id = id
    @pets = []
    @outstanding_balance = 0
    @service_with_charge = {}
  end

  def adopt(pet)
    @pets << pet
  end

  def charge(amount)
    @outstanding_balance += amount
  end

  def service_type(type, charge, pet_name)
    service_and_service_cost_to_pet(pet_name)
    charge(charge)
    @service_with_charge[type] = charge
  end

  def check_services
    @service_with_charge.keys
  end

  def service_cost(service)
    @service_with_charge[service]
  end

  def service_and_service_cost_to_pet(pet_name)
    pets.find do |pet|
      pet.name == pet_name
    end 
  end
end
