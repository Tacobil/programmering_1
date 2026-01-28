require_relative 'spec_helper'

FUNCTION = 'get_values'
ARITY = 1
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
               "Du behöver definiera funktionen #{FUNCTION} i #{PATH}")
  end

  it "takes #{ARITY.humanize} argument" do
    message = "Funktionen #{FUNCTION} måste ta #{ARITY} argument"
    assert_equal ARITY, method(FUNCTION.to_sym).arity, message
  end

  it 'returnerar [25, 30] för input {"Alice" => 25, "Bob" => 30}' do
    StudentMethods.send(FUNCTION, {"Alice" => 25, "Bob" => 30}).must_equal [25, 30]
  end

  it 'returnerar [] för input {}' do
    StudentMethods.send(FUNCTION, {}).must_equal []
  end

  it 'returnerar [15, 25, 30] för input {"milk" => 15, "bread" => 25, "eggs" => 30}' do
    StudentMethods.send(FUNCTION, {"milk" => 15, "bread" => 25, "eggs" => 30}).must_equal [15, 25, 30]
  end

  it 'returnerar [100] för input {"player1" => 100}' do
    StudentMethods.send(FUNCTION, {"player1" => 100}).must_equal [100]
  end

  it 'returnerar ["Alice", 25, "Stockholm"] för input {"name" => "Alice", "age" => 25, "city" => "Stockholm"}' do
    StudentMethods.send(FUNCTION, {"name" => "Alice", "age" => 25, "city" => "Stockholm"}).must_equal ["Alice", 25, "Stockholm"]
  end

  it 'returnerar [1, 2, 3, 4] för input {"a" => 1, "b" => 2, "c" => 3, "d" => 4}' do
    StudentMethods.send(FUNCTION, {"a" => 1, "b" => 2, "c" => 3, "d" => 4}).must_equal [1, 2, 3, 4]
  end

end
