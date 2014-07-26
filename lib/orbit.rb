includes = [
	'orbit/orbit_globals',
	'orbit/geocentric_coordinates',
	'orbit/topocentric_horizon_coordinates',
	'orbit/julian',
	'orbit/norad_base',
	'orbit/norad_sgp4',
	'orbit/norad_sdp4',
	'orbit/eci',
	'orbit/site',
	'orbit/satellite',
	'orbit/tle',
	'orbit/orbit',
	'orbit/vector',
	'date',
]

if defined?(Motion::Project::App)
  Motion::Project::App.setup do |app|
    includes.each do |file|
      app.files << File.join(File.dirname(__FILE__), file)
    end
  end
else
	includes.each do |incl|
		require incl
	end
end

module Orbit

end

# Testing
# tle_string = "CUBESAT XI-V (CO-58)\n1 28895U 05043F   12264.16320281  .00000287  00000-0  67805-4 0  2813\n2 28895  97.9003 126.1967 0016829 209.8455 150.1749 14.60744896367522"
#
# tle = Orbit::Tle.new( tle_string )
# o   = Orbit::Orbit.new( tle )
# eci = o.get_position( ( Time.new.utc.to_f - tle.epoch.to_f ) / 60.0 )
# puts eci
# puts eci.to_geo