require_relative 'spec_helper'

FUNCTION = 'lookup'
ARITY = 2
PATH = File.join(FUNCTION+".rb")
RELATIVE_PATH = File.join("..", PATH)

describe FUNCTION do

  def self.test_order
    :alpha
  end

  module StudentMethods; end

  def wrap_function_in_namespace
      StudentMethods.module_eval(File.read(PATH), __FILE__, __LINE__)
  end

  it 'exists' do
    assert File.exist?(PATH), "Du behöver skapa filen #{PATH}"
    require_relative RELATIVE_PATH
  end

  it "has a function named #{FUNCTION}" do
    wrap_function_in_namespace
    assert(StudentMethods.instance_methods.include?(FUNCTION.to_sym),
               "Du behöver definera funktionen #{FUNCTION} i #{PATH}")
  end

  it "takes #{ARITY.humanize} arguments" do
    message = "Funktionen #{FUNCTION} måste ta #{ARITY} argument"
    assert_equal ARITY, method(FUNCTION.to_sym).arity, message
  end

  it 'returnerar 25 för input ({"Alice" => 25, "Bob" => 30}, "Alice")' do
    StudentMethods.send(FUNCTION, {"Alice" => 25, "Bob" => 30}, "Alice").must_equal 25
  end

  it 'returnerar 30 för input ({"Alice" => 25, "Bob" => 30}, "Bob")' do
    StudentMethods.send(FUNCTION, {"Alice" => 25, "Bob" => 30}, "Bob").must_equal 30
  end

  it 'returnerar nil för input ({"Alice" => 25, "Bob" => 30}, "Charlie")' do
    StudentMethods.send(FUNCTION, {"Alice" => 25, "Bob" => 30}, "Charlie").must_equal nil
  end

  it 'returnerar nil för input ({}, "Alice")' do
    StudentMethods.send(FUNCTION, {}, "Alice").must_equal nil
  end

  it 'returnerar 2 för input ({"a" => 1, "b" => 2, "c" => 3}, "b")' do
    StudentMethods.send(FUNCTION, {"a" => 1, "b" => 2, "c" => 3}, "b").must_equal 2
  end

  it 'returnerar "Stockholm" för input ({"name" => "Alice", "city" => "Stockholm"}, "city")' do
    StudentMethods.send(FUNCTION, {"name" => "Alice", "city" => "Stockholm"}, "city").must_equal "Stockholm"
  end

  it 'returnerar nil för input ({"x" => 10, "y" => 20}, "z")' do
    StudentMethods.send(FUNCTION, {"x" => 10, "y" => 20}, "z").must_equal nil
  end

  it 'returnerar 3 för input ({"a" => 1, "b" => 2, "c" => 3}, "c")' do
    StudentMethods.send(FUNCTION, {"a" => 1, "b" => 2, "c" => 3}, "c").must_equal 3
  end

  it 'returnerar "070-555" för input ({"David" => "070-555", "Emma" => "070-666"}, "David")' do
    StudentMethods.send(FUNCTION, {"David" => "070-555", "Emma" => "070-666"}, "David").must_equal "070-555"
  end

end
