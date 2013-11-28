class Ability
  include CanCan::Ability

    def initialize(user)
      user ||= User.new # guest user

      if user.role? 'admin'
        can :manage, :all
      elsif user.role? 'core-team'
        
      elsif user.role? 'school-admin'
       
      elsif user.role? 'school-volunteer'
              
      elsif user.role? 'program-volunteer'
        
      else
        can :index, School
        can [:new,:show,:create],SchoolVolunteer
        can [:index],PlasticCollectionEvent
        can [:show],School
      end
        
      
    end
    
    
    
    
end
