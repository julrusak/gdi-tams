module EmailHistoriesHelper
  def log_email(kind, recipient=nil)
    EmailHistory.create!(
      admin: Admin.find_by_id(session[:current_user_id]),
      kind: kind,
      date: Date.today,
      teaching_assistant: recipient
      )
  end
end