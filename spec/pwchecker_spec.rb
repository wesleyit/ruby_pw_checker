# encoding: UTF-8

require 'spec_helper'
require 'pw_checker'

describe PwChecker do

    before do
        @password = PwChecker.new("Q1w2e3r4T5%%")
    end

    describe '#has_good_length?' do
        it "must contain at least 8 characters" do
            expect(@password.has_good_length?).to eq(true)
        end
    end

    describe '#has_lower_letters?' do
        it "must contain at least a lowercase letter" do
            expect(@password.has_lower_letters?).to eq(true)
        end
    end

    describe '#has_upper_letters?' do
        it "must contain at least a uppercase letter" do
            expect(@password.has_upper_letters?).to eq(true)
        end
    end

    describe '#has_numbers?' do
        it "must contain at least a number" do
            expect(@password.has_numbers?).to eq(true)
        end
    end

    describe '#has_symbols?' do
        it "must contain at least a symbol" do
            expect(@password.has_symbols?).to eq(true)
        end
    end

    describe '#has_different_letters?' do
        it "must not repeat 4 times the same character" do
            expect(@password.has_different_letters?).not_to eq(true)
        end
    end

    describe '#has_different_consecutive_letters?' do
        it "must not repeat consecutively 4 times the same character" do
            expect(@password.has_different_consecutive_letters?).not_to eq(true)
        end
    end

    describe '#is_an_unknown_word?' do
        it "must not be a dictonary word" do
            expect(@password.is_an_unknown_word?).not_to eq(true)
        end
    end

    describe '#has_few_vowels?' do
        it "must not have more than 4 vowels" do
            expect(@password.has_few_vowels?).not_to eq(true)
        end
    end

    describe '#classification'do
        it "must receive a classification" do
            expect(["weak", "medium", "strong"]).to include(@password.classification)
        end
    end

end
