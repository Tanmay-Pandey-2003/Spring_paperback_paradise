package project.Main;

public interface IUserDao {
	public boolean userRegister(User us);

	public User login(String email, String password);

	public boolean checkpassword(int id, String ps);

	public boolean updateProfile(User us);

	public boolean checkUser(String email);
}
