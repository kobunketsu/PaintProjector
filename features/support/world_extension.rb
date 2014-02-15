module KnowsUser
  def login
    visit('/login')
    fill_in('User name', with: user.name)
    fill_in('Password', with: user.password)
    click_button('Log in')
  end

  def user
    @user ||= User.create!(:name => 'Aslak', :password => 'xyz')
  end
end
World(KnowsUser)