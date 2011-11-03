module ContentOfRowFetcher
  def content_of_row(row)
    columns = []
    
    1.upto(last_column) do |column|
      columns << cell(row, column)
    end

    columns
  end
end