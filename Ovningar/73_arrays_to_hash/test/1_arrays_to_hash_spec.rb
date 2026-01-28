require_relative 'spec_helper'

FUNCTION = 'arrays_to_hash'
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

  it 'returnerar en hash för input (["name", "age"], ["Alice", 25])' do
    result = StudentMethods.send(FUNCTION, ["name", "age"], ["Alice", 25])
    result.must_be_instance_of Hash
    result.must_equal({"name" => "Alice", "age" => 25})
  end

  it 'returnerar en hash för input (["a", "b", "c"], [1, 2, 3])' do
    result = StudentMethods.send(FUNCTION, ["a", "b", "c"], [1, 2, 3])
    result.must_equal({"a" => 1, "b" => 2, "c" => 3})
  end

  it 'returnerar en tom hash för input ([], [])' do
    result = StudentMethods.send(FUNCTION, [], [])
    result.must_equal({})
  end

  it 'returnerar en hash för input (["red", "green", "blue"], ["#FF0000", "#00FF00", "#0000FF"])' do
    result = StudentMethods.send(FUNCTION, ["red", "green", "blue"], ["#FF0000", "#00FF00", "#0000FF"])
    result.must_equal({"red" => "#FF0000", "green" => "#00FF00", "blue" => "#0000FF"})
  end

  it 'returnerar en hash med många element' do
    keys = ["apple", "banana", "cherry", "date", "elderberry"]
    values = [10, 20, 30, 40, 50]
    expected = {"apple" => 10, "banana" => 20, "cherry" => 30, "date" => 40, "elderberry" => 50}
    result = StudentMethods.send(FUNCTION, keys, values)
    result.must_equal(expected)
  end

  it 'returnerar en hash för input (["x", "y"], [100, 200])' do
    result = StudentMethods.send(FUNCTION, ["x", "y"], [100, 200])
    result.must_equal({"x" => 100, "y" => 200})
  end

  it 'returnerar en hash för input (["first"], ["value"])' do
    result = StudentMethods.send(FUNCTION, ["first"], ["value"])
    result.must_equal({"first" => "value"})
  end

  it 'returnerar en hash med sju element' do
    keys = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    values = [1, 2, 3, 4, 5, 6, 7]
    expected = {"Monday" => 1, "Tuesday" => 2, "Wednesday" => 3, "Thursday" => 4, "Friday" => 5, "Saturday" => 6, "Sunday" => 7}
    result = StudentMethods.send(FUNCTION, keys, values)
    result.must_equal(expected)
  end

end
