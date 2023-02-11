# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :description
      t.date :due_date
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
