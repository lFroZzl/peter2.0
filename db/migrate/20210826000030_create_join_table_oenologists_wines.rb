class CreateJoinTableOenologistsWines < ActiveRecord::Migration[5.2]
  def change
    create_join_table :oenologists, :wines do |t|
      # t.index [:oenologist_id, :wine_id]
      # t.index [:wine_id, :oenologist_id]
    end
  end
end
