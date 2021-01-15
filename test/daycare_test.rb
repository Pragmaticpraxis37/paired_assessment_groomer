require 'minitest/autorun'
require 'minitest/pride'
require './lib/daycare'
require './lib/customer'
require './lib/pet'

class DaycareTest < Minitest::Test
  def test_it_exists_and_has_attributes
    daycare = Daycare.new("Doggie Care")


    assert_instance_of Daycare, daycare
    assert_equal "Doggie Care", daycare.name
    assert_equal [], daycare.customers
  end

  def test_add_customer
    daycare = Daycare.new("Doggie Care")

    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    lucy = Pet.new({name: "Lucy", type: :cat, age: 12})

    joel.adopt(samson)
    joel.adopt(lucy)

    daycare.add_customer(joel)

    assert_equal [joel], daycare.customers
  end

  def test_find_by_customer_id
    daycare = Daycare.new("Doggie Care")

    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    lucy = Pet.new({name: "Lucy", type: :cat, age: 12})

    joel.adopt(samson)
    joel.adopt(lucy)

    daycare.add_customer(joel)

    assert_equal joel, daycare.find_by_customer_id(2)
  end

  def test_unfed_pets
    daycare = Daycare.new("Doggie Care")

    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    lucy = Pet.new({name: "Lucy", type: :cat, age: 12})

    joel.adopt(samson)
    joel.adopt(lucy)

    daycare.add_customer(joel)

    assert_equal [samson, lucy], daycare.unfed_pets

    samson.feed

    assert_equal [lucy], daycare.unfed_pets
  end

  def test_feeding_price
    daycare_1 = Daycare.new("Doggie Care", 10)
    daycare_2 = Daycare.new("Cat Care", 15)
    daycare_3 = Daycare.new("Frog Care")

    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    lucy = Pet.new({name: "Lucy", type: :cat, age: 12})

    franny = Customer.new("Franny", 2)
    zoe = Pet.new({name: "Zoe", type: :dog, age: 3})
    sydney = Pet.new({name: "Sydney", type: :cat, age: 12})

    joel.adopt(samson)
    joel.adopt(lucy)
    franny.adopt(zoe)
    franny.adopt(sydney)

    daycare_1.add_customer(joel)
    daycare_2.add_customer(franny)

    assert_equal 10, daycare_1.feeding_price
    assert_equal 15, daycare_2.feeding_price
    assert_equal 5, daycare_3.feeding_price
  end

  def test_feed_customer_pets
    daycare_1 = Daycare.new("Doggie Care", 10)
    daycare_2 = Daycare.new("Cat Care", 15)
    daycare_3 = Daycare.new("Frog Care")

    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    lucy = Pet.new({name: "Lucy", type: :cat, age: 12})

    franny = Customer.new("Franny", 2)
    zoe = Pet.new({name: "Zoe", type: :dog, age: 3})
    sydney = Pet.new({name: "Sydney", type: :cat, age: 12})

    joel.adopt(samson)
    joel.adopt(lucy)
    franny.adopt(zoe)
    franny.adopt(sydney)

    daycare_1.add_customer(joel)
    daycare_2.add_customer(franny)

    assert_equal 25, daycare_1.feed_customer_pets
    assert_equal 35, daycare_2.feed_customer_pets
  end
end
