package party;

public class PartyDTO {
	private int PartyIDX;
	private int party_BoardIDX;
	private String party_Writer;
	private String party_User;
	
	public int getPartyIDX() {
		return PartyIDX;
	}
	public void setPartyIDX(int partyIDX) {
		PartyIDX = partyIDX;
	}
	public int getParty_BoardIDX() {
		return party_BoardIDX;
	}
	public void setParty_BoardIDX(int party_BoardIDX) {
		this.party_BoardIDX = party_BoardIDX;
	}
	public String getParty_Writer() {
		return party_Writer;
	}
	public void setParty_Writer(String party_Writer) {
		this.party_Writer = party_Writer;
	}
	public String getParty_User() {
		return party_User;
	}
	public void setParty_User(String party_User) {
		this.party_User = party_User;
	}
}
