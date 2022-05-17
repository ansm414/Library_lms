class Admin::RequestedBookPolicy < ApplicationPolicy
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
    admin?
  end
  def new?
    admin?
  end
  def update?
    admin?
  end
  
  def create?
    admin?
  end
  def edit?
   admin?
  end
  def destroy?
    admin?
  end
  def pendingbooks?
    admin?
  end
  def rejectedbooks?
   admin?
  end
  def savebook?
    admin?
  end
  def rejectbook?
   admin?
  end

  private
  def admin?
  user.role.name===ADMIN1
  end
end
