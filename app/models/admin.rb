# == Schema Information
#
# Table name: admins
#
#  id                  :integer          not null, primary key
#  first_name          :string(255)      not null
#  last_name           :string(255)      not null
#  email               :string(255)      default(""), not null
#  encrypted_password  :string(255)      default(""), not null
#  remember_created_at :datetime
#  sign_in_count       :integer          default(0), not null
#  current_sign_in_at  :datetime
#  last_sign_in_at     :datetime
#  current_sign_in_ip  :inet
#  last_sign_in_ip     :inet
#  failed_attempts     :integer          default(0), not null
#  unlock_token        :string(255)
#  locked_at           :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  username            :string(255)      not null
#
# Indexes
#
#  index_admins_on_email         (email)
#  index_admins_on_unlock_token  (unlock_token) UNIQUE
#  index_admins_on_username      (username) UNIQUE
#

class Admin < ActiveRecord::Base
  devise :database_authenticatable, :lockable, :rememberable, :trackable, :validatable

  has_many :tidbits

  # Gives admin user's full name
  def name
    "#{first_name} #{last_name}"
  end

  # Gives admin user's first name and last initial
  # TODO: remove if I'm not going to use it anywhere
  def shy_name
    "#{first_name} #{last_name[0]}."
  end
end
