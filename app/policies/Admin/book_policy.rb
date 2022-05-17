class Admin::BookPolicy < ApplicationPolicy
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
   edit?
  end
  def create?
    new?
  end
  def edit?
    admin?
  end
  def destroy?
    admin?
  end
  def availablebooks?
    admin?
  end
  def unavailablebooks?
    admin?
  end

  private

      def admin?
       user.role.name===ADMIN1
      end


end
