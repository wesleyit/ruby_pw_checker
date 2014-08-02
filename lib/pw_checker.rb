class PwChecker

    def initialize(password)
        @password = password
        @pwmethods = self.methods.select {|m| m[/rule_/]}
        @points = @pwmethods.size
    end

    def rule_has_good_length?
        return true if @password.length >= 8
        @points -= 1
        return false
    end

    def rule_has_lower_letters?
        return true if @password =~ /[[:lower:]]/
        @points -= 1
        return false
    end

    def rule_has_upper_letters?
        return true if @password =~ /[[:upper:]]/
        @points -= 1
        return false
    end

    def rule_has_numbers?
        return true if @password =~ /[[:digit:]]/
        @points -= 1
        return false
    end

    def rule_has_symbols?
        return true if @password =~ /[[:punct:]]/
        @points -= 1
        return false
    end

    def rule_has_different_letters?
        return true unless @password =~ /.*(.).*\1.*\1.*\1.*/
        @points -= 1
        return false
    end

    def rule_has_different_consecutive_letters?
        return true unless @password =~ /(.)\1{3}/
        @points -= 1
        return false
    end

    def rule_is_an_unknown_word?
        dictionary = File.read('dictionary.txt')
        return true unless dictionary.include? @password
        @points -= 1
        return false
    end

    def rule_has_few_vowels?
        return true unless @password =~ /.*[aeiou].*[aeiou].*[aeiou].*[aeiou].*/
        @points -= 1
        return false
    end

    def classification
        @pwmethods.each {|m| self.send(m)}
        puts "Points: #{@points} of a total of #{@pwmethods.size}."
        @problems = @pwmethods.size - @points
        return "weak" if @problems > 6
        return "medium" if @problems > 3
        return "strong"
    end

end
