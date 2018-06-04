require 'net/ldap'
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
      session[:email] = params[:email]
      session[:group_id] = result.first.gidnumber
      redirect_to root_url, notice: 'Logged in!'
      puts "Authenticated"
    else
      render :new
      puts "Authentication FAILED."
    end
  end

  def destroy
    session[:email] = nil
    session[:group_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
