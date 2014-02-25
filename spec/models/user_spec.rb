require 'spec_helper'

describe User do
  it { should have_many(:purchases) }
  it { should have_many(:songs).through(:purchases) }
  it { should have_many(:playlists) }
  it { should have_many(:playlist_users) }
  it { should have_many(:shared_playlists).through(:playlist_users) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:dob) }
  it { should validate_numericality_of(:balance).is_greater_than_or_equal_to(0) }

  describe "#purchase" do
    subject(:user) { FactoryGirl.create(:user, balance: original_balance) }
    
    let(:original_balance) { 4.00 }
    let(:tick_tok) { FactoryGirl.create(:song) }

    context "when affordable" do
      before { user.purchase(tick_tok) }

      it "adds the song to the users songs" do    
        expect(user.songs).to include(tick_tok)
      end

      it "debits the users balance" do
        expect(user.balance.to_f).to eq(original_balance - tick_tok.price)
      end
    end

    context "when not affordable" do
      before do 
        tick_tok.price = 6.00
        user.purchase(tick_tok)
      end

      it "doesn't add the song" do
        expect(user.songs).to_not include(tick_tok)
      end

      it "doesn't debit the user's balance" do
        expect(user.reload.balance.to_f).to eq(original_balance)
      end
    end
  end
end