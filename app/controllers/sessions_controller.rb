# require 'net/ldap'
class SessionsController < ApplicationController
  def new
  end

  def create
    ldap = Net::LDAP.new
    ldap.host = "192.168.1.40"
    ldap.auth "cn=admin,dc=sab,dc=com", "333111"
    result = ldap.bind_as(
      :base => "ou=user,dc=sab,dc=com",
      :filter => "(mail=#{params[:email]})",
      :password => "#{params[:password]}"
    )
    if result
      ldap_user = result.first
      ldap_id = ldap_user.uidnumber[0]
      user = User.find_by(ldap_id: ldap_id)
      if user
        session[:user_id] = user.id
        flash[:notice] = 'Успех'
        redirect_to root_url
      else
        role = case ldap_user.gidnumber[0]
        when '500'
          :trainer
        when '501'
          :sportsman
        else
          raise 'no such role'
        end
        user_attributes = {
          email: ldap_user.mail[0],
          encrypted_password: BCrypt::Password.create(params[:password]),
          first_name: ldap_user.givenname[0],
          last_name: ldap_user.sn[0],
          role: role,
          ldap_id: ldap_id.to_i,
        }
        user = User.new(user_attributes)
        if user.save
          session[:user_id] = user.id

          flash[:notice] = 'Успех'
          redirect_to root_url
        else
          session[:user_id] = nil
          flash[:alert] = 'Проблемы при входе'
          render :new
        end
      end
    else
      session[:user_id] = nil
      flash[:alert] = 'Проблемы при входе'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:alert] = 'Вы вышли'
    redirect_to root_url
  end
end
