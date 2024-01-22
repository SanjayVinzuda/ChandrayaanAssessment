# spec/galactic_space_craft_spec.rb
require 'rspec'
require_relative './galactic_space_craft'

RSpec.describe GalacticSpaceCraft do
  describe '#process_commands' do
    context 'when executing movement commands' do
      it 'moves forward correctly' do
        craft = GalacticSpaceCraft.new([0, 0, 0], 'N')
        craft.process_commands(['f'])
        expect(craft.position).to eq([0, 1, 0])
      end

      it 'moves backward correctly' do
        craft = GalacticSpaceCraft.new([0, 0, 0], 'N')
        craft.process_commands(['b'])
        expect(craft.position).to eq([0, -1, 0])
      end
    end

    context 'when executing rotation commands' do
      it 'turns left correctly' do
        craft = GalacticSpaceCraft.new([0, 0, 0], 'N')
        craft.process_commands(['l'])
        expect(craft.direction).to eq('W')
      end

      it 'turns right correctly' do
        craft = GalacticSpaceCraft.new([0, 0, 0], 'N')
        craft.process_commands(['r'])
        expect(craft.direction).to eq('E')
      end
    end

    context 'when executing angle change commands' do
      it 'changes angle up correctly' do
        craft = GalacticSpaceCraft.new([0, 0, 0], 'N')
        craft.process_commands(['u'])
        expect(craft.direction).to eq('Up')
      end

      it 'changes angle down correctly' do
        craft = GalacticSpaceCraft.new([0, 0, 0], 'N')
        craft.process_commands(['d'])
        expect(craft.direction).to eq('Down')
      end
    end

    context 'when executing a sequence of commands' do
      it 'follows the example correctly' do
        craft = GalacticSpaceCraft.new([0, 0, 0], 'N')
        craft.process_commands(['f', 'r', 'u', 'b', 'l'])
        expect(craft.position).to eq([0, 1, -1])
      end
    end
  end
end
