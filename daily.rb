require_relative 'camera'

camera_strings = File.readlines 'cameras'
camera_strings.each_with_index do |c, i|
  camera = Camera.new(c, 'cam_' + i.to_s)
  camera.create_daily_video
  camera.cleanup
end