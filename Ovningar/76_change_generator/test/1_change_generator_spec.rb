require_relative 'spec_helper'

FUNCTION = 'change_generator'
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

  it 'returnerar en hash för input (287)' do
    result = StudentMethods.send(FUNCTION, 287)
    result.must_be_instance_of Hash
    result.must_equal({200 => 1, 50 => 1, 20 => 1, 10 => 1, 5 => 1, 2 => 1})
  end

  it 'returnerar en hash för input (1500)' do
    result = StudentMethods.send(FUNCTION, 1500)
    result.must_equal({1000 => 1, 500 => 1})
  end

  it 'returnerar en hash för input (1)' do
    result = StudentMethods.send(FUNCTION, 1)
    result.must_equal({1 => 1})
  end

  it 'returnerar en hash för input (999)' do
    result = StudentMethods.send(FUNCTION, 999)
    result.must_equal({500 => 1, 200 => 2, 50 => 1, 20 => 2, 5 => 1, 2 => 2})
  end

  it 'returnerar en hash för input (100)' do
    result = StudentMethods.send(FUNCTION, 100)
    result.must_equal({100 => 1})
  end

  it 'returnerar en hash för input (73)' do
    result = StudentMethods.send(FUNCTION, 73)
    result.must_equal({50 => 1, 20 => 1, 2 => 1, 1 => 1})
  end

  it 'returnerar en hash för input (2500)' do
    result = StudentMethods.send(FUNCTION, 2500)
    result.must_equal({1000 => 2, 500 => 1})
  end

  it 'returnerar en hash för input (467)' do
    result = StudentMethods.send(FUNCTION, 467)
    result.must_equal({200 => 2, 50 => 1, 10 => 1, 5 => 1, 2 => 1})
  end

  it 'returnerar en hash för input (3847)' do
    result = StudentMethods.send(FUNCTION, 3847)
    result.must_equal({1000 => 3, 500 => 1, 200 => 1, 100 => 1, 20 => 2, 5 => 1, 2 => 1})
  end

  it 'returnerar en hash för input (55)' do
    result = StudentMethods.send(FUNCTION, 55)
    result.must_equal({50 => 1, 5 => 1})
  end

  it 'returnerar en hash för input (8)' do
    result = StudentMethods.send(FUNCTION, 8)
    result.must_equal({5 => 1, 2 => 1, 1 => 1})
  end

end
