require_relative 'spec_helper'

FUNCTION = 'add_entry'
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

  it 'lägger till nyckel-värde-par i hash' do
    hash = {"Alice" => "070-123"}
    result = StudentMethods.send(FUNCTION, hash, "Bob", "070-456")
    result.must_equal({"Alice" => "070-123", "Bob" => "070-456"})
  end

  it 'lägger till nyckel-värde-par i tom hash' do
    hash = {}
    result = StudentMethods.send(FUNCTION, hash, "first", "value")
    result.must_equal({"first" => "value"})
  end

  it 'lägger till nyckel-värde-par med heltal som värde' do
    hash = {"milk" => 15}
    result = StudentMethods.send(FUNCTION, hash, "bread", 25)
    result.must_equal({"milk" => 15, "bread" => 25})
  end

  it 'lägger till nyckel-värde-par i hash med flera element' do
    hash = {"a" => 1, "b" => 2}
    result = StudentMethods.send(FUNCTION, hash, "c", 3)
    result.must_equal({"a" => 1, "b" => 2, "c" => 3})
  end

  it 'lägger till nyckel-värde-par med nil som värde' do
    hash = {"x" => 10}
    result = StudentMethods.send(FUNCTION, hash, "y", nil)
    result.must_equal({"x" => 10, "y" => nil})
  end

end
