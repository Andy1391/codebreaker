require_relative "../lib/codebreaker/game.rb"

module Codebreaker
  RSpec.describe Game do
    let(:game) { Game.new }

    describe '#create secret code' do

      before(:each) { game.send(:start) }

      it 'create not empty secret code' do
      expect(game.instance_variable_get(:@secret_code)).not_to be_empty
      end

      it 'include 4 numbers only' do
      expect(game.instance_variable_get(:@secret_code).size).to eq(4)
      end

      it 'in the range 0 to 6' do
      expect(game.instance_variable_get(:@secret_code)).to all((be >= 0).and(be <= 6))
      end
    end   

    describe '#count_plus' do

      before(:each) { game.instance_variable_set(:@secret_code, [1, 2, 3, 4]) }

      it 'return "++++"' do
      expect(game.send(:count_plus,[1, 2, 3, 4])).to eq(["+", "+", "+", "+"])
      end

      it 'return "+++"' do
      expect(game.send(:count_plus, [5, 2, 3, 4])).to eq(["+", "+", "+"])
      end

      it 'return "++"' do
      expect(game.send(:count_plus, [2, 2, 3, 3])).to eq(["+", "+"])
      end

      it 'return "+"' do
      expect(game.send(:count_plus, [1, 1, 1, 1])).to eq(["+"])
      end 

      it 'no return plus' do
      expect(game.send(:count_plus, [2, 1, 4, 3])).to be_empty
      end           
    end

    describe '#count_minus' do

      before(:each) { game.instance_variable_set(:@secret_code, [2, 3, 4, 5]) }

      it 'return "----"' do
      expect(game.send(:count_minus, [5, 4, 3, 2])).to eq(["-", "-", "-", "-"])
      end

      it 'return "---"' do
      expect(game.send(:count_minus, [5, 4, 3, 1])).to eq(["-", "-", "-"])
      end

      it 'return "--"' do
      expect(game.send(:count_minus, [5, 4, 4, 2])).to eq(["-", "-"])
      end

      it 'return "-"' do
      expect(game.send(:count_minus, [5, 6, 6, 6])).to eq(["-"])
      end

      it 'no return minus' do
      expect(game.send(:count_minus, [0, 0, 1, 6])).to be_empty
      end
    end     
  end      
end