package lecture;

public class LectureDTO {
	private String title;
	private String _update;
	private int _view;
	private int _upno;
	private String content;
	private String CUrl;
	private String CFName;
	private String sectionID;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String get_update() {
		return _update;
	}
	public void set_update(String _update) {
		this._update = _update;
	}
	public int get_view() {
		return _view;
	}
	public void set_view(int _view) {
		this._view = _view;
	}
	public int get_upno() {
		return _upno;
	}
	public void set_upno(int _upno) {
		this._upno = _upno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCUrl() {
		return CUrl;
	}
	public void setCUrl(String cUrl) {
		CUrl = cUrl;
	}
	public String getCFName() {
		return CFName;
	}
	public void setCFName(String cFName) {
		CFName = cFName;
	}
	public String getSectionID() {
		return sectionID;
	}
	public void setSectionID(String sectionID) {
		this.sectionID = sectionID;
	}

}
