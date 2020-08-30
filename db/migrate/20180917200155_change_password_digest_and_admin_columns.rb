class ChangePasswordDigestAndAdminColumns < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :password_digest, nil
    change_column_default :users, :admin, false
  end
end
