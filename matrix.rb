require 'matrix'
module MyTest

end

describe MyTest do
    it "add" do
        expect(1 + 1).to eq(2)
    end
    it "add fail" do
        expect(1 + 1).to eq(3)
    end
    it "mult pas" do
        expect(1*2).to eq(2)
    end
end
