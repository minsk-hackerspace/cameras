require_relative 'camera'

camera_strings = File.readlines 'cameras'
cameras = []
camera_strings.each_with_index { |c, i| cameras << Camera.new(c, 'cam_' + i.to_s) }
cameras.each { |camera| camera.snapshot }

sleep 30

camera_strings = File.readlines 'cameras'
cameras = []
camera_strings.each_with_index { |c, i| cameras << Camera.new(c, 'cam_' + i.to_s) }
cameras.each { |camera| camera.snapshot }