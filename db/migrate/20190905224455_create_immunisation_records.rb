# frozen_string_literal: true

class CreateImmunisationRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :immunisation_records do |t|
      t.string :feijoa_id
      t.jsonb :data

      t.timestamps
    end
  end
end
