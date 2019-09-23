class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :url
      t.string :source
      t.string :image
      t.text :more

      t.timestamps
    end
  end
end
