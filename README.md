##About:

This is a lightweight gem used to access CSV files and return an object (array of hashes) containing the data. 
This gem assumes that the first line of the file contains the headers names (the attributes names).

##Installation:

###using command line:
    gem install csv-monster

###using bundler:
    gem 'csv-monster'


##Usage Example:

    input_file = "/path/to/the/CSV/file.csv"
    delimiter = ","
    unless input_file.nil?
      csv_monster = CSVMonster.new(input_file , delimiter)
      result = csv_monster.parse_csv
      puts "CSV Monster finished crunching your CSV file \"#{input_file}\" Successfully!\n\n"
      puts "The result set has #{result.size} records.\n\n"
      puts "The CSV Monster recognized the following set of attributes:\n#{csv_monster.object_attributes.map{|a| a.to_sym}}\n\n"
      puts "This is a sample of the csv data:\n#{result[2].inspect}\n\n"
    else
      puts "Oops! it seems that the input file doesn't exist, or, may be it was kidnapped by Loki, the bad brother of Thor!"
    end

## Changelog

Look at the [CHANGELOG](https://github.com/aghyad/csv-monster/blob/master/CHANGELOG.md) to see what's changed.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

##Contact:

Download and install the gem from "https://rubygems.org/gems/csv-monster"

Feel free to contact me at: contact AT aghyadsaleh DOT com
