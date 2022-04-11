class Archive < ApplicationRecord
  belongs_to :contracts


    def self.import(file)
      @contract_saver = Hash[]
      @contract_data = Hash[]
      @errors = Hash[]
      spreadsheet = openspreadsheet(file)
      headers = spreadsheet.row(1)

      spreadsheet.each_with_index do |row, idx|

        next if idx == 0 # skip header
        # create hash from headers and cells
        @shipp_data = Hash[[headers, row].transpose]
        headers.each do |header|
          select_model_data(header)
        end
        validate_data(@contract_data, idx)

      #   if User.new(@user_data).invalid?
      #     error[idx] = ["On row #{idx}", User.create(@user_data).errors.full_messages]
      #   else
      #     @data_saver[idx] = User.new(@user_data)
      #   end
      # end
      # if error.any?
      #   return error
      # else
      #   @data_saver.compact.each do |user_data|
      #     user_data.save
      #   end
      #   return "success"
      # end
      end
      return @shipp_data
    end

    def self.openspreadsheet(file)
      case File.extname(file.original_filename)
      when ".csv" then  Roo::Spreadsheet.open(file.path, extension: :csv)
      when ".xls" then Roo::Spreadsheet.open(file.path, extension: :xls)
      when ".xlsx" then Roo::Spreadsheet.open(file.path,extension: :xlsx)
      else raise "unkown file format"
      end
    end

    #To select the model data looking for substring
    def self.select_model_data(key)
      case
      when key.include?("address_") then  @contract_data[key.remove("address_")] = @shipp_data[key]

      end
      # code
    end

    #To use the model's validations for the data and store the data to save it
    def self.validate_data(address_data, parcel_data, order_data, key)

      case
      when Contract.new(address_data).invalid? then   @errors[key] = ["On row #{key}", contract.create(address_data).errors.full_messages]
      else
        @Contract_saver[key] = address_data
      end
    end
end
