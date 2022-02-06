class AddUserIdToBankAccounts < ActiveRecord::Migration[6.1]
  def change
    remove_column :bank_accounts, :user_id, :integer
    add_reference :bank_accounts, :user, null: false, foreign_key: true
  end
end
