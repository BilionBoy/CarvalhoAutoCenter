class CreateTestimonials < ActiveRecord::Migration[7.1]
  def change
    create_table :testimonials do |t|
      t.string :name
      t.string :profession
      t.text :content

      t.timestamps
    end
  end
end
