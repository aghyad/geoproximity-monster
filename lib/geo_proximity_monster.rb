class GeoProximityMonster
  attr_reader :loc_1_lat, :loc_1_long

  def initialize( lat1 , long1 )
    @loc_1_lat  = lat1
    @loc_1_long = long1
  end

  def get_distance_to( lat2 , long2 , options = {:unit => :meters})
    a = [loc_1_lat.to_f , loc_1_long.to_f]
    b = [lat2.to_f , long2.to_f]
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters
    dlon_rad = (b[1].to_f-a[1].to_f) * rad_per_deg  # Delta, converted to rad
    dlat_rad = (b[0].to_f-a[0].to_f) * rad_per_deg
    lat1_rad, lon1_rad = a.map! {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = b.map! {|i| i * rad_per_deg }
    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math.asin(Math.sqrt(a))
    return rm * c if options[:unit] == :meters # Delta in meters
    return ((rm * c).to_f)*(0.000621371) if options[:unit] == :miles # Delta in miles
  end

  def get_closet_from_pool( pool = [])
    pool_locations = pool
    closest_loc = nil
    smallest_distance = nil
    unless pool_locations.empty?
      pool_locations.each do |this_loc|
        this_distance = get_distance_to( this_loc[:latitude] , this_loc[:longitude] )
        if smallest_distance.nil?
          smallest_distance = this_distance
          closest_loc = this_loc
        else
          if this_distance.abs < smallest_distance.abs
            smallest_distance = this_distance
            closest_loc = this_loc
          end
        end
      end
    end
    return closest_loc
  end

end
