package springdemo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="user_donation")
public class UserDonation {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;

	@Column(name="name")
	private String name;
	
	@Column(name="money")
	private int money;
	
	@Column(name="date")
	private String date;
	
	@Column(name="message")
	private String message;
	
	@Column(name="status")
	private int status;
	
	@OneToOne
	@JoinColumn(name="donation_id")
	private Donation donation;
	
	@OneToOne
	@JoinColumn(name="user_id")
	private User user;
	
	public UserDonation() {
		// TODO Auto-generated constructor stub
	}

	public UserDonation(String name, int money, String date, String message, int status, Donation donation, User user) {
		this.name = name;
		this.money = money;
		this.date = date;
		this.message = message;
		this.status = status;
		this.donation = donation;
		this.user = user;
	}


	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Donation getDonation() {
		return donation;
	}

	public void setDonation(Donation donation) {
		this.donation = donation;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "UserDonation [id=" + id + ", name=" + name + ", money=" + money + ", date=" + date + ", message="
				+ message + ", status=" + status + ", donation=" + donation + ", user=" + user + "]";
	}

}
