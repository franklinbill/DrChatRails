class ReadFlag < ActiveRecord::Base
    belongs_to :message

    sync :all
end
