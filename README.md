##About:

This is a lightweight gem used to:
1. find the distance (in meters or miles) between a base point and any other point using latitude/longitude values. 
2. You can also find the closest point from a pool of points to the base point. 

##Installation:

###using command line:
    gem install geoproximity-monster

###using bundler:
    gem 'geoproximity-monster'


##Usage Example:

    puts "### Examples: ###################################################\n"
    puts "./console_example.rb -t 1 -lat1 41.902298 -long1 -88.0937347 -lat2 51.8 -long2 -89.0937347\n"
    puts "./console_example.rb -t 2 -lat1 41.902298 -long1 -88.0937347\n"
    puts "#################################################################\n\n\n"

    lat1 , long1, lat2 , long2 = nil , nil , nil , nil
    pool = []
    type = -1
    ARGV.each_with_index do |arg, i|
      if arg.to_s.strip =~ /^\-t$/
        if ARGV[i+1].to_s == "1"
          type = 1
        else
          type = 2
        end
        break
      else
        puts "Oops! it seems that you forgot to enter transaction type (ex:  -t 1)."
        exit
      end
    end

    ARGV.each_with_index do |arg, i|
      lat1  = ARGV[i+1] if arg.to_s.strip =~ /^\-lat1$/
      long1 = ARGV[i+1] if arg.to_s.strip =~ /^\-long1$/
      lat2  = ARGV[i+1] if arg.to_s.strip =~ /^\-lat2$/
      long2 = ARGV[i+1] if arg.to_s.strip =~ /^\-long2$/
    end

    if type.to_s == "1"
      if lat1.nil? || long1.nil?
        puts "Oops! it seems that you forgot to enter latitude and longitude value for the base point."
      elsif lat2.nil? || long2.nil?
        puts "Oops! it seems that you forgot to enter latitude and longitude value for the second point."
      else
        geo_proximity_monster = GeoProximityMonster.new(lat1 , long2)
        distance_result = geo_proximity_monster.get_distance_to(lat2 , long2)
        puts "\ndistance = #{distance_result.inspect} meters.\n\n"
        distance_result = geo_proximity_monster.get_distance_to(lat2 , long2 , {:unit => :miles})
        puts "\ndistance = #{distance_result.inspect} miles.\n"
      end
    elsif type.to_s == "2"
      if lat1.nil? || long1.nil?
        puts "Oops! it seems that you forgot to enter latitude and longitude value for the base point."
      else
        pool = [
          { :latitude => 41.902298 , :longitude => -87.6454239 },
          { :latitude => 31.89171 , :longitude => 57.24567 },
          { :latitude => 67.1987 , :longitude => 87.64559 },
        { :latitude => 11.171 , :longitude => -13.23911 }
      ]
      geo_proximity_monster = GeoProximityMonster.new(lat1 , long2)
      closest_loc = geo_proximity_monster.get_closet_from_pool( pool )
      puts "\nclosest_location = #{closest_loc.inspect}\n\n"
    end


## Changelog

Look at the [CHANGELOG](https://github.com/aghyad/geoproximity-monster/blob/master/CHANGELOG.md) to see what's changed.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

##Contact:

Download and install the gem from "https://rubygems.org/gems/csv-monster"

Feel free to contact me at: contact AT aghyadsaleh DOT com
