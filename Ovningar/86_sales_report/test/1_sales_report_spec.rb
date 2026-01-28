require_relative 'spec_helper'
require "fileutils"

PATH = "sales_report.rb"
RELATIVE_PATH = File.join("..", PATH)
STARTING_DIR = Dir.pwd

describe "sales_report" do

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

  it 'filen finns' do
    assert File.exist?(PATH), "Du behöver skapa filen #{PATH}"
    require_relative RELATIVE_PATH
  end

  it "har en funktion som heter parse" do
    wrap_function_in_namespace
    assert(StudentMethods.instance_methods.include?(:parse),
               "Du behöver definera funktionen parse i #{PATH}")
  end

  it "parse tar ett argument" do
    message = "Funktionen parse måste ta 1 argument"
    assert_equal 1, method(:parse).arity, message
  end

  it "har en funktion som heter sales_report" do
    wrap_function_in_namespace
    assert(StudentMethods.instance_methods.include?(:sales_report),
               "Du behöver definera funktionen sales_report i #{PATH}")
  end

  it "sales_report tar ett argument" do
    message = "Funktionen sales_report måste ta 1 argument"
    assert_equal 1, method(:sales_report).arity, message
  end

  it 'parse returnerar en array av hashes' do
    result = StudentMethods.send(:parse, "./test/sales_data/januari.csv")
    assert_instance_of Array, result
    assert_instance_of Hash, result[0]
  end

  it 'parse skapar korrekt struktur' do
    result = StudentMethods.send(:parse, "./test/sales_data/januari.csv")
    assert_equal "Äpple", result[0]["produkt"]
    assert_equal 10, result[0]["antal"]
    assert_equal 5.0, result[0]["pris"]
  end

  it 'parse hanterar alla rader' do
    result = StudentMethods.send(:parse, "./test/sales_data/januari.csv")
    assert_equal 3, result.length
  end

  it 'parse returnerar tom array för tom fil' do
    result = StudentMethods.send(:parse, "./test/sales_data/tom.csv")
    assert_equal [], result
  end

  it 'sales_report beräknar försäljning per produkt' do
    data = StudentMethods.send(:parse, "./test/sales_data/januari.csv")
    result = StudentMethods.send(:sales_report, data)
    assert_equal 50.0, result["Äpple"]
    assert_equal 15.0, result["Banan"]
    assert_equal 54.0, result["Apelsin"]
  end

  it 'sales_report returnerar tom hash för tom data' do
    result = StudentMethods.send(:sales_report, [])
    assert_equal({}, result)
  end

end
