class SetInstantNotificationsDefault < ActiveRecord::Migration[6.0]
  class User < ApplicationRecord
    self.table_name = 'users'
  end

  def up
    change_column_default :users, :message_notifications, from: 'non', to: 'instant'
    change_column_default :users, :track_notifications, from: 'non', to: 'instant'

    User.where(message_notifications: ['non', nil]).update_all(message_notifications: 'instant')
    User.where(track_notifications: ['non', nil]).update_all(track_notifications: 'instant')
  end

  def down
    change_column_default :users, :message_notifications, from: 'instant', to: 'non'
    change_column_default :users, :track_notifications, from: 'instant', to: 'non'
  end
end

