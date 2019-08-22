class SightingSerializer
    def initialize(sighting_object)
        # Need to access this variable in other methods within serializer,
        # so make it an instance variable w/ @.
        @sighting = sighting_object
    end
    
    def to_serialized_json
        options = {
            :include => {
                :bird => {
                    :only => [:name, :species]
                },
                :location => {
                    :only => [:latitude, :longitude]
                }
            },
            :except => [:updated_at]
        }
        @sighting.to_json(options)
    end
end