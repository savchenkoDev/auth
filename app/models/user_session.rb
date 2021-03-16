class UserSession < Sequel::Model
  plugin :uuid

  many_to_one :user

  def validate
    super
    validates_presence :uuid
  end
end
