package egovframework.kku.usr.service;

import java.io.Serializable;
import egovframework.com.cmm.ComDefaultVO;

public class EgovKkuAppSchoolInfoRestaurantVO extends ComDefaultVO implements Serializable{
	public String restIdx;
	public String restName;
	public String restMenucategory;
	public String restOpentime;
	public String restDescription;
	public String restAddr;
	public String restContact;
	public String deliveryYn;
	public String eventYn;
	
	/*메뉴*/
	public String menuIdx = "";
	public String menuName = "";
	public String menuDesc = "";
	public String menuPrice = "";
	public String addMenu = "";
	public String addMenuPrice = "";
	public String showYn = "";
	public String delDate = "";
	public String delYn ="";
	public String filPath = "";
	public String filSrvname = "";
	public String filUsrname = "";
	public String mainYn = "";
	
	/*음식점 장바구니*/
	public String basketIdx = "";
	public String menuCnt = "";
	public String menuTotalPrice = "";
	
	/*주문 정보*/
	public String orderInfoIdx = "";
	public String orderNum = "";
	public String deliveryMethod = "";
	public String disposableYn = "";
	public String orderRequestDes = "";
	public String address = "";
	public String addressDetailed = "";
	public String payPrice = "";
	public String payOption = "";
	public String orderState = "";
	
	public String getRestIdx() {
		return restIdx;
	}
	public void setRestIdx(String restIdx) {
		this.restIdx = restIdx;
	}
	public String getRestName() {
		return restName;
	}
	public void setRestName(String restName) {
		this.restName = restName;
	}
	public String getRestMenucategory() {
		return restMenucategory;
	}
	public String getOrderInfoIdx() {
		return orderInfoIdx;
	}
	public void setOrderInfoIdx(String orderInfoIdx) {
		this.orderInfoIdx = orderInfoIdx;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getDeliveryMethod() {
		return deliveryMethod;
	}
	public void setDeliveryMethod(String deliveryMethod) {
		this.deliveryMethod = deliveryMethod;
	}
	public String getDisposableYn() {
		return disposableYn;
	}
	public void setDisposableYn(String disposableYn) {
		this.disposableYn = disposableYn;
	}
	public String getOrderRequestDes() {
		return orderRequestDes;
	}
	public void setOrderRequestDes(String orderRequestDes) {
		this.orderRequestDes = orderRequestDes;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressDetailed() {
		return addressDetailed;
	}
	public void setAddressDetailed(String addressDetailed) {
		this.addressDetailed = addressDetailed;
	}
	public String getPayPrice() {
		return payPrice;
	}
	public void setPayPrice(String payPrice) {
		this.payPrice = payPrice;
	}
	public String getPayOption() {
		return payOption;
	}
	public void setPayOption(String payOption) {
		this.payOption = payOption;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	public void setRestMenucategory(String restMenucategory) {
		this.restMenucategory = restMenucategory;
	}
	public String getRestOpentime() {
		return restOpentime;
	}
	public void setRestOpentime(String restOpentime) {
		this.restOpentime = restOpentime;
	}
	public String getRestDescription() {
		return restDescription;
	}
	public void setRestDescription(String restDescription) {
		this.restDescription = restDescription;
	}
	public String getRestAddr() {
		return restAddr;
	}
	public void setRestAddr(String restAddr) {
		this.restAddr = restAddr;
	}
	public String getRestContact() {
		return restContact;
	}
	public void setRestContact(String restContact) {
		this.restContact = restContact;
	}
	public String getDeliveryYn() {
		return deliveryYn;
	}
	public void setDeliveryYn(String deliveryYn) {
		this.deliveryYn = deliveryYn;
	}
	public String getEventYn() {
		return eventYn;
	}
	public void setEventYn(String eventYn) {
		this.eventYn = eventYn;
	}
	public String getMenuIdx() {
		return menuIdx;
	}
	public void setMenuIdx(String menuIdx) {
		this.menuIdx = menuIdx;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuDesc() {
		return menuDesc;
	}
	public void setMenuDesc(String menuDesc) {
		this.menuDesc = menuDesc;
	}
	public String getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(String menuPrice) {
		this.menuPrice = menuPrice;
	}
	public String getAddMenu() {
		return addMenu;
	}
	public void setAddMenu(String addMenu) {
		this.addMenu = addMenu;
	}
	public String getAddMenuPrice() {
		return addMenuPrice;
	}
	public void setAddMenuPrice(String addMenuPrice) {
		this.addMenuPrice = addMenuPrice;
	}
	public String getShowYn() {
		return showYn;
	}
	public void setShowYn(String showYn) {
		this.showYn = showYn;
	}
	public String getDelDate() {
		return delDate;
	}
	public void setDelDate(String delDate) {
		this.delDate = delDate;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getFilPath() {
		return filPath;
	}
	public void setFilPath(String filPath) {
		this.filPath = filPath;
	}
	public String getFilSrvname() {
		return filSrvname;
	}
	public void setFilSrvname(String filSrvname) {
		this.filSrvname = filSrvname;
	}
	public String getFilUsrname() {
		return filUsrname;
	}
	public void setFilUsrname(String filUsrname) {
		this.filUsrname = filUsrname;
	}
	public String getMainYn() {
		return mainYn;
	}
	public void setMainYn(String mainYn) {
		this.mainYn = mainYn;
	}
	public String getBasketIdx() {
		return basketIdx;
	}
	public void setBasketIdx(String basketIdx) {
		this.basketIdx = basketIdx;
	}
	public String getMenuCnt() {
		return menuCnt;
	}
	public void setMenuCnt(String menuCnt) {
		this.menuCnt = menuCnt;
	}
	public String getMenuTotalPrice() {
		return menuTotalPrice;
	}
	public void setMenuTotalPrice(String menuTotalPrice) {
		this.menuTotalPrice = menuTotalPrice;
	}
	
	@Override
	public String toString() {
		return "EgovKkuAppSchoolInfoRestaurantVO [restIdx=" + restIdx + ", restName=" + restName + ", restMenucategory="
				+ restMenucategory + ", restOpentime=" + restOpentime + ", restDescription=" + restDescription
				+ ", restAddr=" + restAddr + ", restContact=" + restContact + ", deliveryYn=" + deliveryYn
				+ ", eventYn=" + eventYn + ", menuIdx=" + menuIdx + ", menuName=" + menuName + ", menuDesc=" + menuDesc
				+ ", menuPrice=" + menuPrice + ", addMenu=" + addMenu + ", addMenuPrice=" + addMenuPrice + ", showYn="
				+ showYn + ", delDate=" + delDate + ", delYn=" + delYn + ", filPath=" + filPath + ", filSrvname="
				+ filSrvname + ", filUsrname=" + filUsrname + ", mainYn=" + mainYn + ", basketIdx=" + basketIdx
				+ ", menuCnt=" + menuCnt + ", menuTotalPrice=" + menuTotalPrice + ", orderInfoIdx=" + orderInfoIdx
				+ ", orderNum=" + orderNum + ", deliveryMethod=" + deliveryMethod + ", disposableYn=" + disposableYn
				+ ", orderRequestDes=" + orderRequestDes + ", address=" + address + ", addressDetailed="
				+ addressDetailed + ", payPrice=" + payPrice + ", payOption=" + payOption + ", orderState=" + orderState
				+ "]";
	}
	
}
