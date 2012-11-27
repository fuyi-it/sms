class Customer < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name  :string
    phone :string
    timestamps
  end
  attr_accessible :name, :phone,:messages
  
  has_many :message_sends, :dependent => :destroy
  has_many :messages , :accessible => true, :dependent => :destroy  ,:through => :message_sends
  
  children :messages

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
