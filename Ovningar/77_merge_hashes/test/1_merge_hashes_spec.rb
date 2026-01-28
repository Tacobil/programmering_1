require_relative 'spec_helper'

FUNCTION = 'merge_hashes'
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

  it 'returnerar {"a" => 1, "b" => 2, "c" => 3, "d" => 4} för input ({"a" => 1, "b" => 2}, {"c" => 3, "d" => 4})' do
    StudentMethods.send(FUNCTION, {"a" => 1, "b" => 2}, {"c" => 3, "d" => 4}).must_equal({"a" => 1, "b" => 2, "c" => 3, "d" => 4})
  end

  it 'returnerar {"name" => "Alice", "age" => 25, "city" => "Stockholm"} för input ({"name" => "Alice", "age" => 25}, {"city" => "Stockholm"})' do
    StudentMethods.send(FUNCTION, {"name" => "Alice", "age" => 25}, {"city" => "Stockholm"}).must_equal({"name" => "Alice", "age" => 25, "city" => "Stockholm"})
  end

  it 'returnerar {"a" => 99, "b" => 2} för input ({"a" => 1, "b" => 2}, {"a" => 99})' do
    StudentMethods.send(FUNCTION, {"a" => 1, "b" => 2}, {"a" => 99}).must_equal({"a" => 99, "b" => 2})
  end

  it 'returnerar {"x" => 10} för input ({}, {"x" => 10})' do
    StudentMethods.send(FUNCTION, {}, {"x" => 10}).must_equal({"x" => 10})
  end

  it 'returnerar {"x" => 10} för input ({"x" => 10}, {})' do
    StudentMethods.send(FUNCTION, {"x" => 10}, {}).must_equal({"x" => 10})
  end

  it 'returnerar {"a" => 1, "b" => 2, "c" => 3} för input ({"a" => 1}, {"b" => 2, "c" => 3})' do
    StudentMethods.send(FUNCTION, {"a" => 1}, {"b" => 2, "c" => 3}).must_equal({"a" => 1, "b" => 2, "c" => 3})
  end

  it 'returnerar {"name" => "Bob", "age" => 30} för input ({"name" => "Alice", "age" => 25}, {"name" => "Bob", "age" => 30})' do
    StudentMethods.send(FUNCTION, {"name" => "Alice", "age" => 25}, {"name" => "Bob", "age" => 30}).must_equal({"name" => "Bob", "age" => 30})
  end

  it 'returnerar {"a" => 5, "b" => 10, "c" => 15} för input ({"a" => 1, "b" => 2}, {"b" => 10, "c" => 15, "a" => 5})' do
    StudentMethods.send(FUNCTION, {"a" => 1, "b" => 2}, {"b" => 10, "c" => 15, "a" => 5}).must_equal({"a" => 5, "b" => 10, "c" => 15})
  end

end
