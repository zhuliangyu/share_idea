class AddPaperclipToIdea < ActiveRecord::Migration[5.0]
  def change
    add_attachment :ideas, :image


  end
end
