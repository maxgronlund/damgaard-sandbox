class Ability
  include CanCan::Ability

  def initialize(user)
    if user 
      if user.super?
        can :manage, :all
      elsif user.admin?
        can :edit, Backdrop
        can :edit, Company
        can :read, Company
        can :edit, GalleryImage
        can :edit, Menu
        can :edit, Page
        can :edit, User
        
      #elsif user.member?
      #  # Ordinary user
      #  can :manage, User, :id => user.id # <--- Allow user to manage them self
      #
      #  
      #  # add application-specific changes below
      #
      end
    else
      # When not logged in
      #can :create, User # <----------- Uncomment this to alow users to signup by them self
      can :read, Page

      
      # add application-specific changes below
      
      
    end
  end
end
