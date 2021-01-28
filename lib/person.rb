class Person 
    attr_reader :name  #name cannot be changed
    attr_accessor :bank_account, :happiness, :hygiene #these attributes can change 

    def initialize(name)   #create a person class that is initialized with a name
        @name = name       #each instance of class Person should be able to remember their name
        @bank_account = 25 #each instance of class Person should start with $25 in their bank accounts
        @happiness = 8  # " " start with eight happiness points
        @hygiene = 8    # " " start with eight hygiene points
    end 

    def happiness=(value) # custom setter method for setting max/min value 
        if value > 10     # if value is over 10 or below 0, value will still be set to = 10 or 0
            value = 10
        elsif value < 0
            value = 0
        end
        @happiness = value  #set happiness to equal value that has max/min points of 0 and 10
    end

    def hygiene=(value) #same concept as above
        if value > 10
            value = 10
        elsif value < 0
            value = 0
        end
        @hygiene = value
    end


    def clean?  #return true if hygiene points exceed 7, otherwise they should return false
        if @hygiene > 7  #asking if above 7, setting condition 
            return true  #returning boolean values
        else false
        end  
    end

    def happy? #return true if the happiness points exceed 7, otherwise they should return false
        if @happiness > 7  #asking if above 7, setting condition 
            return true    #returning boolean values
        else false
        end 
    end

    def get_paid(salary) #accept argument of salary 
        @bank_account += salary #increments bank_account by the salary
        return "all about the benjamins"  #return a string
    end

    def take_bath
        self.hygiene += 4  #increment the person's hygiene points by four, call on hygiene method itself so not to exceed 10 or go below 0
        return "♪ Rub-a-dub just relaxing in the tub ♫"  #return a string
    end

    def work_out
        self.happiness += 2 #increment the person's happiness/hygiene pints (+/-), call on happiness/hygiene methods themselves so not to exceed 10 or go below 0
        self.hygiene -= 3
        return "♪ another one bites the dust ♫"
    end


    def call_friend(friend) #accept another instance, friend = Person.new("friend") 
        self.happiness += 3 #happiness of person calling, instance of person
        friend.happiness += 3
        return "Hi #{friend.name}! It's #{self.name}. How are you?" #accesses person's name and friend's name
    end 

    def start_conversation(person, topic) #accepts two arguments, a person and a topic
        people = [self, person]  # set array of people to iterate over so can make changes to both
        if topic == "politics"
            people.each { |p| p.happiness -= 2 } #iterates over both people's happiness to change happiness level 
            return "blah blah partisan blah lobbyist"
        elsif topic == "weather"
            people.each { |p| p.happiness += 1 } 
            return "blah blah sun blah rain"
        else 
            return "blah blah blah blah blah" # happiness doesn't change so no need to iterate
        end
    end
    
end

