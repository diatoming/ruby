class Robot
        attr_accessor :location

        def initialize
                @location = 0
        end

        def move(dir, step)
                if dir=='F'
                        @location = @location + step
                elsif dir=='B'
                        @location = @location - step
                end
        end

        def position
                @location
        end
end
