package laptop.model;

import java.util.List;

public class order {
	private List<item> listItem;

	public order(List<item> listItem) {
		super();
		this.listItem = listItem;
	}

	public List<item> getListItem() {
		return listItem;
	}

	public void setListItem(List<item> listItem) {
		this.listItem = listItem;
	}

	public order() {
		super();
	}

}
