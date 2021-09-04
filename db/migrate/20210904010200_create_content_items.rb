class CreateContentItems < ActiveRecord::Migration[6.1]
  def change
    create_table :content_items do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
