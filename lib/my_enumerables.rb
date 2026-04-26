# frozen_string_literal: true

module Enumerable
  # Letakkan semua method my_ (kecuali my_each) di sini
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    index = 0
    my_each do |item|
      yield(item, index)
      index += 1
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    result = []
    my_each { |item| result << item if yield(item) }
    result
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?

    my_each { |item| return false unless yield(item) }
    true
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?

    my_each { |item| return true if yield(item) }
    false
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?

    my_each { |item| return false if yield(item) }
    true
  end

  def my_count
    return size unless block_given?

    count = 0
    my_each { |item| count += 1 if yield(item) }
    count
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    result = []
    my_each { |item| result << yield(item) }
    result
  end

  def my_inject(initial_value)
    accumulator = initial_value
    my_each { |item| accumulator = yield(accumulator, item) }
    accumulator
  end
end

class Array
  # my_each MESTI ada dalam class Array
  def my_each
    return to_enum(:my_each) unless block_given?

    for item in self
      yield(item)
    end
    self
  end
end