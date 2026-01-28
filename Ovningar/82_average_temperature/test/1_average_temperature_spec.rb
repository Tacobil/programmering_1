require_relative 'spec_helper'

FUNCTION = 'average_temperature'
ARITY = 1
PATH = File.join(FUNCTION+".rb")
RELATIVE_PATH = File.join("..", PATH)
STARTING_DIR = Dir.pwd

describe FUNCTION do

  def self.test_order
    :alpha
  end

  before do
    Dir.chdir(STARTING_DIR)
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
               "Du behöver definera funktionen #{FUNCTION} i #{PATH}")  end

  it "takes #{ARITY.humanize} argument#{ARITY > 1 ? "s" : ""}" do
    message = "Funktionen #{FUNCTION} måste ta #{ARITY} argument"
    assert_equal ARITY, method(FUNCTION.to_sym).arity, message
  end

  it 'räknar ut medeltemperaturen för alla temperaturfiler i mappen' do
    StudentMethods.send(FUNCTION, "./readings/april").must_be_within_delta(6.5, 0.1)
  end

  it 'returnerar "Mappen finns inte." om mappen inte finns' do
    StudentMethods.send(FUNCTION, "./readings/june").must_equal "Mappen finns inte."
  end

  it 'returnerar "Inga temperaturfiler hittades." om mappen inte innehåller .temps-filer' do
    StudentMethods.send(FUNCTION, "./readings/may").must_equal "Inga temperaturfiler hittades."
  end


end
