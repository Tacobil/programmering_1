require_relative 'spec_helper'

FUNCTION = 'arabic_to_roman'
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

  it 'returnerar "IX" för input (9)' do
    result = StudentMethods.send(FUNCTION, 9)
    result.must_be_instance_of String
    result.must_equal("IX")
  end

  it 'returnerar "LVIII" för input (58)' do
    result = StudentMethods.send(FUNCTION, 58)
    result.must_equal("LVIII")
  end

  it 'returnerar "MCMXCIV" för input (1994)' do
    result = StudentMethods.send(FUNCTION, 1994)
    result.must_equal("MCMXCIV")
  end

  it 'returnerar "MMMDCCXLIX" för input (3749)' do
    result = StudentMethods.send(FUNCTION, 3749)
    result.must_equal("MMMDCCXLIX")
  end

  it 'returnerar "I" för input (1)' do
    result = StudentMethods.send(FUNCTION, 1)
    result.must_equal("I")
  end

  it 'returnerar "MMMCMXCIX" för input (3999)' do
    result = StudentMethods.send(FUNCTION, 3999)
    result.must_equal("MMMCMXCIX")
  end

  it 'returnerar "IV" för input (4)' do
    result = StudentMethods.send(FUNCTION, 4)
    result.must_equal("IV")
  end

  it 'returnerar "XL" för input (40)' do
    result = StudentMethods.send(FUNCTION, 40)
    result.must_equal("XL")
  end

  it 'returnerar "CD" för input (400)' do
    result = StudentMethods.send(FUNCTION, 400)
    result.must_equal("CD")
  end

  it 'returnerar "CM" för input (900)' do
    result = StudentMethods.send(FUNCTION, 900)
    result.must_equal("CM")
  end

  it 'returnerar "MMXXIV" för input (2024)' do
    result = StudentMethods.send(FUNCTION, 2024)
    result.must_equal("MMXXIV")
  end

  it 'returnerar "DCCCXC" för input (890)' do
    result = StudentMethods.send(FUNCTION, 890)
    result.must_equal("DCCCXC")
  end

end
