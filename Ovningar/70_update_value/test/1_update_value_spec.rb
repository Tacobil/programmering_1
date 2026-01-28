require_relative 'spec_helper'

FUNCTION = 'update_value'
ARITY = 3
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

  it 'returnerar {"Alice" => 26, "Bob" => 30} för input ({"Alice" => 25, "Bob" => 30}, "Alice", 26)' do
    StudentMethods.send(FUNCTION, {"Alice" => 25, "Bob" => 30}, "Alice", 26).must_equal({"Alice" => 26, "Bob" => 30})
  end

  it 'returnerar {"milk" => 18, "bread" => 25} för input ({"milk" => 15, "bread" => 25}, "milk", 18)' do
    StudentMethods.send(FUNCTION, {"milk" => 15, "bread" => 25}, "milk", 18).must_equal({"milk" => 18, "bread" => 25})
  end

  it 'returnerar {"player1" => 100, "player2" => 250} för input ({"player1" => 100, "player2" => 200}, "player2", 250)' do
    StudentMethods.send(FUNCTION, {"player1" => 100, "player2" => 200}, "player2", 250).must_equal({"player1" => 100, "player2" => 250})
  end

  it 'returnerar {"x" => 0, "y" => 10} för input ({"x" => 5, "y" => 10}, "x", 0)' do
    StudentMethods.send(FUNCTION, {"x" => 5, "y" => 10}, "x", 0).must_equal({"x" => 0, "y" => 10})
  end

  it 'returnerar {"name" => "Alice", "age" => 30} för input ({"name" => "Alice", "age" => 25}, "age", 30)' do
    StudentMethods.send(FUNCTION, {"name" => "Alice", "age" => 25}, "age", 30).must_equal({"name" => "Alice", "age" => 30})
  end

  it 'returnerar {"status" => "inactive"} för input ({"status" => "active"}, "status", "inactive")' do
    StudentMethods.send(FUNCTION, {"status" => "active"}, "status", "inactive").must_equal({"status" => "inactive"})
  end

end
