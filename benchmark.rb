require 'benchmark'
require_relative 'credit_card'
require 'yaml'

card_numbers = YAML.load_file 'spec/test_numbers.yml'

Benchmark.bmbm do |bench|

  bench.report('first') do
    card_numbers.each do |x, numbers|
      numbers.each do |number|
        card = CreditCard.new(number, nil, nil, nil)
        card.validate_checksum
      end
    end
  end

  bench.report('second') do
    card_numbers.each do |x, numbers|
      numbers.each do |number|
        card = CreditCard.new(number, nil, nil, nil)
        card.validate_checksum_second
      end
    end
  end

end
