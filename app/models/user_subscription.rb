class UserSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :subscription

  def update_status(status=nil)
    if status == nil
      status = active
    end
    update(active: status)
  end

end
