require 'pry-rails'
class Matrix
  def initialize(x, y)
    @weight = x
    @height = y
  end

  def generate
    nums = (1..@height*@weight).to_a

    arr = Array.new(@height){Array.new(@weight)}

    i = 0
    arr.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        arr[row_index][col_index] = nums[i]
        i += 1
      end
      p row
    end

    @matrix = arr
  end
end
puts 'Enter width and height: '
Matrix.new(gets.to_i, gets.to_i).generate