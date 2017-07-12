require 'rubygems'
require 'klout'
require 'pry'


Klout.api_key = ''

usernames = File.open('usernames.txt').read
usernames.each_line do |username|
	begin
		username.gsub!(/\n/,"")
		klout_id = Klout::Identity.find_by_screen_name(username)
		user = Klout::User.new(klout_id.id)
		text = "#{user.details["nick"]}, #{user.score["score"]}"
		text.delete!("\n")
		File.open('results.txt', 'a') { |file| file.puts text }
		sleep 0.2
	end
end
