class UserSerializer < ActiveModel::Serializer
  attributes :id
  attributes :last_name
  attributes :first_name
  attributes :email
end