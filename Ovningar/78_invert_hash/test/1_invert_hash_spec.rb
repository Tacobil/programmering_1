require_relative 'spec_helper'

FUNCTION = 'invert_hash'
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

  it 'returnerar {"äpple" => "apple", "banan" => "banana", "apelsin" => "orange"} för input ({"apple" => "äpple", "banana" => "banan", "orange" => "apelsin"})' do
    StudentMethods.send(FUNCTION, {"apple" => "äpple", "banana" => "banan", "orange" => "apelsin"}).must_equal({"äpple" => "apple", "banan" => "banana", "apelsin" => "orange"})
  end

  it 'returnerar {25 => "Alice", 30 => "Bob"} för input ({"Alice" => 25, "Bob" => 30})' do
    StudentMethods.send(FUNCTION, {"Alice" => 25, "Bob" => 30}).must_equal({25 => "Alice", 30 => "Bob"})
  end

  it 'returnerar {} för input ({})' do
    StudentMethods.send(FUNCTION, {}).must_equal({})
  end

  it 'returnerar {1 => "a", 2 => "b", 3 => "c"} för input ({"a" => 1, "b" => 2, "c" => 3})' do
    StudentMethods.send(FUNCTION, {"a" => 1, "b" => 2, "c" => 3}).must_equal({1 => "a", 2 => "b", 3 => "c"})
  end

  it 'returnerar {"Stockholm" => "Sweden", "Oslo" => "Norway"} för input ({"Sweden" => "Stockholm", "Norway" => "Oslo"})' do
    StudentMethods.send(FUNCTION, {"Sweden" => "Stockholm", "Norway" => "Oslo"}).must_equal({"Stockholm" => "Sweden", "Oslo" => "Norway"})
  end

  it 'returnerar {10 => "x"} för input ({"x" => 10})' do
    StudentMethods.send(FUNCTION, {"x" => 10}).must_equal({10 => "x"})
  end

  it 'returnerar {"red" => "color", "circle" => "shape"} för input ({"color" => "red", "shape" => "circle"})' do
    StudentMethods.send(FUNCTION, {"color" => "red", "shape" => "circle"}).must_equal({"red" => "color", "circle" => "shape"})
  end

  it 'returnerar {100 => "a", 200 => "b", 300 => "c"} för input ({"a" => 100, "b" => 200, "c" => 300})' do
    StudentMethods.send(FUNCTION, {"a" => 100, "b" => 200, "c" => 300}).must_equal({100 => "a", 200 => "b", 300 => "c"})
  end

end
