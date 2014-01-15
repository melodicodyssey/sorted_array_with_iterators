require 'rspec'
require './sorted_array.rb'

shared_examples "yield to all elements in sorted array" do |method|
    specify do 
      expect do |b| 
        sorted_array.send(method, &b) 
      end.to yield_successive_args(2,3,4,7,9) 
    end
end

describe SortedArray do
  let(:source) { [2,3,4,7,9] }
  let(:sorted_array) { SortedArray.new source }

  describe "iterators" do
    describe "that don't update the original array" do 
      describe :each do
        context 'when passed a block' do
          it_should_behave_like "yield to all elements in sorted array", :each
        end

        it 'should return the array' do
          sorted_array.each {|el| el }.should eq source
        end
      end

      describe :map do
        it 'the original array should not be changed' do
          original_array = sorted_array.internal_arr
          expect { sorted_array.map {|el| el } }.to_not change { original_array }
        end

        it_should_behave_like "yield to all elements in sorted array", :map

        it 'creates a new array containing the values returned by the block' do
          # pending "fill this spec in with a meaningful example"
          original_array = sorted_array.internal_arr


        end
      end
    end

    describe "that update the original array" do
      describe :map! do
        it 'the original array should be updated' do
          # pending "fill this spec in with a meaningful example"
          # original_array = sorted_array.internal_arr
          # sorted_array.map {|el| el}
          # sorted_array.should != original_array
          expect {sorted_array.map!{|x| x*2}}.to change{sorted_array.internal_arr}.from([2,3,4,7,9]).to([4,6,8,14,18])
        end

        it_should_behave_like "yield to all elements in sorted array", :map!

        it 'should replace value of each element with the value returned by block' do
          # pending "this is just the same as the example above"
          sorted_array.map {|x| x*2}.should == [4,6,8,14,18]
        end
      end
    end
  end

  describe :find do
    #change below description to: stop after finding element
    # it_should_behave_like "yield to all elements in sorted array", :find

    it "should return nil if no matches exist" do
      # pending "define some examples by looking up http://www.ruby-doc.org/core-2.1.0/Enumerable.html#method-i-find"
      sorted_array.find{|x| x == 100}.should == nil
    end

    it "should return first value that evaluates to true" do
    sorted_array.find{|x| x == 3}.should == 3
  end
  end

  describe :inject do
    # it_should_behave_like "yield to all elements in sorted array", :inject

    it "iterates through an array while updating an accumulator value" do
      # pending "define some examples by looking up http://www.ruby-doc.org/core-2.1.0/Enumerable.html#method-i-inject"
      sorted_array.inject(0){|sum,el| sum + el}.should == 25
    end

    it "should use symbols" do
      sorted_array.inject(:+).should == 25
    end

    it "matches the .inject kernel" do
      sorted_array.inject(:+).should == source.inject(:+)
    end

  end
end
