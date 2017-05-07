/**
 * 
 */
package com.f5infosol.businessbudgeter.domain;

import java.util.List;

/**
 * @author Jadhav
 * 
 */
public class RosterDetails {

	private int rosterId;
	private List<Roster> rosterDetails;

	public int getRosterId() {
		return rosterId;
	}

	public void setRosterId(int rosterId) {
		this.rosterId = rosterId;
	}

	public List<Roster> getRosterDetails() {
		return rosterDetails;
	}

	public void setRosterDetails(List<Roster> rosterDetails) {
		this.rosterDetails = rosterDetails;
	}

	@Override
	public String toString() {
		return "RosterDetails [rosterId=" + rosterId + ", rosterDetails=" + rosterDetails + "]";
	}

}
