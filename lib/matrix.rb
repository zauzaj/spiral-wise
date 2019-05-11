require 'pry-rails'
class Matrix
  attr_reader :result

  def initialize(x, y)
    @weight = x
    @height = y
    @result = []
  end

  def output
    matrix = @matrix.dup
    layered(matrix)

    @result
  end

  def generate
    nums = (1..@height*@weight).to_a

    @matrix = Array.new(@height){Array.new(@weight)}

    i = 0
    @matrix.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        @matrix[row_index][col_index] = nums[i]
        i += 1
      end
      p row
    end

    @matrix
  end

  private
  def layered(matrix)
    #always get first row and remove it from matrix
    @result.push(*matrix.shift)
    #generate new matrix
    m = matrix.transpose
    #set last row as first
    m = m.reverse

    matrix.empty? ? @result : layered(m)
  end
end