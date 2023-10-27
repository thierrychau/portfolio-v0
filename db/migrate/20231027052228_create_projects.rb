class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.date :date
      t.text :description
      t.boolean :featured, default: true
      t.string :url
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
