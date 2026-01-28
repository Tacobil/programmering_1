require_relative 'spec_helper'

FUNCTION = 'frequency_counter'
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
               "Du behöver definera funktionen #{FUNCTION} i #{PATH}")
  end

  it "takes #{ARITY.humanize} argument" do
    message = "Funktionen #{FUNCTION} måste ta #{ARITY} argument"
    assert_equal ARITY, method(FUNCTION.to_sym).arity, message
  end

  it 'returnerar en hash för input (["a", "b", "a", "c", "a"])' do
    result = StudentMethods.send(FUNCTION, ["a", "b", "a", "c", "a"])
    result.must_be_instance_of Hash
    result.must_equal({"a" => 3, "b" => 1, "c" => 1})
  end

  it 'returnerar en hash för input (["hello", "world", "hello"])' do
    result = StudentMethods.send(FUNCTION, ["hello", "world", "hello"])
    result.must_equal({"hello" => 2, "world" => 1})
  end

  it 'returnerar en tom hash för input ([])' do
    result = StudentMethods.send(FUNCTION, [])
    result.must_equal({})
  end

  it 'returnerar en hash för input ([1, 2, 3, 2, 1, 2])' do
    result = StudentMethods.send(FUNCTION, [1, 2, 3, 2, 1, 2])
    result.must_equal({1 => 2, 2 => 3, 3 => 1})
  end

  it 'returnerar en hash för input (["apple", "banana", "apple", "cherry", "banana", "apple"])' do
    result = StudentMethods.send(FUNCTION, ["apple", "banana", "apple", "cherry", "banana", "apple"])
    result.must_equal({"apple" => 3, "banana" => 2, "cherry" => 1})
  end

  it 'returnerar en hash för input (["x", "x", "x", "x"])' do
    result = StudentMethods.send(FUNCTION, ["x", "x", "x", "x"])
    result.must_equal({"x" => 4})
  end

  it 'returnerar en hash för input ([5, 10, 15, 10, 5, 10, 15, 5])' do
    result = StudentMethods.send(FUNCTION, [5, 10, 15, 10, 5, 10, 15, 5])
    result.must_equal({5 => 3, 10 => 3, 15 => 2})
  end

  it 'returnerar en hash för input (["cat", "dog", "bird", "cat", "fish", "dog", "cat"])' do
    result = StudentMethods.send(FUNCTION, ["cat", "dog", "bird", "cat", "fish", "dog", "cat"])
    result.must_equal({"cat" => 3, "dog" => 2, "bird" => 1, "fish" => 1})
  end

end
