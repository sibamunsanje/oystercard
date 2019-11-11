
require "Oystercard"

describe Oystercard do
  it "has a balance of zero" do
    expect(subject.balance).to eq(0)
  end



  describe "top_up" do
    it {is_expected.to respond_to(:top_up).with(1).argument}

    it "can top up the balance" do
      expect{subject.top_up 1}.to change{subject.balance}.by 1
    end

    it "raises an error when the top up balance is exceeded" do
      max_balance = Oystercard::MAX_BALANCE
      expect { subject.top_up(max_balance + 0.01) }.to raise_error("max balance #{max_balance} exceeded")
    end
  end



  describe "deduct" do
    it {is_expected.to respond_to(:deduct).with(1).argument}

    it "can deduct the balance" do
      subject.top_up(10)
      expect {subject.deduct 5}.to change{subject.balance}.by -5
    end

    end



    describe "in_journey" do
      it "is initially not in a journey" do
        expect(subject).not_to be_in_journey
      end
      it "can touch in" do
        expect(subject).to be_in_journey
      end
      it "can touch out" do
        subject.touch_in
        subject.touch_out
        expect(subject).not_to be_in_journey
      end
    end


end
