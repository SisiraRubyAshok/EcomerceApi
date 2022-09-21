class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :jwt_authenticatable,
    jwt_revocation_strategy: JwtDenylist
    after_create :create_cart_for_user
    has_one :cart, dependent: :destroy

    private
      def create_cart_for_user
        self.create_cart
      end
end
