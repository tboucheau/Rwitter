class Tweet < ApplicationRecord
    before_action :authenticate_user!

end
