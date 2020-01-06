require 'towers_of_hanoi'
require 'rspec'

describe TowersOfHanoi do
    subject(:game) { TowersOfHanoi.new }

    describe "move" do
        let(:start_pile) { 0 }
        let(:end_pile) { 2 }
        before (:each) { game.move(start_pile, end_pile) } 

        it "does not move bigger disk on top of smaller disk" do #[ [2, 3, 4] [] [1] ]
        game.move(start_pile, end_pile)
        expect(game.board[end_pile]).to eq([1])
        end

        it "only moves disk from top of pile" do
        expect(game.board[end_pile]).to eq([1])
        end
    end
    
    describe "won?" do #game.board = [ [1, 2, 3, 4] [] [] ]
        subject(:game_1) { TowersOfHanoi.new }

        before (:each) { game.board = [[], [], [1, 2, 3, 4]] }

        it "not won at start" do
            expect(game_1).not_to be_won
        end

        it "is won when all disks are moved to the middle or end pile" do
            expect(game).to be_won
        end
    end

end