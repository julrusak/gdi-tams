namespace :data do
  desc "Update existing TA hours to set email_sent flag"
  task :hours_email_sent => :environment do
    courses = Course.where(email_sent: true)
    if courses.length > 0
      puts "Updating hours for #{courses.length} courses..."
      hours = Hour.where(course: courses)
      hours.each do |hour|
        hour.update_attribute(:email_sent, true)
        puts "Hour for #{hour.teaching_assistant.name} updated."
      end
    else
      puts "No Course Hours to update."
    end
  end
end