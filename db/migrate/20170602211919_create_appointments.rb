class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :patient, null: false
      t.references :doctor, null: false
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false

      t.timestamps null: false
    end
  end
end
