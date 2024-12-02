# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.integer :entity_id
      t.string :event_type
      t.json :data

      t.timestamps
    end
  end
end
