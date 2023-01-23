package egovframework.kku.adm.service;

public class EgovKkuAdmRestaurantMenuVO {
	private String restIdx;
	private String mainMenuIdx;
	private String mainMenuName;
	private String mainMenuDesc;
	private String mainMenuPrice;
	private String addSubMenu;
	


	private String subMenuIdx;
	private String subMenuName;
	private String subMenuDesc;
	private String subMenuPrice;
	
	public String getAddSubMenu() {
		return addSubMenu;
	}
	public void setAddSubMenu(String addSubMenu) {
		this.addSubMenu = addSubMenu;
	}
	
	public String getRestIdx() {
		return restIdx;
	}
	public void setRestIdx(String restIdx) {
		this.restIdx = restIdx;
	}
	public String getMainMenuIdx() {
		return mainMenuIdx;
	}
	public void setMainMenuIdx(String mainMenuIdx) {
		this.mainMenuIdx = mainMenuIdx;
	}
	public String getMainMenuName() {
		return mainMenuName;
	}
	public void setMainMenuName(String mainMenuName) {
		this.mainMenuName = mainMenuName;
	}
	public String getMainMenuDesc() {
		return mainMenuDesc;
	}
	public void setMainMenuDesc(String mainMenuDesc) {
		this.mainMenuDesc = mainMenuDesc;
	}
	public String getMainMenuPrice() {
		return mainMenuPrice;
	}
	public void setMainMenuPrice(String mainMenuPrice) {
		this.mainMenuPrice = mainMenuPrice;
	}
	public String getSubMenuIdx() {
		return subMenuIdx;
	}
	public void setSubMenuIdx(String subMenuIdx) {
		this.subMenuIdx = subMenuIdx;
	}
	public String getSubMenuName() {
		return subMenuName;
	}
	public void setSubMenuName(String subMenuName) {
		this.subMenuName = subMenuName;
	}
	public String getSubMenuDesc() {
		return subMenuDesc;
	}
	public void setSubMenuDesc(String subMenuDesc) {
		this.subMenuDesc = subMenuDesc;
	}
	public String getSubMenuPrice() {
		return subMenuPrice;
	}
	public void setSubMenuPrice(String subMenuPrice) {
		this.subMenuPrice = subMenuPrice;
	}
	@Override
	public String toString() {
		return "EgovKkuAdmRestaurantMenuVO [restIdx=" + restIdx + ", mainMenuIdx=" + mainMenuIdx + ", mainMenuName="
				+ mainMenuName + ", mainMenuDesc=" + mainMenuDesc + ", mainMenuPrice=" + mainMenuPrice + ", addSubMenu="
				+ addSubMenu + ", subMenuIdx=" + subMenuIdx + ", subMenuName=" + subMenuName + ", subMenuDesc="
				+ subMenuDesc + ", subMenuPrice=" + subMenuPrice + "]";
	}
	
	
}
