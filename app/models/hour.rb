class Hour < ActiveRecord::Base
  belongs_to :teaching_assistant
  belongs_to :course

  validates_presence_of :num, :teaching_assistant, :course, :email_sent

  validates :teaching_assistant, uniqueness: {scope: :course}

  scope :credit, -> { where("num >= ?", 0) }
  scope :debit, -> { where("num < ?", 1) }

  def is_credit?
    num > 0
  end

  def is_debit?
    num < 0
  end
end
