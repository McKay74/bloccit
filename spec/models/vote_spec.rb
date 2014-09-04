describe Vote do
  describe "validations" do 

    before do
      v2 = Vote.new( value: -1)
    end

    describe "value validation" do 
      it "only allows -1 as value" do
        expect( v2.value? ).to eq(true)
      end
    end
  end
end