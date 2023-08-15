require "./person"

class Student < Person
    def initialize (classroom, name = "Unknown", age, parent_permission = true)
        super(name, age, parent_permission)
        @classromm = classroom
    end

    super(name, age, parent_permission)

    def play_hooky
        "¯\(ツ)/¯"
    end
end