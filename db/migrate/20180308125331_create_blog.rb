class CreateBlog < ActiveRecord::Migration[5.1]
  def change
    create_table :statuses do |t|
      t.string :status
      t.belongs_to :user

      t.timestamps
    end
  end
end
