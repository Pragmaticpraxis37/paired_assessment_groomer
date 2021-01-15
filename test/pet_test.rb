require 'minitest/autorun'
require 'minitest/pride'
require './lib/pet'

class PetTest < Minitest::Test
  def test_it_exists_and_has_attributes
    samson = Pet.new({name: "Samson", type: :dog, age: 3})

    assert_instance_of Pet, samson
    assert_equal "Samson", samson.name
    assert_equal :dog, samson.type
    assert_equal 3, samson.age

  end

  def test_feed
    samson = Pet.new({name: "Samson", type: :dog, age: 3})

    assert_equal false, samson.fed?

    samson.feed

    assert_equal true, samson.fed?
  end
end
