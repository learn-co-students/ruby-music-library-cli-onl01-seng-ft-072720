module Concerns::Findable
    def find_by_name(name) 
        self.all.find {|instance|  instance.name == name}
    end

    def find_or_create_by_name(find)
        s = self.find_by_name(find)
        if s != nil 
            s
        else 
            self.create(find)
        end
    end

end
