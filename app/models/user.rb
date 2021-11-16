class User < ActiveRecord::Base
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by(email: email).try(:authenticate, password)
    if @user
      @user
    else
      nil
    end
  end


end

