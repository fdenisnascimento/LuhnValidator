require 'luhn/validator/version'

module Luhn
  module Validator
    def self.checksum(number)
      number = number.to_s.delete('-')
      products = luhn_doubled(number)
      sum = products.inject(0) { |t, p| t + sum_of(p) }
      checksum = 10 - (sum % 10)
      checksum == 10 ? 0 : checksum
    end

    def self.luhn_doubled(number)
      number = number.to_s.delete('-')
      numbers = split_digits(number).reverse
      numbers.map.with_index do |n, i|
        i.even? ? n * 2 : n * 1
      end.reverse
    end

    def self.sum_of(number)
      number = number.to_s.delete('-')
      split_digits(number).inject(:+)
    end

    def self.valid?(number)
      number = number.to_s.delete('-')
      numbers = split_digits(number)
      numbers.pop == checksum(numbers.join)
    end

    def self.split_digits(number)
      number = number.to_s.delete('-')
      number.to_s.split(//).map(&:to_i)
    end
  end
end
