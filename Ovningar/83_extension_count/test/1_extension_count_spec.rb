require_relative 'spec_helper'
require "fileutils"

FUNCTION = 'extension_count'
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
               "Du behöver definera funktionen #{FUNCTION} i #{PATH}")
  end

  it "takes #{ARITY.humanize} argument#{ARITY > 1 ? "s" : ""}" do
    message = "Funktionen #{FUNCTION} måste ta #{ARITY} argument"
    assert_equal ARITY, method(FUNCTION.to_sym).arity, message
  end

  it 'räknar filändelser korrekt' do
    result = StudentMethods.send(FUNCTION, "./test/files")
    expected = {".txt" => 2, ".rb" => 1, ".png" => 1, ".gurka" => 1}
    assert_equal expected, result
  end

  it 'returnerar tom hash för tomma mappar' do
    FileUtils.mkdir_p "./test/files/tom_mapp"
    result = StudentMethods.send(FUNCTION, "./test/files/tom_mapp")
    assert_equal({}, result)
  end

  it 'hanterar filer utan filändelse' do
    result = StudentMethods.send(FUNCTION, "./test/files/utan_extension")
    assert_equal 1, result[""]
  end

end
