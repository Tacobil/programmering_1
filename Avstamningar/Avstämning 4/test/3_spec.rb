require_relative 'spec_helper'

FUNCTION = 'is_sorted_descending'
ARITY = 1
PATH = "3.rb"
RELATIVE_PATH = File.join("..", PATH)

describe FUNCTION do

  module StudentMethods; end

  def wrap_function_in_namespace
    StudentMethods.module_eval(File.read(PATH), __FILE__, __LINE__)
  end

  def self.test_order
    :alpha
  end

  it 'exists' do
    require_relative RELATIVE_PATH
    assert File.exist?(PATH), "Du behöver skapa filen #{PATH}"
  end

  it "has a function named #{FUNCTION}" do
    wrap_function_in_namespace
    assert(StudentMethods.instance_methods.include?(FUNCTION.to_sym),
      "Du behöver definera funktionen #{FUNCTION} i #{PATH}")
  end

  it "takes #{ARITY.humanize} argument#{ARITY > 1 ? "s" : ""}" do
    message = "Funktionen #{FUNCTION} måste ta #{ARITY} argument"
    assert_equal ARITY, StudentMethods.method(FUNCTION.to_sym).arity, message
  end
end
