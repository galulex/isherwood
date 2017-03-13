class ReviewPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    user.present? && user == review.user
  end

  def destroy?
    user.present? && user == review.user
  end

  private

    def review
      record
    end
end
