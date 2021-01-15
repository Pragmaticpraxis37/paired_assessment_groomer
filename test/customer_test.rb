require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer'
require './lib/pet'

class CustomerTest < Minitest::Test
  def test_it_exists_and_has_attributes
    joel = Customer.new("Joel", 2)

    assert_instance_of Customer, joel
    assert_equal "Joel", joel.name
    assert_equal 2, joel.id
    assert_equal [], joel.pets
  end

  def test_adopt
    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    lucy = Pet.new({name: "Lucy", type: :cat, age: 12})

    joel.adopt(samson)
    joel.adopt(lucy)

    assert_equal [samson, lucy], joel.pets
  end

  def test_amount
    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    lucy = Pet.new({name: "Lucy", type: :cat, age: 12})

    joel.adopt(samson)
    joel.adopt(lucy)

    assert_equal 0, joel.outstanding_balance

    joel.charge(15)
    joel.charge(7)

    assert_equal 22, joel.outstanding_balance
  end
end
