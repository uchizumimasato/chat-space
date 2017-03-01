class UserGroup < ApplicationRecord
  be_longs :user
  be_longs :group
end
