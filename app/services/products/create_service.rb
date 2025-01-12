require 'csv'
require 'date'

module Products
  class CreateService
    def initialize(file)
      @file = file
    end

    def call
      csv_parser
      create_product if verify_rows
    end

    private

    def csv_parser
      csv_options = {
        headers: true,
        col_sep: ';',
        encoding: 'ISO-8859-1'
      }
      @csv_content = CSV.parse(@file.read, **csv_options)
    end

    def verify_rows
      @csv_content.size <= 200000
    end

    def create_product
      @csv_content.each do |row|
        name = row['name']
        expiration = row['expiration']
        price = row['price']

        next unless name.present? && expiration.present? && price.present?

        begin
          expiration_date = Date.strptime(expiration, '%m/%d/%Y')
        rescue ArgumentError
          next
        end

        price = price.gsub('$', '').to_f

        product = Product.create!(
          name: name,
          expiration: expiration_date
        )
        Prices::CreateService.new(product, price).call
      end
    end
  end
end
