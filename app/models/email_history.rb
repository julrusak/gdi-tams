class EmailHistory < ActiveRecord::Base
  belongs_to :admin
  belongs_to :teaching_assistant

  validates_presence_of :date, :admin, :kind

  def self.monthly
    where(kind: "monthly")
  end

  def self.most_recent
    self.monthly.sort_by(&:date).last
  end
end