package meokjang.vo;


//	회원정보
public class MemberVO {

	private String ID;			// 아이디
	private String password;	// 비밀번호
	private String nickName;	// 닉네임
	private String name;		// 이름
	private int age;			// 나이
	private String gender;		// 성별
	private String jumin;	    // 주민번호
	private String email;		// 이메일
	private String telephone;	// 전화번호
	private String postcode;	// 우편번호
	private String address;		// 주소
	private String detailAddress;	// 상세주소
	private String extraAddress;	// 참고항목
	
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getExtraAddress() {
		return extraAddress;
	}
	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}
	
	@Override
	public String toString() {
		return "MemberVO [ID=" + ID + ", password=" + password + ", nickName=" + nickName + ", name=" + name + ", age="
				+ age + ", gender=" + gender + ", jumin=" + jumin + ", email=" + email + ", telephone=" + telephone
				+ ", postcode=" + postcode + ", address=" + address + ", detailAddress=" + detailAddress
				+ ", extraAddress=" + extraAddress + "]";
	}
	
}

