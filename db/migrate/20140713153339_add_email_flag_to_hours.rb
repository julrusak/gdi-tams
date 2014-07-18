class AddEmailFlagToHours < ActiveRecord::Migration
  def change
    add_column :hours, :email_sent, :boolean, default: false
    # courses = Course.where(email_sent: true)
    # hours = Hour.where(course: courses)
    # hours.each { |hour| hour.update_attribute(email_sent, true) }
  end
end
