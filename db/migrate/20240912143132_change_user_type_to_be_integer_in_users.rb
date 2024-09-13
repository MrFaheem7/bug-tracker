class ChangeUserTypeToBeIntegerInUsers < ActiveRecord::Migration[7.2]
  def change
    change_column :users, :user_type,'integer USING  CAST(user_type AS integer)'
  end
end
