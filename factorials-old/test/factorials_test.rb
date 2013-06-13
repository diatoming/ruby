#!/usr/local/bin/ruby

require "test/unit"
require "../lib/factorials"

class TestFactorials < Test::Unit::TestCase

  # 'test_' prefix required!
  def testPersonMethods
    #assertions go here
  end

  def testMethodsExist
    # methods we would like the class to have

    #create a new person
    person = Person.new

    #create a literal array of the methods we expect to see
    expectedMethods = %w(age name firstname lastname)

    #run an assertion on each method stating that the method exists
    expectedMethods.each do
      |method|
      assert(person.respond_to? method , "#{method} does not exist")
    end
  end

  def testPersonFunctionality
    #set up a person
    person = Person.new
    person.firstname = "Mikey"
    person.lastname = "Hogarth"
    person.age = 30

    #check that the correct class was created
    assert_instance_of(Person, person)

    #check that "name" will return the first and last names appended
    assert_equal("Mikey Hogarth", person.name)

    #check that the age range is limited 0...200
    assert_raises(RangeError) { person.age = -1 }
    assert_raises(RangeError) { person.age = 201 } 

  end

  #more tests...
end
