require 'streamio-ffmpeg'

class Camera

  def initialize(snapshot_str, index)
    @snapshot_str = snapshot_str
    @index = index
  end

  def snapshot
    Dir.mkdir(Dir.pwd + '/'+ @index) unless Dir.exist?(Dir.pwd + '/'+ @index)
    `#{@snapshot_str.chomp!} #{current_file}.jpg`
  end

  def create_daily_video
    FFMPEG::Transcoder.new(
        '',
        "#{@index}/#{today}_#{@index}.mp4",
        {video_codec: 'libx264', x264_preset: 'slow', threads: 4},
        input: "*#{@index}.jpg",
        input_options: {framerate: '2', pattern_type: 'glob'}
    ).run
  end

  def cleanup
    `rm *_#{@index}.jpg`
  end

  def today
    `date +"%d-%m-%y"`.chomp!
  end

  def current_file
    "#{Dir.pwd}/#{@index}/#{now}_#{@index}"
  end

  def now
    `date +%Y%m%d%H%M%S`.chomp!
  end
end