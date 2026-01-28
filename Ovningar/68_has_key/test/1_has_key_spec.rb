require_relative 'spec_helper'

FUNCTION = 'has_key'
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

  it 'returnerar true för input ({"Alice" => 25, "Bob" => 30}, "Alice")' do
    StudentMethods.send(FUNCTION, {"Alice" => 25, "Bob" => 30}, "Alice").must_equal true
  end

  it 'returnerar false för input ({"Alice" => 25, "Bob" => 30}, "Charlie")' do
    StudentMethods.send(FUNCTION, {"Alice" => 25, "Bob" => 30}, "Charlie").must_equal false
  end

  it 'returnerar false för input ({}, "test")' do
    StudentMethods.send(FUNCTION, {}, "test").must_equal false
  end

  it 'returnerar true för input ({"milk" => 15, "bread" => 25}, "milk")' do
    StudentMethods.send(FUNCTION, {"milk" => 15, "bread" => 25}, "milk").must_equal true
  end

  it 'returnerar true för input ({"x" => 1, "y" => 2, "z" => 3}, "z")' do
    StudentMethods.send(FUNCTION, {"x" => 1, "y" => 2, "z" => 3}, "z").must_equal true
  end

  it 'returnerar false för input ({"a" => 1}, "b")' do
    StudentMethods.send(FUNCTION, {"a" => 1}, "b").must_equal false
  end

  it 'returnerar true för input ({"name" => "Alice", "age" => 25}, "age")' do
    StudentMethods.send(FUNCTION, {"name" => "Alice", "age" => 25}, "age").must_equal true
  end

end
