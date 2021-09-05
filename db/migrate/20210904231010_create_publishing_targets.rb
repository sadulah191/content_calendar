class CreatePublishingTargets < ActiveRecord::Migration[6.1]
  def change
    create_table :publishing_targets do |t|
      t.references :content_item, null: false, foreign_key: true
      t.references :social_network, null: false, foreign_key: true

      t.timestamps
    end
  end
end
