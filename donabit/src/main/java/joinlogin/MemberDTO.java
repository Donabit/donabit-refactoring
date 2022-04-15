package joinlogin;


public class MemberDTO {
	private String email;
	private String nickname;
	private String password;
	private String phone;
	private String auth;
	private int enabled;
	
	private String level;
	private String avatar;
	
	public MemberDTO(){}

	public MemberDTO(String email, String nickname, String password, String phone, String auth, int enabled) {
		super();
		this.email = email;
		this.nickname = nickname;
		this.password = password;
		this.phone = phone;
		this.auth = auth;
		this.enabled = enabled;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	@Override
	public String toString() {
		return "MemberDTO [email=" + email + ", nickname=" + nickname + ", password=" + password + ", phone=" + phone
				+ ", auth=" + auth + ", enabled=" + enabled + ", level=" + level + ", avatar=" + avatar + "]";
	}
	
	
	
	
	

}
