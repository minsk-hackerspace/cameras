set :output, '/home/ubuntu/cameras/cron_log.log'

every 1.minute do
  command 'cd /home/ubuntu/cameras && `which ruby` /home/ubuntu/cameras/every_minute.rb'
end

# every 1.day, at: '0:01 am' do
every 5.minutes do
  command 'cd /home/ubuntu/cameras && `which ruby` /home/ubuntu/cameras/daily.rb'
end