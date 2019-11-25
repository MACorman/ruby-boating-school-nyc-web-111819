class Instructor

    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def boating_test
        BoatingTest.all.select {|bt| bt.instructor == self}
    end

    def find_test(student, test_name)
        boating_test.select do |bt| 
            bt.student == student && bt.test_name == test_name
       end
    end

    def pass_student(student, test_name)
         test_taken = find_test(student, test_name)
         if test_taken == [] 
            BoatingTest.new(student, test_name, "passed", self)
         else
            test_taken[0].test_status = "passed"
            test_taken
            
         end 
    end

    def fail_student(student, test_name)
        test_taken = find_test(student, test_name)
         if test_taken == [] 
            BoatingTest.new(student, test_name, "failed", self)
         else
            test_taken[0].test_status = "failed"
            test_taken
            
         end 
    end

end
