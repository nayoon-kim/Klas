package section;

public class SectionDTO {
	String Secid;
	String Pid;
	String Semester;
	String Year;
	String Courseid;
	String Building;
	String Roomnum;
	String schedule;
	
	String Coursename;
	
	/*public SectionDTO(String s_Secid,String s_Coursename, String s_schedule ){
		this.Secid = s_Secid;
		this.Coursename = s_Coursename;
		this.schedule = s_schedule;
	}*/
	
	public String getCoursename() {
		return Coursename;
	}
	public void setCoursename(String coursename)
	{
		Coursename = coursename;
	}
	public String getSecid() {
		return Secid;
	}
	public void setSecid(String secid) {
		Secid = secid;
	}
	public String getPid() {
		return Pid;
	}
	public void setPid(String pid) {
		Pid = pid;
	}
	public String getSemester() {
		return Semester;
	}
	public void setSemester(String semester) {
		Semester = semester;
	}
	public String getYear() {
		return Year;
	}
	public void setYear(String year) {
		Year = year;
	}
	public String getCourseid() {
		return Courseid;
	}
	public void setCourseid(String courseid) {
		Courseid = courseid;
	}
	public String getBuilding() {
		return Building;
	}
	public void setBuilding(String building) {
		Building = building;
	}
	public String getRoomnum() {
		return Roomnum;
	}
	public void setRoomnum(String roomnum) {
		Roomnum = roomnum;
	}
	public String getSchedule() {
		return schedule;
	}
	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}
}
