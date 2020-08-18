module  Concerns::Findable
    
    def find_by_name(name)
        self.all.find {|item| item.name == name}
    end

    def find_or_create_by_name(name)
        find = self.find_by_name(name)
            if find == nil
                self.create(name)
            else
                find    
            end
    end
end