class CreateEmailHistories < ActiveRecord::Migration
  def change
    create_table :email_histories do |t|
      t.date :date
      t.references :admin, index: true
      t.string :kind
      t.references :teaching_assistant
    end
  end
end
