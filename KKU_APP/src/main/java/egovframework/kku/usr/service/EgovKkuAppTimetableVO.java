package egovframework.kku.usr.service;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class EgovKkuAppTimetableVO extends ComDefaultVO implements Serializable{
	public String timetableSubnum;
	public String timetableSubname;
	
	public String searchGrade;
	public String searchMajor;
	
	public String lectureStdgrade;
	public String lectureCategory;
	public String lectureSubnum;
	public String lectureName;
	public String lectureCredit;
	public String lectureMajor;
	public String lectureTime;
	public String lectureProfname;
	
	private String reviewIdx;
	
	public String timetableIdx;
	public String timetableUsridx;
	public String timetableStarttime;
	public String timetableEndtime;
	public String timetableDay;
	public String timetableUpdated;
	public String timetableLectureroom;
	
	public String getTimetableLectureroom() {
		return timetableLectureroom;
	}

	public void setTimetableLectureroom(String timetableLectureroom) {
		this.timetableLectureroom = timetableLectureroom;
	}

	public String subname;
	public String subnum;
	public int usrTimetable;
	public String usrIdx;

	public String getUsrIdx() {
		return usrIdx;
	}

	public void setUsrIdx(String usrIdx) {
		this.usrIdx = usrIdx;
	}

	public int getUsrTimetable() {
		return usrTimetable;
	}

	public void setUsrTimetable(int usrTimetable) {
		this.usrTimetable = usrTimetable;
	}

	public String getTimetableSubnum() {
		return timetableSubnum;
	}

	public void setTimetableSubnum(String timetableSubnum) {
		this.timetableSubnum = timetableSubnum;
	}

	public String getTimetableSubname() {
		return timetableSubname;
	}

	public void setTimetableSubname(String timetableSubname) {
		this.timetableSubname = timetableSubname;
	}
	
	public String getSubname() {
		return subname;
	}

	public void setSubname(String subname) {
		this.subname = subname;
	}

	public String getSubnum() {
		return subnum;
	}

	public void setSubnum(String subnum) {
		this.subnum = subnum;
	}

	public String getTimetableStarttime() {
		return timetableStarttime;
	}

	public void setTimetableStarttime(String timetableStarttime) {
		this.timetableStarttime = timetableStarttime;
	}

	public String getTimetableEndtime() {
		return timetableEndtime;
	}

	public void setTimetableEndtime(String timetableEndtime) {
		this.timetableEndtime = timetableEndtime;
	}
	
	public String getTimetableIdx() {
		return timetableIdx;
	}

	public void setTimetableIdx(String timetableIdx) {
		this.timetableIdx = timetableIdx;
	}

	public String getTimetableUsridx() {
		return timetableUsridx;
	}

	public void setTimetableUsridx(String timetableUsridx) {
		this.timetableUsridx = timetableUsridx;
	}

	public String getTimetableDay() {
		return timetableDay;
	}

	public void setTimetableDay(String timetableDay) {
		this.timetableDay = timetableDay;
	}

	public String getTimetableUpdated() {
		return timetableUpdated;
	}

	public void setTimetableUpdated(String timetableUpdated) {
		this.timetableUpdated = timetableUpdated;
	}

	public String getLectureStdgrade() {
		return lectureStdgrade;
	}

	public void setLectureStdgrade(String lectureStdgrade) {
		this.lectureStdgrade = lectureStdgrade;
	}

	public String getLectureCategory() {
		return lectureCategory;
	}

	public void setLectureCategory(String lectureCategory) {
		this.lectureCategory = lectureCategory;
	}

	public String getLectureSubnum() {
		return lectureSubnum;
	}

	public void setLectureSubnum(String lectureSubnum) {
		this.lectureSubnum = lectureSubnum;
	}

	public String getLectureName() {
		return lectureName;
	}

	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}

	public String getLectureCredit() {
		return lectureCredit;
	}

	public void setLectureCredit(String lectureCredit) {
		this.lectureCredit = lectureCredit;
	}

	public String getLectureMajor() {
		return lectureMajor;
	}

	public void setLectureMajor(String lectureMajor) {
		this.lectureMajor = lectureMajor;
	}

	public String getLectureTime() {
		return lectureTime;
	}

	public void setLectureTime(String lectureTime) {
		this.lectureTime = lectureTime;
	}

	public String getLectureProfname() {
		return lectureProfname;
	}

	public void setLectureProfname(String lectureProfname) {
		this.lectureProfname = lectureProfname;
	}

	public String getSearchGrade() {
		return searchGrade;
	}
	

	public void setSearchGrade(String searchGrade) {
		this.searchGrade = searchGrade;
	}
	public String getSearchMajor() {
		return searchMajor;
	}
	public void setSearchMajor(String searchMajor) {
		this.searchMajor = searchMajor;
	}


	public String getReviewIdx() {
		return reviewIdx;
	}

	public void setReviewIdx(String reviewIdx) {
		this.reviewIdx = reviewIdx;
	}

	
}
