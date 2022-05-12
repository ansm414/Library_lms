class Admin::DueAmountPolicy < ApplicationPolicy
    class Scope < Scope
      # NOTE: Be explicit about which records you allow access to!
      # def resolve
      #   scope.all
      # end
    end
    attr_reader :user, :record
  
    def initialize(user, record)
      @user = user
      @record = record
    end
    def index?
      user.role.name==="Admin"

    end
    def paidfines?
      user.role.name==="Admin"

    end

    def unpaidfines?
      user.role.name==="Admin"

    end

    def new?
      user.role.name==="Admin"

    end
    def update?
      user.role.name==="Admin"

    end
    
    def create?
      user.role.name==="Admin"

    end
    def edit?
      user.role.name==="Admin"

    end
    def destroy?
      user.role.name==="Admin"

    end
    def pendingbooks?
      user.role.name==="Admin"

    end
    def rejectedbooks?
      user.role.name==="Admin"

    end
    def savebook?
      user.role.name==="Admin"

    end
    def rejectbook?
      user.role.name==="Admin"

    end
  
  
  end
  