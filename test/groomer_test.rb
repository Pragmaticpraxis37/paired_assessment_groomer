require 'minitest/autorun'
require 'minitest/pride'
require './lib/pet'
require './lib/customer'
require './lib/groomer'

class GroomerTest < Minitest::Test
  def test_it_exists_and_has_attributes
    groomer_1 = Groomer.new("Tiana")
    groomer_2 = Groomer.new("Stan")

    assert_instance_of Groomer, groomer_1
    assert_equal "Tiana", groomer_1.name
    assert_equal "Stan", groomer_2.name
    assert_equal [], groomer_1.customers
  end

  def test_add_customer
    groomer_1 = Groomer.new("Tiana")
    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    lucy = Pet.new({name: "Lucy", type: :cat, age: 12})

    joel.adopt(samson)
    joel.adopt(lucy)

    groomer_2 = Groomer.new("Tiana")
    phil = Customer.new("Phil", 3)
    sydney = Pet.new({name: "Sydney", type: :dog, age: 3})
    zoe = Pet.new({name: "Zoe", type: :cat, age: 12})

    phil.adopt(sydney)
    phil.adopt(zoe)

    groomer_1.add_customer(joel)
    groomer_2.add_customer(phil)

    assert_equal [joel], groomer_1.customers
    assert_equal [phil], groomer_2.customers
  end

  def test_outstanding_balances
    groomer_1 = Groomer.new("Tiana")
    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    lucy = Pet.new({name: "Lucy", type: :cat, age: 12})

    joel.adopt(samson)
    joel.adopt(lucy)

    phil = Customer.new("Phil", 3)
    sydney = Pet.new({name: "Sydney", type: :dog, age: 3})
    zoe = Pet.new({name: "Zoe", type: :cat, age: 12})

    phil.adopt(sydney)
    phil.adopt(zoe)

    groomer_1.add_customer(joel)
    groomer_1.add_customer(phil)

    joel.charge(15)
    joel.charge(7)

    assert_equal [joel], groomer_1.outstanding_balances
  end

  def test_pet_by_type_and_charge_amount
    groomer_1 = Groomer.new("Tiana")
    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    lucy = Pet.new({name: "Lucy", type: :cat, age: 12})

    joel.adopt(samson)
    joel.adopt(lucy)

    phil = Customer.new("Phil", 3)
    sydney = Pet.new({name: "Sydney", type: :dog, age: 3})
    zoe = Pet.new({name: "Zoe", type: :dog, age: 12})

    phil.adopt(sydney)
    phil.adopt(zoe)

    groomer_1.add_customer(joel)
    groomer_1.add_customer(phil)

    assert_equal 3, groomer_1.pet_by_type(:dog)
    assert_equal 1, groomer_1.pet_by_type(:cat)
  end

  def test_service_type
    groomer_1 = Groomer.new("Tiana")
    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    lucy = Pet.new({name: "Lucy", type: :cat, age: 12})

    joel.adopt(samson)
    joel.adopt(lucy)

    groomer_1.add_customer(joel)

    joel.service_type("Haircut", 7, "Lucy")

    assert_equal ["Haircut"], joel.check_services
    assert_equal 7, joel.service_cost("Haircut")
    assert_equal 7, joel.outstanding_balance
  end

  def test_service_and_service_cost_to_pet
    groomer_1 = Groomer.new("Tiana")
    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    lucy = Pet.new({name: "Lucy", type: :cat, age: 12})

    joel.adopt(samson)
    joel.adopt(lucy)

    groomer_1.add_customer(joel)

    joel.service_type("Haircut", 7, "Lucy")

    assert_equal "Lucy", joel.service_and_service_cost_to_pet
  end
end
