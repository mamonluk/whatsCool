desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  
  if Time.now.min % 2 == 0 # run every four hours
    puts "Updating feed..."
   
    puts "done."
  end

  
end