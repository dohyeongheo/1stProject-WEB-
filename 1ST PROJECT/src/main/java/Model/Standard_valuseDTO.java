package Model;

public class Standard_valuseDTO {

	private String sensor_type;
	private int st_value;
	private int w_seq;
	
	public Standard_valuseDTO(String sensor_type, int st_value, int w_seq) {
		super();
		this.sensor_type = sensor_type;
		this.st_value = st_value;
		this.w_seq = w_seq;
	}

	public Standard_valuseDTO(String sensor_type, int st_value) {
		super();
		this.sensor_type = sensor_type;
		this.st_value = st_value;
	}

	public String getSensor_type() {
		return sensor_type;
	}

	public void setSensor_type(String sensor_type) {
		this.sensor_type = sensor_type;
	}

	public int getSt_value() {
		return st_value;
	}

	public void setSt_value(int st_value) {
		this.st_value = st_value;
	}

	public int getW_seq() {
		return w_seq;
	}

	public void setW_seq(int w_seq) {
		this.w_seq = w_seq;
	}
	
	
	
	
	
}
