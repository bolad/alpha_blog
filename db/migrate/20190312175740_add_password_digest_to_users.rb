class AddPasswordDigestToUsers < ActiveRecord::Migration[5.2]
  def change
              #table name #column title #data type
    add_column :users, :password_digest, :string
  end
end
