class RolePermission < ApplicationRecord
  belongs_to :Role
  belongs_to :Permission
end
