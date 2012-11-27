class Message < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title    :string
    category :string
    timestamps
  end
  
  #belongs_to :customer
  attr_accessible :title, :category,:customers
  
  has_many :message_sends, :dependent => :destroy
  has_many :customers ,:through => :message_sends, :accessible => true, :dependent => :destroy
  
  children :customers
  

  
  #view_hints.parent :customer

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
