# == Schema Information
#
# Table name: users
#
#  id                 :bigint(8)        not null, primary key
#  email              :string
#  encrypted_password :string
#  role               :integer
#  ldap_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_users_on_email    (email) UNIQUE
#  index_users_on_ldap_id  (ldap_id) UNIQUE
#

class User < ApplicationRecord
end
