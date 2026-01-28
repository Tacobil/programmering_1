require_relative 'spec_helper'

FUNCTION = 'create_user'
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

  it 'returnerar en hash för input ("Alice", 25, "Stockholm")' do
    result = StudentMethods.send(FUNCTION, "Alice", 25, "Stockholm")
    result.must_be_instance_of Hash
    result.must_equal({"name" => "Alice", "age" => 25, "city" => "Stockholm"})
  end

  it 'returnerar en hash för input ("Bob", 30, "Göteborg")' do
    result = StudentMethods.send(FUNCTION, "Bob", 30, "Göteborg")
    result.must_equal({"name" => "Bob", "age" => 30, "city" => "Göteborg"})
  end

  it 'returnerar en hash för input ("Charlie", 17, "Malmö")' do
    result = StudentMethods.send(FUNCTION, "Charlie", 17, "Malmö")
    result.must_equal({"name" => "Charlie", "age" => 17, "city" => "Malmö"})
  end

  it 'returnerar en hash för input ("", 0, "")' do
    result = StudentMethods.send(FUNCTION, "", 0, "")
    result.must_equal({"name" => "", "age" => 0, "city" => ""})
  end

  it 'returnerar en hash för input ("Diana", 42, "Uppsala")' do
    result = StudentMethods.send(FUNCTION, "Diana", 42, "Uppsala")
    result.must_equal({"name" => "Diana", "age" => 42, "city" => "Uppsala"})
  end

  it 'returnerar en hash för input ("Erik", 18, "Lund")' do
    result = StudentMethods.send(FUNCTION, "Erik", 18, "Lund")
    result.must_equal({"name" => "Erik", "age" => 18, "city" => "Lund"})
  end

end
