class UserPrivilege < Menilite::Privilege
  def key
    :user_privilege
  end

  def initialize(user)
    @user = user
  end

  def filter
    { user_id: @user.id }
  end

  def fields
    { user_id: @user.id }
  end
end
